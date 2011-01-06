//window.log("admin_ayarlar.js Yuklendi.");
function guncellemeFormuGoster(grupAdJS)
{
	//window.log("admin_ayarlar.js guncellemeFormuGoster fonksiyon.");

	$("#grupImage").attr("src",getResim(grupAdJS,"muzik"));
	$.ajax({
	        data: 'guncelleID='+grupAdJS,
	        success: function(cevap)
	        {
				var parca= cevap.split("&"),mesaj="";
				var parcalar= parca[0].split("|");
				$('#grupID').html(grupAdJS);
				$("#grupTanim").val(parcalar[0]);
				i=1;
				$('#guncelleForm input').each(function(){ $(this).val(parcalar[i++]); });
				parcalar=parca[1].split("|");
				i=parcalar.length;
				while((i=i-3)>0)
					mesaj+="<option id="+parcalar[i-1]+" name="+parcalar[i-1]+">"+parcalar[i+1]+"-"+parcalar[i]+"</option>";
				$("#albumSelect").html(mesaj);
				parcalar= parca[2].split("|");
				mesaj="";
				i=parcalar.length;
				while((i=i-3)>0)
					mesaj+="<option id="+parcalar[i-1]+" name="+parcalar[i-1]+">"+parcalar[i]+"("+parcalar[i+1]+")</option>";
				$("#elemanSelect").html(mesaj);
				$('#guncelleFormDiv').show();
				$('#forUpdate').show();
				$('#resimUploadFieldset').show();
				$('#guncelle').show();
				$('#kaydet').hide();
			}
        });
	//window.log("admin_ayarlar.js guncellemeFormuGoster fonksiyon sonu.");
}

$(document).ready(function() {
	//window.log("admin_ayarlar.js DOM Yuklendi.");
	activateMain();
	$('body').addClass("adminBody");
	var kayGun="";
	var d = new Date();
	 $.ajaxSetup({
	        type: 'POST', 
	        cache: false,
	        url: '/main/admin/admin/ajax?_='+d.getTime()
	    });
	//window.log("admin_ayarlar.js AJAX ayarland&#253;.");
	var tabContainers = $('div.tabs > div');
	tabContainers.hide().filter(':first').show();
	$('#forUpdate').hide();
	$('#resimUploadFieldset').hide();
	$('#guncelle').hide();
	            
	$('#guncelleForm').html5form(); 
	$('#kaydetAlbumForm').html5form(); 
	$('#kaydetElemanForm').html5form(); 

	$('.tabNavigation a').bind("click",function () {
		tabContainers.hide();
		tabContainers.filter(this.hash).show();
		$('.tabNavigation a').removeClass('selected');
		$(this).addClass('selected');
		return false;
	}).filter(':first').click();
	//window.log("admin_ayarlar.js Tab Navigasyon ayarland&#253;.");

	$('.popUpper').bind("click",function(){
		_gaq.push(['_trackEvent', 'Popup',$(this).attr("id")]);
		window.open($(this).attr("id"),'','status=1,width=650,height=550,resizable=1,resize=yes,scrollbars=1');
		return false;
	});
	
	$('#yeniGrupFormAcButon').bind("click",function(){
		//window.log("admin_ayarlar.js yeniGrupFormAcButon click event.");
		$('#guncelleFormDiv').show();
		$('#resimUploadFieldset').hide();
		$('#forUpdate').hide();
		$('#grupID').html("");
		$('#guncelleForm input').val("");
		$('#guncelleForm textarea').val("");
		$("#forUpdate select").html("");
		$('#guncelle').hide();
		$('#kaydet').show();
		$("#grupImage").attr("src"," ");
		return false;
	});

	$('#guncelleGrupFormAcButon').bind("click",function(){
		//window.log("admin_ayarlar.js guncelleGrupFormAcButon click event.");
		guncellemeFormuGoster($("#grupAdSelect option:selected").attr("id"));
		//window.log("admin_ayarlar.js guncelleGrupFormAcButon click event tamamland&#253;.");
		return false;
	});
	
	$('#sil').bind("click",function(){
		//window.log("admin_ayarlar.js sil click event.");
		var grupAdJS=$("#grupAdSelect option:selected").attr("id");
		var answer = false;
		if(grupAdJS !== null){	answer= confirm (grupAdJS + " silmek istediğinizden emin misiniz?"); }
		if(answer)
		{
			$.ajax({ data: 'silID='+grupAdJS });
			$("#uyari").append($("#grupAdSelect option:selected").html() + " silindi!<br>");
			$("#grupAdSelect option:selected").remove();
		}
		return false;
	});
	
	$("#guncelleForm").validate({
		debug: false,
		errorLabelContainer: $("#uyariForm"),
		rules: {
			grupAd: "required",
			grupTur: "required",
			grupMemleket: "required",
			grupClip: "required",
			grupTanim: "required"
		},
		messages: {
			grupAd: "Müzisyenin adını girin!",
			grupTur: "Müzik tür girin!",
			grupMemleket: "Bir ülke veya şehir girin!",
			grupClip: "Müzisyenin youtube klip url'sinin son kısmını girin!",
			grupTanim: "Müzisyenin hikayesini yazın!"
		},
		submitHandler: function(form) {
			var grupAdJS=$("#grupAd").val(),
				grupTurJS=$("#grupTur").val(),
				grupTanimJS=$("#grupTanim").val(),
				grupClipJS=$("#grupClip").val(),
				grupMemleketJS=$("#grupMemleket").val();
			//window.log(grupAdJS+"-"+grupTurJS+"-"+grupTanimJS+"-"+grupClipJS+"-"+grupMemleketJS);
			if(kayGun=="kaydet")
			{
				$.ajax({
			        data: 'grupTanim='+grupTanimJS+'&grupMemleket='+grupMemleketJS+'&kaydet=1'+'&grupAd='+grupAdJS+'&grupTur='+grupTurJS+'&grupClip='+grupClipJS+'&formKeyJS='+$('#formKey').val(),
			        success: function(cevap){
						$("#grupAdSelect").append("<option id='"+cevap+"'>"+grupAdJS+"</option>");
						$("#uyari").append(grupAdJS + " eklendi!<br>");
						guncellemeFormuGoster(cevap);
						$('.grupKayGun').removeAttr("disabled");
					}
			      });
			}
			else if(kayGun=="guncelle")
			{
				$.ajax({ data: 'guncellenecekID='+$('#grupID').html()+'&grupAd='+grupAdJS+'&grupTur='+grupTurJS+'&grupTanim='+grupTanimJS+'&grupMemleket='+grupMemleketJS+'&grupClip='+grupClipJS+'&formKeyJS='+$('#formKey').val()});
				$("#uyari").append(grupAdJS + " guncellendi!<br>");
				$('.grupKayGun').removeAttr("disabled");
			}
		}
	});
	$('.grupKayGun').bind("click",function(){
		if($('#fax').html()=="")
		{
			$(this).attr("disabled","disabled");
			kayGun=$(this).attr("id");
			$('#guncelleForm').submit();
			//window.log("admin_ayarlar.js kaydet click event.");
			return false;
		}
	});

	$("#kaydetAlbumForm").validate({
		debug: false,
		errorLabelContainer: $("#uyariForm"),
		rules: {
			albumAd: "required",
			albumYil: { required: true, number: true, range:[1900,2020] }
		},
		messages: {
			albumAd: "Albüm adını girin!",
			albumYil: {required:"Albüm yıl girin!",number:"Bir yıl girin!",range:"1900-2020 arasında bir yıl girin!" }
		},
		submitHandler: function(form) {
			var albumAdJS=$("#albumAd").val(),
				albumYilJS=$("#albumYil").val(),
				grupAdJS=$('#grupID').html();
			$.ajax({
		        data: 'yeniAlbum=1&grupAd='+grupAdJS+'&albumYil='+albumYilJS+'&albumAd='+albumAdJS+'&formKeyJS='+$('#formKey').val(),
		        success: function(cevap){
	        		$("#albumSelect").append("<option id="+cevap+">"+albumYilJS+"-"+albumAdJS+"</option");
	        		$("#albumAd").val("");
	    			$("#albumYil").val("");
					$("#kaydetAlbum").removeAttr("disabled");
			}
		      });
			$("#uyari").append(albumAdJS + " albümü eklendi!<br>");
		}
	});
	$('#kaydetAlbum').bind("click",function(event){
		if($('#fax').html()=="")
		{
			$(this).attr("disabled","disabled");
			//window.log("admin_ayarlar.js kaydetAlbum click event.");
			$("#kaydetAlbumForm").submit();
			return false;
		}
	});
	
	$("#kaydetElemanForm").validate({
		debug: false,
		errorLabelContainer: $("#uyariForm"),
		rules: {
			elemanAd: "required",
			elemanEnstruman: "required"
		},
		messages: {
			elemanAd: "Müzisyenin adını girin!",
			elemanEnstruman: "Bir enstrüman girin!"
		},
		submitHandler: function(form) {
			var elemanAdJS=$("#elemanAd").val(),
				enstrumanJS=$("#elemanEnstruman").val(),
				grupAdJS=$('#grupID').html();
			$.ajax({
		        data: 'yeniEleman=1&grupAd='+grupAdJS+'&elemanAd='+elemanAdJS+'&enstruman='+enstrumanJS+'&formKeyJS='+$('#formKey').val(),
		        success: function(cevap){
	        		$("#elemanSelect").append("<option id="+cevap+">"+elemanAdJS+"("+enstrumanJS+")</option>");
	        		$("#elemanAd").val("");
	    			$("#elemanEnstruman").val("");
					$('#kaydetEleman').removeAttr("disabled");
				}
		      });
			$("#uyari").append(elemanAdJS + " elemanı eklendi!<br>");
		}
	});
	$('#kaydetEleman').bind("click",function(){
		if($('#fax').html()=="")
		{
			$(this).attr("disabled","disabled");
			//window.log("admin_ayarlar.js kaydetEleman click event.");
			$("#kaydetElemanForm").submit();
			return false;
		}
	});
	
	$('#silEleman').bind("click",function(){
		//window.log("admin_ayarlar.js kaydetEleman click event.");
		var elemanIDJS=$("#elemanSelect option:selected").attr("id");
		var answer = false;
		if(elemanIDJS !== null){	answer= confirm (elemanIDJS + " silmek istediğinizden emin misiniz?"); }
		if(answer)
			$.ajax({
				data: 'silEleman='+elemanIDJS,
				success: function(cevap){
					$("#elemanSelect option:selected").remove();
					$("#uyari").append(elemanIDJS + " elemanı silindi!<br>");
				}
			  });
		return false;
	});
	
	$('#silAlbum').bind("click",function(){
		//window.log("admin_ayarlar.js kaydetEleman click event.");
		var albumIDJS=$("#albumSelect option:selected").attr("id");
		var answer = false;
		if(albumIDJS !== null){	answer= confirm (albumIDJS + " silmek istediğinizden emin misiniz?"); }
		if(answer)
			$.ajax({
				data: 'silAlbum='+albumIDJS,
				success: function(cevap){
					$("#albumSelect option:selected").remove();
					$("#uyari").append(albumIDJS + " albumu silindi!<br>");
				}
			  });
		return false;
	});
	
	$("#film_form").validate({
		debug: false,
		errorLabelContainer: $("#uyariForm"),
		rules: {
			film_ad: "required",
			uzunluk: "required",
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
			film_ad: "Filmin adını girin!",
			uzunluk: "Uzunluğu girin!",
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
			        data: $("#film_form").serialize(),
			        success: function(cevap){
						alert("İşlem başarılı-"+cevap);
						$("#film_form input").val("");
					}
			      });
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
					data: 'resimHedefGrupID='+$('#grupID').html()+'&fileName='+uniqueFile,
					success: function(cevap)
					{
						addNotice(mesajlar[0]);
						$("#grupImage").attr("src",cevap);
					}
				});
        }
    });
  
});
