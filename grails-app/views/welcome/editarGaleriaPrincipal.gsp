<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        <li><g:link url="j_spring_security_logout">Logout</g:link></li>
    </ul>
</div>
<div id="list-user" class="content scaffold-list" role="main">
    <h1><g:message message="Galeria Principal" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <h1>Imagenes</h1>
    <table>
        <g:each in="${images}" var="img">
                <tr>
                    <td><g:link controller="welcome" action="media" params='[tipo: "imagen", name: "${img.name}"]'>${img.name}</g:link></td>
                    <td>
                        <g:form controller="welcome" action="delete_media"  params='[tipo: "imagen", name: "${img.name}"]'  method="delete">
                            <g:submitButton name="eliminar" value="Eliminar" onclick="return confirm('¿Está usted seguro?');">Eliminar</g:submitButton>
                        </g:form>
                    </td>
                </tr>
        </g:each>
    </table>
    <li>
        <g:form controller="welcome" action="upload_imagen" enctype="multipart/form-data">
            <input type="file" name="imagen" size="40" required="true" accept="image/*">
            <g:actionSubmit value="Subir" action="upload_imagen"/>
        </g:form>
    </li>

    <h1>Videos</h1>
    <table>
        <g:each in="${videos}" var="video">
                <tr>
                    <td><g:link controller="welcome" action="media" params='[tipo: "video", name: "${video.name}"]'>${video.name}</g:link></td>
                    <td>
                        <g:form controller="welcome" action="delete_media"  params='[tipo: "video", name: "${video.name}"]'  method="delete">
                            <g:submitButton name="eliminar" value="Eliminar" onclick="return confirm('¿Está usted seguro?');">Eliminar</g:submitButton>
                        </g:form>
                    </td>
                </tr>
        </g:each>
    </table>
    <li>
        <g:form controller="welcome" action="upload_video" enctype="multipart/form-data">
            <input type="file" name="video" size="40" required="true" accept="video/mp4">
            <g:actionSubmit value="Subir" action="upload_video"/>
        </g:form>
    </li>


    <div class="pagination">
        <g:paginate total="${userCount ?: 0}" />
    </div>
</div>
</body>
</html>