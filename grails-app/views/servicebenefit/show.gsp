
<%@ page import="hss.service.catalog.Servicebenefit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicebenefit.label', default: 'Service benefit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-servicebenefit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-servicebenefit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list servicebenefit">
			
				<g:if test="${servicebenefitInstance?.benefit}">
				<li class="fieldcontain">
					<span id="benefit-label" class="property-label"><g:message code="servicebenefit.benefit.label" default="Service  Benefit" /></span>
					
						<span class="property-value" aria-labelledby="benefit-label"><g:fieldValue bean="${servicebenefitInstance}" field="benefit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicebenefitInstance?.benefitmeasure}">
				<li class="fieldcontain">
					<span id="benefitmeasure-label" class="property-label"><g:message code="servicebenefit.benefitmeasure.label" default="Service benefit measure" /></span>
					
						<span class="property-value" aria-labelledby="benefitmeasure-label"><g:fieldValue bean="${servicebenefitInstance}" field="benefitmeasure"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicebenefitInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="servicebenefit.teamservices.label" default="Team service" /></span>
					
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${servicebenefitInstance?.teamservices?.id}">${servicebenefitInstance?.teamservices?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${servicebenefitInstance?.id}" />
					<g:link class="edit" action="edit" id="${servicebenefitInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the service benefit?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
