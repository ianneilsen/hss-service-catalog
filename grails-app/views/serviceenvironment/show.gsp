
<%@ page import="hss.service.catalog.Serviceenvironment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceenvironment.label', default: 'Service environment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-serviceenvironment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-serviceenvironment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list serviceenvironment">
			
				<g:if test="${serviceenvironmentInstance?.successfactors}">
				<li class="fieldcontain">
					<span id="successfactors-label" class="property-label"><g:message code="serviceenvironment.successfactors.label" default="Success factors" /></span>
					
						<span class="property-value" aria-labelledby="successfactors-label"><g:fieldValue bean="${serviceenvironmentInstance}" field="successfactors"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceenvironmentInstance?.successmeasure}">
				<li class="fieldcontain">
					<span id="successmeasure-label" class="property-label"><g:message code="serviceenvironment.successmeasure.label" default="Success measure" /></span>
					
						<span class="property-value" aria-labelledby="successmeasure-label"><g:fieldValue bean="${serviceenvironmentInstance}" field="successmeasure"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serviceenvironmentInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="serviceenvironment.teamservices.label" default="Team service" /></span>
					
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${serviceenvironmentInstance?.teamservices?.id}">${serviceenvironmentInstance?.teamservices?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${serviceenvironmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${serviceenvironmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete service environment entry?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
