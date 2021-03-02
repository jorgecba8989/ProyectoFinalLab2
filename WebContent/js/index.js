var jUtils = {
		
	repVideo: function(url,titulo,cantante,like,visita,link_descarga) {
			$("#ilinkvideo").val(url);
			$("#ititulo").val(titulo);
			$("#icantante").val(cantante);
			$("#ilikes").val(like);
			$("#ivisitaV").val(visita);
			$("#idescargah").val(link_descarga);
			
			$("#iform").submit();
			
			
	},
	
	contarVisitas:function(){
							   
				 $.ajax({
						url: "./MostrarVisitas.jsp",
						type: "post",
						data: {
								Alias_usuario: $("#idatoNickh").val(),
								Url_Video: $("#idatoUrl").val(),
								Cant_visita:  $("#ivisitaVh").val()
						},
						dataType: "html",
						error: function(hr) {
							$("#message").html(hr.responseText).show();
						},
						success: function() {
							
						}			
					}); 
	},
	
	agregarLista: function(){	
		if ( $("#iagregoL").is(":visible") ) { 
		    $("#iagregoL").hide();     
		    $("#iagregoL2").closest("div").removeClass("d-none");
		  } 
	},
	
	cancelarLista: function(){	
		$("#iagregoL2").closest("div").addClass("d-none");
		$("#iagregoL").show(); 
	},
	
	
	registrarLista:function(){
		if($.trim($("#iagregoL2").val()) == ""){
			alert("Debes ingresar un nombre para la lista");
			return false;
		}
		
		$.ajax({
		    url: "./InsertarListado.jsp",
		    type: "post",
		    dataType: "html",
		    data: {
		    		Nom_listado: $("#iagregoL2").val(),
		    		Alias_usuario: $("#idatoNickh").val()

		    },
		    error: function(hr){
		   	    	$("#message").html(hr.responseText).show();
		    	
		    },
		    success: function() {
		    	location.reload();
		    	 $("#iagregoL2").closest("div").addClass("d-none");
					$("#iagregoL").show(); 
					
					
		    }
		});
		 
		   
	  
	},
	
	mostrarLista: function() {
		$.ajax({
		    url: "./MostrarListadoUs.jsp",
		    type: "post",
		    dataType: "html",
		    data: $.param($("input[type='hidden']")),
		    error: function(hr){
		   	    	$("#message").html(hr.responseText).show();
		    	
		    },
		    success: function(html) {
		    	  
		    	$("#iplaylistUsuario").html(html);
		    	
		    }
		});

	
	},
	
	mostrarPlaylist:function(){
		$("ul.listadoT").on("click","li", function(){
			var texto = $(this).find("span.t").text() 
			$.ajax({
			    url: "./MostrarPlaylist.jsp",
			    type: "post",
			    dataType: "html",
			    data: {
			    		Nom_listado: texto,
			    		Alias_usuario : $("#idatoNickh").val()
			    	},
			    error: function(hr){
			   	    	$("#message").html(hr.responseText).show();
			    	
			    },
			    success: function(html) {
			    	$("#ioculResultados").hide();
			    	$("#iverPlaylist").html(html);
			    	
			    }
			});	
		  });
	},
	
	eliminarVideo:function(nro_video,nro_lista){
	
			if(confirm("¿Estas seguro de eliminar el video?")) {
				$("#iform").attr("action", "BorrarVideoListado.jsp");
				$("#ilinkvideoh").val(nro_video);
				$("#inomListah").val(nro_lista);
				$("#iform").submit();
				
		}
	},
	
	agregarComentario:function() {
		$.ajax({
		    url: "./InsertarComentario.jsp",
		    type: "post",
		    dataType: "html",
		    data: {
		    	Descripcion_comentario: $("#idescripcion").val(),
	    		Alias_usuario: $("#idatoNickh").val(),
	    		Url_Video:$("#idatoUrl").val()
	    },
		    error: function(hr){
		   	    	$("#message").html(hr.responseText).show();
		    	
		    },
		    success: function(html) {
		    	$("#idescripcion").val("");
		    	$("#iagregaComentario").html(html);
		    	location.reload();
		    }
		});
	},
	
	mostrarComentario:function() {
		$.ajax({
		    url: "./MostrarComentario.jsp",
		    type: "post",
		    dataType: "html",
		 
		    data: {
	    		Url_Video:$("#idatoUrl").val()
	    },
		    error: function(hr){
		   	    	$("#message").html(hr.responseText).show();
		    	
		    },
		    success: function(html) {
		    	$("#imostrarComentarios").html(html);
		    	
		    }
		});
	},
	
	registrarUsuario: function() {
		if($.trim($("#iapellido").val()) == ""){
			alert("Debes ingresar un apellido");
			return false;	
		}
		if($.trim($("#inombre").val()) == ""){
			alert("Debes ingresar un nombre");
			return false;
		}
		if($.trim($("#iemail").val()) == ""){
			alert("Debes ingresar un email")
			return false;
		}
		if($("#iclave").val() != $("#iconfirmar_clave").val()) {
			alert("Las claves no coinciden");
			$("#iclave").focus();
			return false;
		}
		if($.trim($("#iclave").val()) == ""){
			alert("Debes ingresar una clave");
			return false;
		}
		if($.trim($("#iconfirmar_clave").val()) == ""){
			alert("Debes de confirmar una clave");
			return false;
		}
		if($.trim($("#ialias").val()) == ""){
			alert("Debes ingresar un alias")
			return false;
		}
			$.ajax({
			    url: "./InsertarUsuario.jsp",
			    type: "post",
			    dataType: "html",
			    data: {
				    	Nom_usuario: $("#inombre").val(),
				    	Apellido_usuario: $("#iapellido").val(),
				    	Clave_usuario: $("#iclave").val(),
				    	Verificacion_clave_usuario: $("#iconfirmar_clave").val(),
				    	Email_usuario: $("#iemail").val(),
				    	Alias_usuario: $("#ialias").val()

			    },
			    error: function(hr){
			   	    	$("#message").html(hr.responseText).show();
			    	
			    },
			    success: function() {
			    	
			    	window.location.href = "login.jsp";
			    	 
			    }
			});
			
	},
	
	mostrarDatosUsu:function(){
		
		$("#iform").attr("action", "MostrarDatosUsuario.jsp");
		 $("#idatoNickh").val();
		$("#iform").submit();		
	
	},
	
	actualizarDatos:function(){
	
	if($.trim($("#iapellido").val()) == ""){
			alert("Debes ingresar un apellido");
			return false;	
		}
		
		if($.trim($("#inombre").val()) == ""){
			alert("Debes ingresar un nombre");
			return false;
		}
		if($.trim($("#iemail").val()) == ""){
			alert("Debes ingresar un email")
			return false;
		}
		
		if($.trim($("#iclave").val()) == ""){
			alert("Debes ingresar una clave");
			return false;
		}
		if($.trim($("#iconfirmar_clave").val()) == ""){
			alert("Debes de confirmar una clave");
			return false;
		}
		
		if($("#iclave").val() != $("#iconfirmar_clave").val()) {
			alert("Las claves no coinciden");
			$("#iclave").focus();
			return false;
		}
		
			$("#iformR").attr("action", "actualizarDatosUsuario.jsp");
			
			$("#iformR").submit();	
			
	},
	
	cancelar : function(){
		$(location).attr("href", "./homepage.jsp");
	},
	
		
	likePositivo:function() {
		$.ajax({
			url: "./Like.jsp",
			type: "post",
			data: {
					Alias_usuario: $("#idatoNickh").val(),
					Url_Video: $("#idatoUrl").val(),
					Cant_Like: $("#ilikesh").val()
			},
			dataType: "html",
			error: function(hr) {
				$("#message").html(hr.responseText).show();
			},
			success: function() {
				location.reload();
			}			
		}); 
	},
	

	
	 record: function() {
            var recognition = new webkitSpeechRecognition();
            recognition.lang = "es-GB";

            recognition.onresult = function(event) {
                document.getElementById('speechToText').value = event.results[0][0].transcript;
            }
            recognition.start();

        },
        
        guardarVideo: function (selObj)
        {
      	  if($(selObj).val() == "-1")
      	  { 
      	  	alert("Debes seleccionar una lista");
      	  }
      	  else {
        			$.ajax({
							    url: "./InsertarVideoListado.jsp",
							    type: "post",
							    dataType: "html",
							    data: {
							    		Nom_listado: $("#myplaylist").val(),
							    		Url_Video:$("#idatoUrl").val(),
							    		Alias_usuario: $("#idatoNickh").val(),
	
							    },
							    error: function(hr){
							   	    	$("#message").html(hr.responseText).show();
							    },
							    success: function() {
							    	
							    	alert("Se agrego correctamente a tu lista");
							    	$("#iagregoVideoLista").val("");
							    	$("#iagregoVideoLista").blur();
							    }
							});
       		 }
        }

};
	
