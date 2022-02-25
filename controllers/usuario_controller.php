<?php
session_start();
class Usuario_controller
{
    function __construct()
    {
    }

    public function registrarSesion()
    {
        include('./models/conexion.php');


        if (trim($_POST['cedula_persona'] != "" )) {
            $cedula_persona = trim($_POST['cedula_persona']);
            $clave = trim($_POST['clave']);
            $permiso = trim($_POST['permiso']);
            $nombre = trim($_POST['nombre']);
            $direccion = trim($_POST['direccion']);
            $telefono = trim($_POST['telefono']);


            echo "ifffff";
            $insert = "INSERT INTO `tbl_registro` (`idlogin`, `telefono`, `cedula_persona`, `clave`, `nombre`, `direccion`) 
    VALUES (NULL, '$telefono', '$cedula_persona', '$clave', '$nombre', '$direccion');";
            $query = mysqli_query($db, $insert);
            if ($query) {
                echo "entro al if ";
                include './views/autenticacion/login.php';
            } else {
                echo "acuerdese poner una alerta de que no se registro att dylan , gracias toxica ";
                include './views/usuario/registro.php';
            }
        }
    }
}
