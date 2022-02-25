<div id="contenido">
    <div class="container">
        <div class="card col-sm-6 mx-auto mt-5">
            <div class="card-header">Inicio de sesion</div>
            <div class="card-body">
                <h4 class="card-title">Digite los datos requeridos</h4>
                <form id="frm_login">
                    <input type="hidden" name="accion" value="iniciar">
                    <div class="form-group" >
                        <label for="cedula_persona" class="form-label mt-4">Cédula de identidad:</label></label>
                        <input type="tel" class="form-control" id="cedula_persona" name="cedula_persona" 
                            placeholder="#-####-####"  required>
                    </div>
                    <div class="form-group" >
                        <label for="clave" class="form-label mt-4">Contraseña: </label>
                        <input type="password" class="form-control" id="clave" name="clave"
                            placeholder="********" required>
                    </div>
                    <button  name="login"  value="login" class="btn btn-primary btn-lg float-right" type="submit">Iniciar sesion</button>
                </form>
                <br><br><br>
                <p>Si no tiene cuenta, por favor dar click en <a class="bg-primary" onClick="registrarSesion()">¡Registrarme!</a></p>
            </div>
            <div class="card-footer">
                2021
            </div>
            <script src="./views/js/app.js"></script>
        </div>
    </div>
    <br>
</div> 