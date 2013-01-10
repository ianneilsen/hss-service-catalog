
<%@ page import="hss.service.catalog.Swot" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'swot.label', default: 'Swot')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-swot" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-swot" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list swot">
			
				<g:if test="${swotInstance?.swotnumber}">
				<li class="fieldcontain">
					<span id="swotnumber-label" class="property-label"><g:message code="swot.swotnumber.label" default="Swot number" /></span>
					
						<span class="property-value" aria-labelledby="swotnumber-label"><g:fieldValue bean="${swotInstance}" field="swotnumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${swotInstance?.strength}">
				<li class="fieldcontain">
					<span id="strength-label" class="property-label"><g:message code="swot.strength.label" default="Strengths" /></span>
					
						<span class="property-value" aria-labelledby="strength-label"><g:fieldValue bean="${swotInstance}" field="strength"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${swotInstance?.opportunities}">
				<li class="fieldcontain">
					<span id="opportunities-label" class="property-label"><g:message code="swot.opportunities.label" default="Opportunities" /></span>
					
						<span class="property-value" aria-labelledby="opportunities-label"><g:fieldValue bean="${swotInstance}" field="opportunities"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${swotInstance?.weaknesses}">
				<li class="fieldcontain">
					<span id="weaknesses-label" class="property-label"><g:message code="swot.weaknesses.label" default="Weaknesses" /></span>
					
						<span class="property-value" aria-labelledby="weaknesses-label"><g:fieldValue bean="${swotInstance}" field="weaknesses"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${swotInstance?.threats}">
				<li class="fieldcontain">
					<span id="threats-label" class="property-label"><g:message code="swot.threats.label" default="Threats" /></span>
					
						<span class="property-value" aria-labelledby="threats-label"><g:fieldValue bean="${swotInstance}" field="threats"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${swotInstance?.gaps}">
				<li class="fieldcontain">
					<span id="gaps-label" class="property-label"><g:message code="swot.gaps.label" default="Gaps" /></span>
					
						<span class="property-value" aria-labelledby="gaps-label"><g:fieldValue bean="${swotInstance}" field="gaps"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${swotInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="swot.teamservices.label" default="for team service" /></span>
					
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${swotInstance?.teamservices?.id}">${swotInstance?.teamservices?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${swotInstance?.id}" />
					<g:link class="edit" action="edit" id="${swotInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the swot for ${swotInstance?.teamservice?.id}?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
