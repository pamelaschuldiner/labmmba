<!DOCTYPE html>
<html>
<head>
  <title>LABMMBA - Registro de nuevo usuario</title>
  <meta name="layout" content="main" />
</head>
<body>
<g:form class="simpleform" url="[controller:'usertemp',action:'register']">
  <fieldset>
    <legend>Registro de nuevo usuario</legend>
    <p class="info">
      Completa la información para registrarte:
    </p>
    <p>
      <label for="usertemp_name">Nombres</label>
      <g:textField name="usertemp_name"/>
    </p>
    <p>
      <label for="usertemp_email">Correo Electrónico</label>
      <g:textField name="usertemp_email"/>
    </p>
    <p>
      <label for="usertemp_lastname">Apellidos</label>
      <g:textField name="usertemp_lastname"/>
    </p>
    <p>
      <label for="usertemp_pass">Contraseña</label>
      <g:passwordField name="usertemp_pass"/>
    </p>
    <p>
      <label for="confirm">Confirmar Contraseña</label>
      <g:passwordField name="confirm"/>
    </p>
    <p class="button">
      <label>&nbsp;</label>
      <g:submitButton class="button" name="submitButton" value="Create Account" />
    </p>
  </fieldset>
</g:form>
</body>
</html>