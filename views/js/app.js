$("#frm_login").submit(function(event){
    event.preventDefault();
    var parametros=$(this).serialize();
    $.ajax({
        type:"POST",
        url:"index.php",
        data:parametros,
    }).done(function(respuesta){
        $("#barra").html('');
        $("#contenido").html(respuesta);
    })
})
$("#frm_registro").submit(function(event){
    event.preventDefault();
    var parametros=$(this).serialize();
    $.ajax({
        type:"POST",
        url:"index.php",
        data:parametros,
    }).done(function(respuesta){
        $("#barra").html('');
        $("#contenido").html(respuesta);
    })
})


function iniciarSesion(){
    var parametros={"accion":"iniciar"};
    $.ajax({
        type:"POST",
        url:"index.php",
        data:parametros,
    }).done(function(respuesta){
        $("#contenido").load('./views/autenticacion/login.php');
    })
}

function registrarSesion(){
    var parametros={"accion":"registrar"};
    $.ajax({
        type:"POST",
        url:"index.php",
        data:parametros,
    }).done(function(respuesta){
        $("#contenido").load('./views/usuario/registro.php');
    })
}

function cerrarSesion(){
    var parametros={"accion":"salir"};
    $.ajax({
        type:"POST",
        url:"index.php",
        data:parametros,
    }).done(function(respuesta){
        alert("Sesion Cerrada");
        $("#contenido").load('./views/autenticacion/login.php');
    })
}