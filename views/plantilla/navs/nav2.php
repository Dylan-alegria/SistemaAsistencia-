<div id="barra">
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Mensajeria</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
      <li class="nav-item">
              <a class="nav-link">Usuario: <!--?=/*$_SESSION['nombre']*/?--></a>
          </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" onClick="cerrarSesion()">Cerrar sesion</a>
        </li>
      </ul>
    </div>  
  </nav>
</div>