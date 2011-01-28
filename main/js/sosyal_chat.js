$(document).ready(function() {
	//console.log("index.js DOM Yuklendi.");
	activateMain();	
	$("#rcnt").prepend('<div id="uyari" class="uyari"></div><div id="scu" class="rounded"></div><br class="clear" /><hr />');
	chat.init();
	getScript("/main/js/sosyal_extra.js");
});

var chat = {
	data : {lastID : 0,noActivity: 0},
	init : function(){
		var working = false;
		
		$("#sclf").validate({
			debug: false,
			errorLabelContainer: $("#uyari"),
			rules: {
				name: "required",
				email: { required: true, email: true }
			},
			messages: {
				name: "Takma ad girin!<br />",
				email: {required:"Bir e-mail adresi girin!<br />",email:"E-mail formatını kontrol edin!<br />"}
			},
			submitHandler: function(form) {
				if(working) return false;
				working = true;
				$.itPOST('login',$("#sclf").serialize(),function(r){
					working = false;
					if(r.error)
						chat.displayError(r.error);
					else chat.login(r.name,r.gravatar);
					//window.log(r);
				});
				return false;
			}
		});
		
		$("#scsf").validate({
				debug: false,
				errorLabelContainer: $("#uyari"),
				rules: {	scct: "required" },
				messages: {scct: "Bir mesaj girin!<br />"},
				submitHandler: function(form) {
					var text = $('#scct').val();
					if(text.length == 0)
						return false;
					if(working) return false;
					$('#scct').val('');
					working = true;
					var tempID = 't'+Math.round(Math.random()*1000000),
						params = {id	: tempID,author	: chat.data.name,gravatar : chat.data.gravatar,text : text.replace(/</g,'&lt;').replace(/>/g,'&gt;')};
					chat.addChatLine($.extend({},params));
					$.itPOST('submitChat',$("#scsf").serialize(),function(r){
						working = false;
						$('div.chat-'+tempID).remove();
						params['id'] = r.insertID;
						chat.addChatLine($.extend({},params));
					});
					return false;
				}
		});
		
		$('a.sclb').live('click',function(){
			$('#sctb > span').fadeOut(function(){ $(this).remove();});
			$('#scsf').fadeOut(function(){$('#sclf').fadeIn();});
			$.itPOST('logout');
			//socket.close();
			//window.log("logout");
			return false;
		});
		
		$.itGET('checkLogged',function(r){if(r.logged){chat.login(r.loggedAs.name,r.loggedAs.gravatar);}});

/*		if(Modernizr.websockets)
		{
			var socket = new WebSocket('ws://tasdemir.0fees.net/main/ajax/chatSocket:8080'); 
			socket.onopen = function(event) { 
 				socket.send('OK'); 
				socket.onmessage = function(event) {
					chat.getSocketAdd(JSON.parse(event.data),callback);
				};
	  			socket.onclose = function(event) { 
	  			}; 
  			}; 
		}
		else
		{
*/

		(function getChatsTimeoutFunction(){chat.getChats(getChatsTimeoutFunction);	})();
		(function getUsersTimeoutFunction(){chat.getUsers(getUsersTimeoutFunction); })();
//}
	},
	
	login : function(name,gravatar){
		chat.data.name = name;
		chat.data.gravatar = gravatar;
		$('#sctb').html(chat.render('loginTopBar',chat.data));
		$('#sclf').fadeOut(function(){
			$('#scsf').fadeIn();
			$('#scct').focus();
		});
		//window.log("login");
	},
	
	render : function(template,params){
		var arr = [];
		switch(template){
			case 'loginTopBar':
				arr = [
				'<span><img src="',params.gravatar,'" width="23" height="23" />',
				'<span class="name">',params.name,
				'</span><a href="" class="sclb rounded">Logout</a></span>'];
			break;
			case 'chatLine':
				arr = [
					'<div class="chat chat-',params.id,' rounded"><span class="gravatar"><img src="',params.gravatar,
					'" width="23" height="23" onload="this.style.visibility=\'visible\'" />','</span><span class="author">',params.author,
					':</span><span class="text">',params.text,'</span><time>',params.time,'</time></div>'];
			break;
			case 'user':
				arr = [
					'<div class="user" title="',params.name,'"><img src="',
					params.gravatar,'" width="30" height="30" onload="this.style.visibility=\'visible\'" /></div>'
				];
			break;
		}
		
		return arr.join('');
	},
	
	addChatLine : function(params){
		var d = new Date();
		var chatHolder=$('#sclh');
		if(params.time) 
			d.setUTCHours(params.time.hours,params.time.minutes);
		params.time = (d.getHours() < 10 ? '0' : '' ) + d.getHours()+':'+(d.getMinutes() < 10 ? '0':'') + d.getMinutes();
		var markup = chat.render('chatLine',params),exists = chatHolder.find('.chat-'+params.id);
		if(exists.length)
			exists.remove();
		if(!chat.data.lastID)
			chatHolder.find('p').remove();
		if(params.id.toString().charAt(0) != 't')
		{
			var previous = chatHolder.find('.chat-'+(+params.id - 1));
			if(previous.length)
				previous.before(markup);
			else chatHolder.prepend(markup);
		}
		else chatHolder.prepend(markup);
		//window.log(markup);
	},
	
	getChats : function(callback){
			$.itGET('getChats',{lastID: chat.data.lastID},function(r){
				chat.getChatsAdd(r,callback);
			});
	},

	getChatsAdd : function(r,callback){
		for(var i=0;i<r.chats.length;i++)
				chat.addChatLine(r.chats[i]);
			if(r.chats.length)
			{
				chat.data.noActivity = 0;
				chat.data.lastID = r.chats[i-1].id;
			}
			else
				chat.data.noActivity++;
			if(!chat.data.lastID)
				$('#sclh').html('<p class="noChats">Mesaj yok!</p>');
			var nextRequest = 1000;
			if(chat.data.noActivity > 3)
				nextRequest = 2000;
			if(chat.data.noActivity > 10)
				nextRequest = 5000;
			if(chat.data.noActivity > 20)
				nextRequest = 15000;
			setTimeout(callback,nextRequest);
			//window.log(nextRequest);
	},
	
	getUsers : function(callback){
			$.itGET('getUsers',function(r){
				chat.getUsersAdd(r,callback);
			});
	},

	getUsersAdd : function(r,callback){
		var users = [];
		if(r.total<1)
			message = 'Odada kimse yok!';
		else 
			message = r.total+' kişi var!';
		users.push('<p class="kisi">'+message+'</p>');
		for(var i=0; i< r.users.length;i++)
			if(r.users[i])
				users.push(chat.render('user',r.users[i]));
		var message = '';
		$('#scu').html(users.join(''));
		setTimeout(callback,15000);
		//window.log("login");
	},
	
	displayError : function(msg){
		var elem = $('<div>',{id : 'sccem',html: msg});
		elem.click(function(){$(this).fadeOut(function(){$(this).remove();});});
		setTimeout(function(){elem.click();},5000);
		elem.hide().appendTo('body').slideDown();
		//window.log(msg);
	}
};

$.itPOST = function(action,data,callback){
	$.post('/main/sosyal/ajax?chat='+action,data,callback,'json');
}

$.itGET = function(action,data,callback){
	$.get('/main/sosyal/ajax?chat='+action,data,callback,'json');
}
