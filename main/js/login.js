function MaskedPassword(passfield, symbol)
{
	if(typeof document.getElementById == 'undefined' || typeof document.styleSheets == 'undefined') { return false; }
	if(passfield == null) { return false; }
	this.symbol = symbol;
	this.isIE = typeof document.uniqueID != 'undefined';
	passfield.value = '';
	passfield.defaultValue = '';
	passfield._contextwrapper = this.createContextWrapper(passfield);
	this.fullmask = false; 
	var wrapper = passfield._contextwrapper, 
		hiddenfield = '<input type="hidden" name="' + passfield.name + '">',
		textfield = this.convertPasswordFieldHTML(passfield);
	wrapper.innerHTML = hiddenfield + textfield;
	passfield = wrapper.lastChild;
	passfield.className += ' masked';
	passfield.setAttribute('autocomplete', 'off');
	passfield._realfield = wrapper.firstChild;
	passfield._contextwrapper = wrapper;
	this.limitCaretPosition(passfield);
	var self = this;
	this.addListener(passfield, 'change', function(e) 
	{ 
		self.fullmask = false; 
		self.doPasswordMasking(self.getTarget(e)); 
	});
	this.addListener(passfield, 'input', function(e) 
	{ 
		self.fullmask = false; 
		self.doPasswordMasking(self.getTarget(e)); 
	});
	this.addListener(passfield, 'propertychange', function(e) 
	{ 
		self.doPasswordMasking(self.getTarget(e)); 
	});
	this.addListener(passfield, 'keyup', function(e) 
	{ 
		if(!/^(9|1[678]|224|3[789]|40)$/.test(e.keyCode.toString()))
		{
			self.fullmask = false; 
			self.doPasswordMasking(self.getTarget(e));
		}
	});
	this.addListener(passfield, 'blur', function(e) 
	{ 
		self.fullmask = true; 
		self.doPasswordMasking(self.getTarget(e)); 
	});
	this.forceFormReset(passfield);
	return true;
}

MaskedPassword.prototype =
{
	doPasswordMasking : function(textbox)
	{
		var plainpassword = '';
		if(textbox._realfield.value != '')
			for(var i=0; i<textbox.value.length; i++)
				if(textbox.value.charAt(i) == this.symbol)
					plainpassword += textbox._realfield.value.charAt(i);
				else
					plainpassword += textbox.value.charAt(i);
		else 
			plainpassword = textbox.value; 
		var maskedstring = this.encodeMaskedPassword(plainpassword, this.fullmask, textbox);
		if(textbox._realfield.value != plainpassword || textbox.value != maskedstring)
		{
			textbox._realfield.value = plainpassword;
			textbox.value = maskedstring;
		}
	},
	encodeMaskedPassword : function(passwordstring, fullmask, textbox)
	{
		var characterlimit = fullmask === true ? 0 : 1;
		for(var maskedstring = '', i=0; i<passwordstring.length; i++)
			if(i < passwordstring.length - characterlimit) 
				maskedstring += this.symbol; 
			else 
				maskedstring += passwordstring.charAt(i); 
		return maskedstring;
	},
	createContextWrapper : function(passfield)
	{
		var wrapper = document.createElement('span');
		wrapper.style.position = 'relative';
		passfield.parentNode.insertBefore(wrapper, passfield);
		wrapper.appendChild(passfield);
		return wrapper;
	},
	forceFormReset : function(textbox)
	{
		while(textbox)
		{
			if(/form/i.test(textbox.nodeName)) { break; }
			textbox = textbox.parentNode;
		}
		if(!/form/i.test(textbox.nodeName)) { return null; }
		this.addSpecialLoadListener(function() { textbox.reset(); });
		return textbox;
	},
	convertPasswordFieldHTML : function(passfield, addedattrs)
	{
		var textfield = '<input';
		for(var fieldattributes = passfield.attributes, j=0; j<fieldattributes.length; j++)
			if(fieldattributes[j].specified && !/^(_|type|name)/.test(fieldattributes[j].name))
				textfield += ' ' + fieldattributes[j].name + '="' + fieldattributes[j].value + '"';
		textfield += ' type="text" autocomplete="off">';
		return textfield;
	},
	limitCaretPosition : function(textbox)
	{
		var timer = null, start = function()
		{
			if(timer == null) 
			{
				if(this.isIE)
				{
					timer = window.setInterval(function() 
					{ 
						var range = textbox.createTextRange(),
							valuelength = textbox.value.length,
							character = 'character';
						range.moveEnd(character, valuelength);
						range.moveStart(character, valuelength);
						range.select();				
					}, 100);
				}
				else
				{
					timer = window.setInterval(function() 
					{ 
						var valuelength = textbox.value.length;
						if(!(textbox.selectionEnd == valuelength && textbox.selectionStart <= valuelength))
						{
							textbox.selectionStart = valuelength;
							textbox.selectionEnd = valuelength;
						}
					}, 100);
				}
			}
		},
		stop = function()
		{
			window.clearInterval(timer);
			timer = null;
		};
		this.addListener(textbox, 'focus', function() { start(); });
		this.addListener(textbox, 'blur', function() { stop(); });
	},
	addListener : function(eventnode, eventname, eventhandler)
	{
		if(typeof document.addEventListener != 'undefined')
			return eventnode.addEventListener(eventname, eventhandler, false);
		else if(typeof document.attachEvent != 'undefined')
			return eventnode.attachEvent('on' + eventname, eventhandler);
	},
	addSpecialLoadListener : function(eventhandler)
	{
		if(this.isIE)
			return window.attachEvent('onload', eventhandler);
		else
			return document.addEventListener('DOMContentLoaded', eventhandler, false);
	},
	getTarget : function(e)
	{
		if(!e) { return null; }
		return e.target ? e.target : e.srcElement;
	}
};


function ShowPasswordCheckbox(passfield)
{
	if(typeof document.getElementById == 'undefined' || typeof document.styleSheets == 'undefined') { return false; }
	if(passfield == null) { return false; }
	passfield._contextwrapper = this.createContextWrapper(passfield);
	var passboxwrapper = passfield._contextwrapper,
		textfield = this.convertPasswordFieldHTML(passfield),
		labelkey = Math.round(Math.random() * 1000);
	var showlabel = '<label'
				  + ' for="showpasscheckbox-' + labelkey + '"'
				  + ' class="show-password"'
				  + ' title="Şifreyi yazı olarak göster tavsiye edilmez."'
				  + '>';
	showlabel += '<input type="checkbox"'
				  + ' id="showpasscheckbox-' + labelkey + '"'
				  + ' title="Şifreyi yazı olarak göster tavsiye edilmez."'
				  + '>';
	showlabel += '<span>Şifreyi Göster</span>';
	showlabel += '</label>';
	passboxwrapper.innerHTML += textfield + showlabel;
	var textfield = passboxwrapper.lastChild.previousSibling,
		tickbox = passboxwrapper.lastChild.firstChild;
	passfield = passboxwrapper.firstChild;
	passfield._plainfield = textfield;
	textfield._passwordfield = passfield;
	tickbox._passwordfield = passfield;
	tickbox._plainfield = textfield;
	passfield._contextwrapper = passboxwrapper;
	var self = this;
	this.addListener(passfield, 'change', function(e)
	{
		var textbox = self.getTarget(e);
		textbox._plainfield.value = textbox.value;
	});
	this.addListener(textfield, 'change', function(e)
	{
		var textbox = self.getTarget(e);
		textbox._passwordfield.value = textbox.value;
	});
	this.addListener(tickbox, 'click', function(e)
	{
		var tickbox = self.getTarget(e),
		showfield = tickbox.checked ? tickbox._plainfield : tickbox._passwordfield,	hidefield = tickbox.checked ? tickbox._passwordfield : tickbox._plainfield;
		showfield.value = hidefield.value;
		showfield.style.display = 'inline';
		hidefield.style.display = 'none';
	});
	var parentform = this.getParentForm(passfield);
	if(parentform)
	{
		parentform._plainfield = textfield;
		parentform._passwordfield = passfield;
		this.addListener(parentform, 'submit', function(e)
		{
			var parentform = self.getTarget(e);
			if(parentform._plainfield.style.display == 'inline')
				parentform._passwordfield.value = parentform._plainfield.value;
		});
	}
	return true;
}
ShowPasswordCheckbox.prototype =
{
	createContextWrapper : function(passfield)
	{
		var wrapper = document.createElement('span');
		wrapper.style.position = 'relative';
		passfield.parentNode.insertBefore(wrapper, passfield);
		wrapper.appendChild(passfield);
		return wrapper;
	},
	getParentForm : function(textbox)
	{
		while(textbox)
		{
			if(/form/i.test(textbox.nodeName)) { break; }
			textbox = textbox.parentNode;
		}
		if(!/form/i.test(textbox.nodeName)) { return null; }
		return textbox;
	},
	convertPasswordFieldHTML : function(passboxref)
	{
		var textfield = '<input';
		for(var fieldattributes = passboxref.attributes, j=0; j<fieldattributes.length; j++)
			if(fieldattributes[j].specified && !/^(_|type|name)/.test(fieldattributes[j].name))
				textfield += ' ' + fieldattributes[j].name + '="' + fieldattributes[j].value + '"';
		textfield += ' type="text" style="display:none" autocomplete="off">';
		return textfield;
	},
	addListener : function(eventnode, eventname, eventhandler)
	{
		if(typeof document.addEventListener != 'undefined')
			return eventnode.addEventListener(eventname, eventhandler, false);
		else if(typeof document.attachEvent != 'undefined')
			return eventnode.attachEvent('on' + eventname, eventhandler);
	},
	getTarget : function(e)
	{
		if(!e) { return null; }
			return e.target ? e.target : e.srcElement;
	}

}

function CapsLockWarning(passfield)
{
	if(typeof document.getElementById == 'undefined' || typeof document.styleSheets == 'undefined') { return false; }
	if(passfield == null || typeof passfield._capslockwarning != 'undefined') { return false; }
	var contextwrapper = this.createContextWrapper(passfield),
		warningnode = contextwrapper.appendChild(document.createElement('strong'));
	passfield._capslockwarning = warningnode;		
	warningnode.className = 'capslock-warning';
	warningnode.appendChild(document.createTextNode('Caps-lock açık!'));
	warningnode.setAttribute('title', warningnode.firstChild.nodeValue);
	var self = this;
warningnode.style.display="none";
	this.addListener(passfield, 'keypress', function(e)
	{
		var passboxref = self.getTarget(e),warningnode = passboxref._capslockwarning,
			charcode = e.charCode;
		if(typeof charcode == 'undefined') { charcode = e.keyCode; }
		var character = String.fromCharCode(charcode);
		if(/^[A-Z]$/.test(character) && !e.shiftKey)
			warningnode.style.display = 'inline';
		else if(warningnode.style.display == 'inline')
			warningnode.style.display = 'none';
	});
	this.addListener(passfield, 'blur', function(e)
	{
		var passboxref = self.getTarget(e),warningnode = passboxref._capslockwarning;
		if(warningnode.style.display == 'inline')
			warningnode.style.display = 'none';
	});
	this.addListener(passfield, 'keydown', function(e)
	{
		var passboxref = self.getTarget(e),warningnode = passboxref._capslockwarning;
		if(e.keyCode == 20 && warningnode.style.display == 'inline')
			warningnode.style.display = 'none';
	});
	return true;
}

CapsLockWarning.prototype =
{
	createContextWrapper : function(passfield)
	{
		var wrapper = document.createElement('span');
		wrapper.style.position = 'relative';
		passfield.parentNode.insertBefore(wrapper, passfield);
		wrapper.appendChild(passfield);
		return wrapper;
	},
	addListener : function(eventnode, eventname, eventhandler)
	{
		if(typeof document.addEventListener != 'undefined')
			return eventnode.addEventListener(eventname, eventhandler, false);
		else if(typeof document.attachEvent != 'undefined')
			return eventnode.attachEvent('on' + eventname, eventhandler);
	},
	getTarget : function(e)
	{
		if(!e) { return null; }
		return e.target ? e.target : e.srcElement;
	}
}

var objData;
String.prototype.replaceAt=function(i, c) {	return this.substr(0, i) + c + this.substr(i+c.length);	};

$(document).ready(function(){
	new ShowPasswordCheckbox(document.getElementById("password"));
	new MaskedPassword(document.getElementById("login"), '\u25CF');
   new CapsLockWarning(document.getElementById("password"));
   new CapsLockWarning(document.getElementById("login"));
   
   	var $droptarget = $('#idBox'), $idCardSrc = $('#idCardSrc'), $idBoxBg = $('#idBoxBg'),
	$pinBox = $('#pinBox'), $pinInput = $('input', $pinBox);

	$droptarget.bind('dragenter', function(e) {
		e.stopPropagation();
		e.preventDefault();
		$droptarget.addClass('drophover');
		$idBoxBg.text('Drop it now');
		return false;
	});
	$droptarget.bind('dragleave', function(e) {
		e.stopPropagation();
		e.preventDefault();
		$droptarget.removeClass('drophover');
		$idBoxBg.text('Drop ID file here');
		return false;
	});
	$droptarget.bind('dragover', function(e) {
		e.stopPropagation();
		e.preventDefault();
	});
	document.getElementById('idBox').addEventListener('drop', function(e) {
		e.stopPropagation();
		e.preventDefault();
	}, false);
   
   	document.getElementById('idBox').addEventListener('drop', function(e) {
		e.stopPropagation();
		e.preventDefault();

		var dt = e.dataTransfer,
			files = dt.files,
			reader = new FileReader();
		reader.onload = function(e) {
			try {
				objData = $.parseJSON(e.target.result);
			} catch(exception) {
				$droptarget.removeClass('drophover');
				$idBoxBg.text('Tanım dosyasını buraya bırakın...');
				alert("Hatalı dosya");
				return true;
			}
			if(typeof objData === "undefined") {
				$idBoxBg.text('Tanım dosyasını buraya bırakın...');
				alert("Hatalı dosya");
				return true;
			}
			$idCardSrc.find('img:eq(0)').attr('src', getResim(objData.userdata.id,"muzik"));
			var tmp = "<li><span>İsim:</span><b>"+   objData.userdata.isim +  "</b></li>"+
			"<li><span>Soyisim:</span><b>" +  objData.userdata.soyisim +  "</b></li>"+
			"<li><span>Doğum Tarihi:</span><b>" +  objData.userdata.dogum +  "</b></li>";
			$idCardSrc.find('.idCardValues').html(tmp);
			$droptarget.unbind().html($idCardSrc.html());
			$pinBox.slideDown();
			return false;
		};
		reader.readAsText(files[0]);
		return false;
	}, false);

	$pinInput.keyup(function(e) {
		var $this = $(this);
		if($this.val().length == 4) {
			if(isNaN($this.val())){
				alert('Sadece sayılar.');
				$this.val("");
				return;
			}
			$this.attr('disabled', 'disabled');
			var key = objData.keys.auth,
				values = $this.val().split('');
			for(var i in values) 
				key = key.replaceAt(values[i], "");
			$.post('/main/login/ajax', {key: key, userid: objData.userdata.id}, function(data) {
				if(data != "ok") 
				{
					$pinInput.removeAttr('disabled').val("");
					alert(	"Tanımlanmamış kullanıcı ve ya yanlış PIN");
				}
				else
					window.location.replace("/main/aile");
			});
		}
	});

	var feedback = $('#feedback');
	feedback.find('h3').click(function(){
		var anim= {mb : 0,pt : 25};
		var el = $(this).find('.arrow');
		if(el.hasClass('down')) anim = {mb : -270,pt : 10};

		feedback.stop().animate({marginBottom: anim.mb});
		feedback.find('.section').stop().animate({paddingTop:anim.pt},function(){el.toggleClass('down up');});
	});
	
	feedback.find('a').bind('click',function(){
		var button = $(this);
		var textarea = feedback.find('textarea');
		if(button.hasClass('working') || textarea.val().length < 5)
			return false;
		button.addClass('working');
		$.ajax({
			url : '/main/login/mesaj',
			type : 'post',
			data : { message : textarea.val()},
			complete : function(xhr){
				var text = xhr.responseText;
				button.fadeOut();
				textarea.fadeOut(function(){
					var span = $('<span>',{	className: 'response', html: text}).hide()	.appendTo(feedback.find('.section')).show();
				}).val('');
			}
		});
		return false;
	});

});

