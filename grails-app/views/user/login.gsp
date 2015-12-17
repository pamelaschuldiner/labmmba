<html>
<head>
  <title>POP - Homepage</title>
  <meta name="layout" content="main" />
</head>
<body>
<g:if test="${session?.user}">
</g:if>
<g:else>
  <g:form class="simpleform" style="width:50%;" url="[controller:'user',action:'login']">
    <fieldset>
      <legend>Login</legend>
      <p class="info">
        Ingresa tu correo y contraseña: <br />
        ¿No tienes una cuenta?
        <g:link controller="usertemp" action="register">Regístrate</g:link>
      </p>
      <g:if test="${flash.message}">
          <div class="message">${flash.message}</div>
      </g:if>
      <p>
        <label for="user_email">Correo Electrónico</label>
        <g:textField name="user_email" />
      </p>
      <p>
        <label for="user_pass">Contraseña</label>
        <g:passwordField name="user_pass" />
      </p>
      <p class="button">
        <label>&nbsp;</label>
        <g:submitButton class="button" name="submitButton" value="Loguearte" />
      </p>
    </fieldset>
  </g:form>
</g:else>
</body>
</html>