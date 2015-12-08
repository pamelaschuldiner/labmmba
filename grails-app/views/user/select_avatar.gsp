<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <fieldset>
            <legend>Avatar Upload</legend>
            <g:uploadForm action="upload_avatar">
                <input type="file" name="avatar" id="avatar" />
                <input type="submit" class="buttons" value="Upload" />
            </g:uploadForm>
        </fieldset>
    </body>
</html>
