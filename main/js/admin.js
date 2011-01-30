var aj;
function guncellemeFormuGoster(id)
{
	$("#ruf img").attr("src",getResim(id,"muzik"));
	$('#id').val(id);
	if(aj) aj.abort();
	aj=$.ajax({
	        data: 'gid='+id,
		dataType:"json",
	        success: function(cevap)
	        {	
			console.log(cevap);
			if(cevap.durum=="ok")
			{
				$("#tanim").val(cevap.tanim);
				i=$('#asggf input');
				i.eq(1).val(cevap.ad);
				i.eq(2).val(cevap.clip);
				i=$('#asggf select');
				i.eq(0).val(cevap.tur);
				i.eq(1).val(cevap.mem);
				mesaj="";
				for(j in cevap.Albumler)
					mesaj+="<option id="+cevap.Albumler[j].id+">"+cevap.Albumler[j].yil+"-"+cevap.Albumler[j].ad+"</option>";
				$("#alform select").html(mesaj);
				mesaj="";
				for(j in cevap.Elemanlar)
					mesaj+="<option id="+cevap.Elemanlar[j].id+">"+cevap.Elemanlar[j].ad+"("+cevap.Elemanlar[j].ens+")</option>";
				$("#elform select").html(mesaj);
				$('#forUpdate').show();
				$('#ruf').show();
				$('#gkay').show();
				$('#ggun').hide();
			}
			else
				addNotice("<p>"+id+" bilgileri alınamadı!</p>");
		}
        });
}

$(document).ready(function() {
	activateMain();
	var kayGun="";
	var d = new Date();
	 $.ajaxSetup({
	        type: 'POST', 
	        cache: false,
	        url: '/main/admin/admin/ajax?_='+d.getTime()
	    });
	var tabContainers = $('div.tabs > div');
	tabContainers.hide().filter(':first').show();
	$('#forUpdate').hide();
	$('#ruf').hide();
	$('#ggun').hide();

	$('.adtn a').bind("click",function () {
		tabContainers.hide();
		tabContainers.filter(this.hash).show();
		$('.adtn a').removeClass('selected');
		$(this).addClass('selected');
		return false;
	}).filter(':first').click();

	$('.popUpper').bind("click",function(){
		_gaq.push(['_trackEvent', 'Popup',$(this).attr("id")]);
		window.open($(this).attr("id"),'','status=1,width=650,height=550,resizable=1,resize=yes,scrollbars=1');
		return false;
	});
	
	$('#adyg').bind("click",function(){
		$('#ruf').hide();
		$('#forUpdate').hide();
		$('#asggf input').val("");
		$('#asggf textarea').val("");
		$("#forUpdate select").html("");
		$('#ggun').hide();
		$('#gkay').show();
		$("#ruf img").attr("src"," ");
		$('#id').val(0);
		return false;
	});

	$('#adgas .checkBlue').bind("click",function(){
		guncellemeFormuGoster($("#adgas option:selected").attr("id"));
	});
	
	$('#adgas .thrashBlue').bind("click",function(){
		var ad=$("#adgas option:selected").attr("id");
		if(confirm (ad + " silmek istediğinizden emin misiniz?"))
		{
			$.ajax({dataType: 'json', data: 'sid='+ad });
			addNotice("<p>"+$("#adgas option:selected").html() + " silindi!</p>");
			$("#adgas option:selected").remove();
		}
	});
	
	$("#asggf").validate({
		debug: false,
		rules: {
			ad: "required",
			tur: "required",
			mem: "required",
			clip: "required",
			tanim: "required"
		},
		messages: {
			ad: "Müzisyenin adını girin!",
			tur: "Müzik tür girin!",
			mem: "Bir ülke veya şehir girin!",
			clip: "Müzisyenin youtube klip url'sinin son kısmını girin!",
			tanim: "Müzisyenin hikayesini yazın!"
		},
		submitHandler: function(form) {
			var adjs=$('input[name="ad"]').val();
			$.ajax({
				data: $("#asggf").serialize(),
				dataType:"json",
				success: function(cevap){
					console.log(cevap);
					if(cevap.durum=="yeni")
					{
						$("#adgas").append("<option id='"+cevap.id+"'>"+adjs+"</option>");
						addNotice("<p>"+adjs + " eklendi!</p>");
						guncellemeFormuGoster(cevap.id);
					}
					else if(cevap.durum=="guncel")
						addNotice("<p>"+adjs + " guncellendi!</p>");
					else if(cevap.durum=="error1")
						addNotice("<p>Müzisyenin adını girin!</p>");
					else if(cevap.durum=="error2")
						addNotice("<p>Müzik tür girin!</p>");
					else if(cevap.durum=="error3")
						addNotice("<p>Bir ülke veya şehir girin!</p>");
					else if(cevap.durum=="error4")
						addNotice("<p>Müzisyenin youtube klip url'sinin son kısmını girin!</p>");
					else if(cevap.durum=="error5")
						addNotice("<p>Müzisyenin hikayesini yazın!</p>");
					else 
						addNotice("<p>Bir hata oluştu:"+cevap.durum+"<p>");
			     	}
			});
			return false;
		}
	});

	$("#alform form").validate({
		debug: false,
		rules: {
			alad: "required",
			alyil: { required: true, number: true, range:[1900,2020] }
		},
		messages: {
			alad: "Albüm adını girin!",
			alyil: {required:"Albüm yıl girin!",number:"Bir yıl girin!",range:"1900-2020 arasında bir yıl girin!" }
		},
		submitHandler: function(form) {
			var aladj=$("#alform form input").eq(0).val();
			var alyilj=$("#alform form input").eq(1).val();
			$.ajax({
				data: $("#alform form").serialize()+"&aid="+$('#asggf input').eq(0).val(),
				dataType:"json",
				success: function(cevap){
					if(cevap.durum=="ok")
						$("#alform select").append("<option id="+cevap.id+">"+alyilj+"-"+aladj+"</option");
					else if(cevap.durum=="error1")
						addNotice("<p>Müzisyen seçin!</p>");
					else if(cevap.durum=="error2")
						addNotice("<p>Albüm yıl girin!</p>");
					else if(cevap.durum=="error3")
						addNotice("<p>Albüm adını girin!</p>");
					else
						addNotice("<p>Bir hata oluştu:"+cevap.durum+"</p>");
				}
		     	});
			$("#alform input").val("");
			return false;
		}
	});
	
	$("#elform form").validate({
		debug: false,
		rules: {
			elad: "required",
			alens: "required"
		},
		messages: {
			elad: "Müzisyenin adını girin!",
			alens: "Bir enstrüman girin!"
		},
		submitHandler: function(form) {
			var eladj=$("#elform form input").eq(0).val(),elensj=$("#elform form input").eq(1).val();
			$.ajax({
			dataType:"json",
		        data: $("#elform form").serialize()+"&eid="+$('#asggf input').eq(0).val(),
		        success: function(cevap){
				if(cevap.durum=="ok")
	        			$("#elform form select").append("<option id="+cevap.id+">"+eladj+"("+elensj+")</option>");
				else if(cevap.durum=="error1")
					addNotice("<p>Müzisyen seçin!</p>");
				else if(cevap.durum=="error2")
					addNotice("<p>Bir enstrüman girin!</p>");
				else if(cevap.durum=="error3")
					addNotice("<p>Müzisyenin adını girin!</p>");
				else 
					addNotice("<p>Bir hata oluştu:"+cevap.durum+"</p>");
				}
		      	});
			$("#elform form input").val("");
			return false;
		}
	});
	
	$('#elform .thrashBlue').bind("click",function(){
		//window.log("admin_ayarlar.js kaydetEleman click event.");
		var eid=$("#elform select option:selected").attr("id");
		if(confirm (eid + " silmek istediğinizden emin misiniz?"))
			$.ajax({
				data: 'seid='+eid,
				dataType: 'json',
				success: function(cevap){
					if(cevap.durum=="ok")
					{
						$("#elform select option:selected").remove();
						addNotice("<p>"+eid + " elemanı silindi!</p>");
					}
					else if(cevap.durum=="error1")
						addNotice("<p>"+eid + " degeri eksik!</p>");
					else if(cevap.durum=="error2")
						addNotice("<p>Veri tabanı hatası!</p>");
					else 
						addNotice("<p>Bilinmeyen bir hata!</p>");
				}
			  });
	});
	
	$('#alform .thrashBlue').bind("click",function(){
		//window.log("admin_ayarlar.js kaydetEleman click event.");
		var aid=$("#alform select option:selected").attr("id");
		if(confirm (aid + " silmek istediğinizden emin misiniz?"))
			$.ajax({
				data: 'said='+aid,
				dataType: 'json',
				success: function(cevap){
					if(cevap.durum=="ok")
					{
						$("#albumSelect option:selected").remove();
						addNotice("<p>"+aid + " albumu silindi!</p>");
					}
					else if(cevap.durum=="error1")
						addNotice("<p>"+aid + " degeri eksik!</p>");
					else if(cevap.durum=="error2")
						addNotice("<p>Veri tabanı hatası!</p>");
					else 
						addNotice("<p>Bilinmeyen bir hata!</p>");
				}
			  });
	});
	
	$("#film form").validate({
		debug: false,
		rules: {
			fad: "required",
			uz: "required",
			mp4: "url",
			ogg: "url",
			webm: "url",
			desc: "url",
			chap: "url",
			meta: "url",
			en: "url",
			tr: "url"
		},
		messages: {
			fad: "Filmin adını girin!",
			uz: "Uzunluğu girin!",
			mp4: "Bir link girin!",
			ogg: "Bir link girin!",
			webm: "Bir link girin!",
			desc: "Bir link girin!",
			chap: "Bir link girin!",
			meta: "Bir link girin!",
			en: "Bir link girin!",
			tr: "Bir link girin!"
		},
		submitHandler: function(form) {
			$.ajax({
				dataType:"json",
				data: $("#film form").serialize(),
				success: function(cevap){
					if(cevap.durum=="ok")
						alert("İşlem başarılı-"+cevap.id);
					else if(cevap.durum=="error1")
						addNotice("<p>Filmin adını girin!</p>");
					else if(cevap.durum=="error2")
						addNotice("<p>Uzunluğu girin!</p>");
					else if(cevap.durum=="error3")
						addNotice("<p>MP4 girin!</p>");
					else if(cevap.durum=="error4")
						addNotice("<p>OGG girin!</p>");
					else if(cevap.durum=="error5")
						addNotice("<p>WEBM girin!</p>");
					else if(cevap.durum=="error6")
						addNotice("<p>Youtube girin!</p>");
					else 
						addNotice("<p>Bir hata oluştu:"+cevap.durum+"</p>");
				}
		      	});
			$("#film form input:not(type='submit')").val("");
			return false;
		}
	});
	
	var resimBtnUpload=$('#resimUpload');
	var resimStatus=$('#uyari');
	var ajaxUploadJS = new AjaxUpload(resimBtnUpload, {
        action: '/main/admin/admin/ajax',
        name: 'uploadResim',
	allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
	sizeLimit: 63000000,
        onSubmit: function(file, ext){
            if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
				addNotice('<p>Sadece JPG, PNG veya GIF resimleri yüklenebilir!!!</p>');
                return false;
            }
		addNotice('<p>Yükleniyor...</p>');
        },
	onProgress: function(id, fileName, loaded, total){},
        onComplete: function(file, uniqueFile){
			var matches,mesajlar=["<p>Resim başarıyla yüklendi...</p>",
			"<p>Resmin boyutu çok fazla, 63 KB'tan daha fazla olamaz.</p>",
			"<p>Gizli MAX_FILE_SIZE alanına göre dosya boyutu fazla. Parametreleri değiştirmek için site yöneticisiyle irtibata geçin!</p>",
			"<p>Dosyayı yüklerken bir hata oluştu, lütfen tekrar deneyin.</p>",
			"<p>Yüklenecek bir dosya seçmediniz, lütfen tekrar deneyin.</p>",
			"<p>Bilinmeyen bir hata meydana geldi, lütfen tekrar deneyin.</p>",
			"<p>Bir PNG,GIF veya JPG resmi yükleyebilirsiniz, lütfen tekrar deneyin.</p>",
			"<p>Dosya açma başarısız. Lütfen tekrar deneyin.</p>",
			"<p>Bir PNG,GIF veya JPEG resmi yükleyebilirsiniz, lütfen tekrar deneyin.</p>",
			"<p>Resim kaydedilemedi, lütfen tekrar deneyin.</p>",
			"<p>Resim boyutu sunucu ayarlarından yüksek.</p>"];
		    	if (/^error[1-9]+$/.test(uniqueFile))
			{
				matches=uniqueFile.match(/^error([1-9]+)$/); 
				addNotice(mesajlar[matches[1]]);
			}
			else
				$.ajax({
					data: 'rid='+$('#asggf input').eq(0).val()+'&fn='+uniqueFile,
					success: function(cevap)
					{
						addNotice(mesajlar[0]);
						$("#ruf img").attr("src",cevap);
					}
				});
        }
    });
  
});
