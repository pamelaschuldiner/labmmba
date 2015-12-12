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
                <g:if test="${sec.username() == user.username}">
                    <li><g:link class="update" action="select_avatar"><g:message message= "Seleccionar Avatar" /></g:link></li>
                </g:if>
            </ul>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <ol class="property-list user">
                <li class="fieldcontain">
                    <g:if test="${user.avatarURL}">
                        <img class="avatar" src="${createLink(controller:'user', action:'avatar_image', id:user.ident())}" />
                    </g:if>
                </li>
                <li class="fieldcontain">
                    <span id="username-label" class="property-label">Username:</span>
                    <div class="property-value" aria-labelledby="username-label"><f:display bean="user" property="username"/></div>
                </li>
                <li class="fieldcontain">
                    <span id="email-label" class="property-label">Email:</span>
                    <div class="property-value" aria-labelledby="email-label"><f:display bean="user" property="email"/></div>
                </li>
                <li class="fieldcontain">
                    <span id="firstname-label" class="property-label">Firstname:</span>
                    <div class="property-value" aria-labelledby="firstname-label"><f:display bean="user" property="firstname"/></div>
                </li>
                <li class="fieldcontain">
                    <span id="lastname-label" class="property-label">Lastname:</span>
                    <div class="property-value" aria-labelledby="lastname-label"><f:display bean="user" property="lastname"/></div>
                </li>
                <li class="fieldcontain">
                    <span id="estudios-label" class="property-label">Estudios:</span>
                </li>

                <g:if test="${user.studys}">
                    <g:each in="${user.studys}">
                        <li class="fieldcontain">
                            <span id="tipo_estudio-label" class="property-label">${it.study_type}:</span>
                            <div class="property-value" aria-labelledby="lastname-label">${it.study_name}</div>
                                <g:if test="${it.thesis}">
                                    <li class="fieldcontain">
                                        <span id="thesis_name-label" class="property-label">Thesis:</span>
                                        <g:each in="${it.thesis}">
                                            <div class="property-value" aria-labelledby="lastname-label">${it.thesis_name}</div>
                                        </g:each>
                                    </li>
                                </g:if>
                                <g:else>
                                    <g:if test="${sec.username() == user.username}">
                                        <g:link controller="thesi" action="create"  params="[studyId: it.id]">Agregar Thesis</g:link>
                                    </g:if>
                                </g:else>
                        </li>
                    </g:each>
                </g:if>
                <g:if test="${sec.username() == user.username}">
                    <g:link controller="study" action="create">Agregar Estudios</g:link>
                </g:if>

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
