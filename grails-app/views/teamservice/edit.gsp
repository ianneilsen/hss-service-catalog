<%@ page import="hss.service.catalog.Teamservice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamservice.label', default: 'Team service')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
		<div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			%{--	<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
        <!-- bread n errors -->
    <div id="edit-teamservice" class="content scaffold-edit" role="main">
	    <div class="breadcrumb"><h3><g:message code="default.edit.label" args="[entityName]" /></h3>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <g:hasErrors bean="${teamserviceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${teamserviceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

        <!-- form and buttons -->
    <div class="formArea">
        <div class="form-horizontal">
            <g:form method="post" >
				<g:hiddenField name="id" value="${teamserviceInstance?.id}" />
				<g:hiddenField name="version" value="${teamserviceInstance?.version}" />
			<fieldset class="form">
					<g:render template="form"/>
			</fieldset>
				<fieldset class="btn">
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
