<?php
if (isset($_POST['accion'])){
    echo "procesos post";
    switch($_POST['accion']){
        case 'iniciar':{
            require './controllers/autenticacion_controller.php';
            $autenticacionController  = new Autenticacion_controller();
            $autenticacionController->iniciarSesion();
            break;
        }
        case 'registrar':{
          
         
            require './controllers/usuario_controller.php';
            $usuarioController=new Usuario_controller();
            $usuarioController->registrarSesion();
            
      
            break;
        }
        case 'salir':{
            require './controllers/autenticacion_controller.php';
            $autenticacionController  = new Autenticacion_controller();
            $autenticacionController->salir();
            break;
        }
    }
}else if (isset($_GET['inicio'])){
    echo "procesos get";
}else{
    include './views/plantilla/navs/nav1.php';
    include './views/plantilla/encabezado.php';
    include './views/autenticacion/login.php';
    include './views/plantilla/pie.php';
}
?>