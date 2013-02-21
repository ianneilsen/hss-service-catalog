<%@ page import="hss.service.catalog.Serviceenvironment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceenvironment.label', default: 'Service environment')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%

			</ul>
		</div>
        <!-- bread n errors -->
		<div id="edit-serviceenvironment" class="content scaffold-edit" role="main">
            <div class="breadcrumb"><h3><g:message code="default.edit.label" args="[entityName]" /></h3></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${serviceenvironmentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${serviceenvironmentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
    <!-- form and buttons -->
        <section>
            <div class="formArea">
                <div class="form-horizontal">
			<g:form method="post" >
				<g:hiddenField name="id" value="${serviceenvironmentInstance?.id}" />
				<g:hiddenField name="version" value="${serviceenvironmentInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
                </div>
            </div>

        </div>
    </div>
	</body>
</html>
