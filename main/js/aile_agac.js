$(document).ready(function() {	

	activateMain();

	$.getScript("http://www.datatables.net/download/build/jquery.dataTables.min.js", function () {
		$('#datagrid').dataTable({"bJQueryUI": true,"bStateSave": true,"sPaginationType": "full_numbers",
		"oLanguage": {
				"sLengthMenu": "Sayfada _MENU_ kayıt görünüyor",
				"sZeroRecords": "Kayıt bulunamadı!",
				"sInfo": " _START_ - _END_ arası kayıt. Toplam: _TOTAL_ ",
				"sInfoEmpty": "0 - 0 arası kayıt. Toplam: 0",
				"sInfoFiltered": "(_MAX_ kayıt arasından)"
			},
		"sScrollX": "100%",	
		"bScrollCollapse": true,
		"aLengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "Hepsi"]],
		"bLengthChange":true,
		"iDisplayLength": 5
	   });
	});

	$.getScript("http://github.com/themouette/jquery-week-calendar/raw/master/jquery.weekcalendar.js", function () {
		$('#calendar_wrapper').weekCalendar({
			'data':'/main/ajax/takvim',
readonly:true,allowCalEventOverlap : true,overlapEventsSeparate: true,draggable :true,timeFormat:"h",use24Hour:true, dateFormat: "Y-m-d",timeSeparator:"-",resizable :true,buttonText:{today : "Bugün", lastWeek : "<", nextWeek : ">"},newEventText:"Yeni Olay",shortMonths:["Oca", "Şub", "Mar", "Nis", "May", "Haz", "Tem", "Ağu", "Eyl", "Ekm", "Kas", "Ara"],longMonths: ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"],shortDays:["Paz", "Pzt", "Sal", "Çar", "Per", "Cum", "Cmr"],longDays:["Pazar", "Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi"],
			eventRender : function(calEvent, $event) {
				if(calEvent.end.getTime() < new Date().getTime()) 
					$event.css("backgroundColor", "#aaa").find(".time").css({"backgroundColor": "#999", "border":"1px solid #888"});
			},
			firstDayOfWeek : 1,daysToShow : 7,
			businessHours :{start: 8, end: 18, limitDisplay: true },
			'height':function($calendar){
				return $('#calendar_wrapper')[0].offsetHeight;
			}
			/*'eventNew':function(calEvent, $event) {
				calendar_new_entry(calEvent,$event);
			},
			'eventDrop':function(calEvent, $event) {
				$.getJSON('/main/ajax/takvim?action=move',{
					'id':calEvent.id,
					'start':calEvent.start.getTime()/1000,
					'end':calEvent.end.getTime()/1000
				},null);
			},
			'eventResize':function(calEvent, $event) {
				$.getJSON('/main/ajax/takvim?action=move',{
					'id':calEvent.id,
					'start':calEvent.start.getTime()/1000,
					'end':calEvent.end.getTime()/1000
				},null);
			},
			'eventClick':function(calEvent, $event) {
			calendar_edit_entry(calEvent,$event);
			},*/
		});
	});

	getScript("js/aile_extra.js");

	var listeAc=function(event)
	{
		if (this == event.target) 
		{
			if ($(this).children().is(':hidden')) 
				$(this).css('list-style-image','url(/main/images/aile/minus.gif)').children().slideDown();
			else 
				$(this).css('list-style-image','url(/main/images/aile/plus.gif)').children().slideUp();
		}
		return false;
	};
	$('#liste ul li:has(ul)').bind("click",listeAc).click().bind('multihover', listeAc);
	
});

function calendar_new_entry(calEvent,$event)
{
	var ds=calEvent.start, df=calEvent.end,recurbox='<select id="calendar_new_entry_form_recurring"><option value="0">Tek Seferlik</option><option value="1">Günlük</option><option value="7">Haftalık</option></select>';
	$('<div id="calendar_new_entry_form" title="Yeni Bir Olay"><label for="calendar_new_entry_form_title">Olay Adı</label><br /><input placeholder="Yeni Olay" id="calendar_new_entry_form_title" /><br /><label for="calendar_new_entry_form_body">Olay Açıklama</label><br /><textarea style="width:400px;height:200px" id="calendar_new_entry_form_body"></textarea>'+recurbox+'</div>').appendTo($('body'));
	$('#calendar_new_entry_form_recurring').change(calendar_new_get_recurring_end);
	$("#calendar_new_entry_form").dialog({
		bgiframe: true,
		autoOpen: false,
		height: 440,
		width: 450,
		modal: true,
		buttons: {
			'Save': function() 
			{
				var $this=$(this);
				$.getJSON('/main/ajax/takvim?action=save&id=0&start='+ds.getTime()/1000+'&end='+df.getTime()/1000,
				{
					'body':$('#calendar_new_entry_form_body').val(),
					'title':$('#calendar_new_entry_form_title').val(),
					'recurring':$('#calendar_new_entry_form_recurring').val(),
					'recurring_end':$('#calendar_new_recurring_end').val()
				},
				function(ret)
				{
					$this.dialog('close');
					$('#calendar_wrapper').weekCalendar('refresh');
					$("#calendar_new_entry_form").remove();
				});
			},
			Cancel: function() 
			{
				$event.remove();
				$(this).dialog('close');
				$("#calendar_new_entry_form").remove();
			}
		},
		close: function() 
		{
			$('#calendar').weekCalendar('removeUnsavedEvents');
			$("#calendar_new_entry_form").remove();
		}
	});
	$("#calendar_new_entry_form").dialog('open');
}

function calendar_edit_entry(calEvent,$event)
{
	if(!calEvent.id) return;
	var ds=calEvent.start, df=calEvent.end;
	$.getJSON('/main/ajax/takvim?action=get_event&id='+calEvent.id,function(eventdata)
		{
		var controls='<a href="javascript:calendar_delete_entry('+eventdata.id+');">[sil]</a>';
		if(+eventdata.recurring) controls+='<br /><a href="javascript:calendar_delete_recurrences('+eventdata.id+')"> [stop recurring]</a>';
		$('<div id="calendar_edit_entry_form" title="Olayı Düzenleyin"><div style="float:right;text-align:right">'+controls+'</div><label for="calendar_edit_entry_form_title"> Olay</label><br /><input id="calendar_edit_entry_form_title" value="'+eventdata.title+'" /><br /><label for="calendar_edit_entry_form_body">Açıklama</label><br /><textarea style="width:400px;height:200px" id="calendar_edit_entry_form_body">'+eventdata.body+'</textarea></div>').appendTo($('body'));
		$("#calendar_edit_entry_form").dialog({
			bgiframe: true,
			autoOpen: false,
			height: 440,
			width: 450,
			modal: true,
			buttons: {
			'Save': function() {
				var $this=$(this),start=ds.getTime()/1000,end=df.getTime()/1000;
				var body=$('#calendar_edit_entry_form_body').val();
				var title=$('#calendar_edit_entry_form_title').val();
				$.getJSON('/main/ajax/takvim?action=save&id='+eventdata.id+'&start='+start+'&end='+end,
					{'body':body,'title':title},
					function(ret)
					{
						$this.dialog('close');
						$('#calendar_wrapper').weekCalendar('refresh'); 
						$('#calendar_edit_entry_form').remove();
					});
				},
			Cancel: function() {
				$(this).dialog('close');
				$("#calendar_edit_entry_form").remove();
				}
			},
			close: function() {
				$("#calendar_edit_entry_form").remove();
			}
		});
		$("#calendar_edit_entry_form").dialog('open');
	});
}
function calendar_delete_entry(id)
{
	if(confirm('Bu olay silinsin mi?'))
	{
		$('#calendar_edit_entry_form').remove();
		$.getJSON('/main/ajax/takvim?action=delete_event&id='+id,function(ret){$('#calendar_wrapper').weekCalendar('refresh');});
	}
}
function calendar_new_get_recurring_end(){
	if(document.getElementById('calendar_new_recurring_end')) return;
	var year = new Date().getFullYear();
	var month = new Date().getMonth();
	var day = new Date().getDate();
	$('<span><label for="calendar_new_recurring_end">Bitiş:</label><input id="calendar_new_recurring_end" value="'+year+'-'+(month+1)+'-'+day+'" style="font-size:14px" class="date" /></span>').insertAfter('#calendar_new_entry_form_recurring');
	$('.date').takvim();
}

function calendar_delete_recurrences(id)
{
	if(confirm('Bu olayı ve gelecekteki tüm tekrarları silinsin mi?'))
	{
		$('#calendar_edit_entry_form').remove();
		$.getJSON('/main/ajax/takvim?action=delete_event&id='+id+'&recurrences=1',
		function(ret){
			$('#calendar_wrapper').weekCalendar('refresh');
		});
	}
}

