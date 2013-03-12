<%@ page import="hss.communications.plan.Communication" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communication.label', default: 'Communication')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

                <li><g:link controller="communicationplan" action="show" id="${communicationInstance?.commplan?.id}"> Cancel</g:link></li>
			</ul>
		</div>
		<div id="edit-communication" class="content scaffold-edit" role="main">
            <div class="breadcrumb"><h3><g:message code="default.edit.label" args="[entityName]" /></h3></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${communicationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${communicationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
         <section>
                <div class="form-horizontal">
			<g:form method="post" >
				<g:hiddenField name="id" value="${communicationInstance?.id}" />
				<g:hiddenField name="version" value="${communicationInstance?.version}" />
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
	</body>
</html>
