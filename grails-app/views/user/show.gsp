<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="update" action="select_avatar"><g:message message= "Seleccionar Avatar" /></g:link></li>
            </ul>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:if test="${user.avatar}">
                <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:user.ident())}" />
            </g:if>

            <ol class="property-list user">
                <li class="fieldcontain">
                    <span id="username-label" class="property-label">Username</span>
                    <div class="property-value" aria-labelledby="username-label"><f:display bean="user" property="username"/></div>
                </li>
                <li class="fieldcontain">
                    <span id="email-label" class="property-label">Email</span>
                    <div class="property-value" aria-labelledby="email-label"><f:display bean="user" property="email"/></div>
                </li>
                <li class="fieldcontain">
                    <span id="firstname-label" class="property-label">Firstname</span>
                    <div class="property-value" aria-labelledby="firstname-label"><f:display bean="user" property="firstname"/></div>
                </li>
                <li class="fieldcontain">
                    <span id="lastname-label" class="property-label">Lastname</span>
                    <div class="property-value" aria-labelledby="lastname-label"><f:display bean="user" property="lastname"/></div>
                </li>
                </li>
            </ol>

            <g:form resource="${this.user}" method="DELETE">
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <g:link class="edit" action="approve" resource="${this.user}"><g:message message= "Aprobar" /></g:link>
                    <g:link class="edit" action="promote" resource="${this.user}"><g:message message= "Promover" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </sec:ifAnyGranted>

            </g:form>
        </div>
    </body>
</html>
