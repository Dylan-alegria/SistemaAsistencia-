<div id="contenido">
    <div class="container">
        <div class="card col-sm-6 mx-auto mt-5">
            <div class="card-header">Registro de usuario</div>
            <div class="card-body">
                <h4 class="card-title">Digite los datos requeridos</h4>

                <form  id="frm_registro">

                  <input type="hidden" name="accion" value="registrar">
                    <div class="form-group">
                        <label for="cedula_persona" class="form-label mt-4">Cédula de identidad:</label></label>
                        <input type="tel" class="form-control" id="cedula_persona" name="cedula_persona" placeholder="#-####-####" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre" class="form-label mt-4">Nombre:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre - Apellido" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono" class="form-label mt-4">Telefono:</label>
                        <input type="tel" class="form-control" id="telefono" name="telefono" placeholder="####-####" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion" class="form-label mt-4">Dirección:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Calle-Ciudad-Provincia" required>
                    </div>
                    <div class="form-group">
                        <label for="clave" class="form-label mt-4">Clave: </label>
                        <input type="password" class="form-control" id="clave" name="clave" placeholder="********" required>
                    </div>
                    <div class="form-group">
                        <label for="permiso" class="form-label mt-4">Permiso:</label></label>
                        <input type="tel" class="form-control" id="permiso" name="permiso" placeholder="#" >
                    </div>

                    <button  name="Guardar"  value="Guardar"class="btn btn-primary btn-lg float-right" type="submit">Registrar</button>
                </form>
                <br><br><br>
                <p>Si ya tiene cuenta, por favor a <a class="bg-primary" onClick="iniciarSesion()">¡Iniciar sesion!</a></p>
            </div>
            <div class="card-footer">
                2021
            </div>
            <script src="./views/js/app.js"></script>
        </div>

    </div>
</div>

8556-2005
1-1787-0209