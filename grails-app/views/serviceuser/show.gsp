
<%@ page import="hss.service.catalog.Serviceuser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceuser.label', default: 'Service user')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-serviceuser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-serviceuser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serviceuser">
			
				<g:if test="${serviceuserInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="serviceuser.users.label" default="Users" /></span>
					
						<span class="property-value" aria-labelledby="users-label"><g:fieldValue bean="${serviceuserInstance}" field="users"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceuserInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="serviceuser.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${serviceuserInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceuserInstance?.howtheyuse}">
				<li class="fieldcontain">
					<span id="howtheyuse-label" class="property-label"><g:message code="serviceuser.howtheyuse.label" default="How they use service" /></span>
					
						<span class="property-value" aria-labelledby="howtheyuse-label"><g:fieldValue bean="${serviceuserInstance}" field="howtheyuse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceuserInstance?.motivation}">
				<li class="fieldcontain">
					<span id="motivation-label" class="property-label"><g:message code="serviceuser.motivation.label" default="Motivation" /></span>
					
						<span class="property-value" aria-labelledby="motivation-label"><g:fieldValue bean="${serviceuserInstance}" field="motivation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceuserInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="serviceuser.teamservices.label" default="Team Services" /></span>
					
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${serviceuserInstance?.teamservices?.id}">${serviceuserInstance?.teamservices?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${serviceuserInstance?.id}" />
					<g:link class="edit" action="edit" id="${serviceuserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the service user?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
