<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Lammba - Laboratorio de Microbiología Molecular y Biotecnología Ambiental</title>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="create-user" class="content scaffold-create" role="main">
            <div class="nav" role="navigation">
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <ul>
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="list" action="pending"><g:message message="User Pendiente Lista" /></g:link></li>
                        <li><g:link controller="welcome" action="editarGaleriaPrincipal">Galeria Principal</g:link></li>
                        <li><g:link url="j_spring_security_logout">Logout</g:link></li>
                    </ul>
                </sec:ifAllGranted>
            </div>
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <f:field bean="user" property="username"/>
					<f:field bean="user" property="firstname"/>
					<f:field bean="user" property="lastname"/>
					<f:field bean="user" property="email"/>
					<f:field bean="user" property="password"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
