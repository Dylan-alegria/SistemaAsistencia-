<?php
 
echo 'hola 1';
class Autenticacion_controller
{
    function __construct()
    {
    }
    public function iniciarSesion()
    {
        echo 'holaaaaaaaaaa' ;
        include './views/plantilla/navs/nav2.php';
      
        
            $usuario = $_POST['cedula_persona'];
            $contraseña = $_POST['clave'];
           
            $_SESSION['usuario'] = $usuario;


            $conexion = mysqli_connect("localhost", "root", "", "controlasistencia");

            $consulta = "SELECT*FROM tbl_registro where cedula_persona='$usuario' and clave='$contraseña'";
            $resultado = mysqli_query($conexion, $consulta);

            $filas = mysqli_num_rows($resultado);

            if ($filas) {

               echo 'entramos ';
            } else {
?>
                <?php
                include("./index.php");

                ?>
                <h1 class="bad">ERROR DE AUTENTIFICACION</h1>
<?php
            }
            mysqli_free_result($resultado);
        }
    
    public function salir()
    {
        session_destroy();
       
    }
}
?>