
<%@ page import="hss.service.catalog.Servicecompetitor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicecompetitor.label', default: 'Service competitor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-servicecompetitor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-servicecompetitor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list servicecompetitor">
			
				<g:if test="${servicecompetitorInstance?.competitorname}">
				<li class="fieldcontain">
					<span id="competitorname-label" class="property-label"><g:message code="servicecompetitor.competitorname.label" default="Competitor name" /></span>
					
						<span class="property-value" aria-labelledby="competitorname-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitorname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicecompetitorInstance?.competitorservice}">
				<li class="fieldcontain">
					<span id="competitorservice-label" class="property-label"><g:message code="servicecompetitor.competitorservice.label" default="Competitor service" /></span>
					
						<span class="property-value" aria-labelledby="competitorservice-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitorservice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicecompetitorInstance?.competitordescription}">
				<li class="fieldcontain">
					<span id="competitordescription-label" class="property-label"><g:message code="servicecompetitor.competitordescription.label" default="Competitor description" /></span>
					
						<span class="property-value" aria-labelledby="competitordescription-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitordescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicecompetitorInstance?.compservicedifference}">
				<li class="fieldcontain">
					<span id="compservicedifference-label" class="property-label"><g:message code="servicecompetitor.compservicedifference.label" default="Compservice difference" /></span>
					
						<span class="property-value" aria-labelledby="compservicedifference-label"><g:fieldValue bean="${servicecompetitorInstance}" field="compservicedifference"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicecompetitorInstance?.whousescompservice}">
				<li class="fieldcontain">
					<span id="whousescompservice-label" class="property-label"><g:message code="servicecompetitor.whousescompservice.label" default="Who uses competitior service" /></span>
					
						<span class="property-value" aria-labelledby="whousescompservice-label"><g:fieldValue bean="${servicecompetitorInstance}" field="whousescompservice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicecompetitorInstance?.competitorsmotivation}">
				<li class="fieldcontain">
					<span id="competitorsmotivation-label" class="property-label"><g:message code="servicecompetitor.competitorsmotivation.label" default="Competitors motivation" /></span>
					
						<span class="property-value" aria-labelledby="competitorsmotivation-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitorsmotivation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicecompetitorInstance?.competitorvalue}">
				<li class="fieldcontain">
					<span id="competitorvalue-label" class="property-label"><g:message code="servicecompetitor.competitorvalue.label" default="Competitor value" /></span>
					
						<span class="property-value" aria-labelledby="competitorvalue-label"><g:fieldValue bean="${servicecompetitorInstance}" field="competitorvalue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicecompetitorInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="servicecompetitor.teamservices.label" default="Team service" /></span>
					
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${servicecompetitorInstance?.teamservices?.id}">${servicecompetitorInstance?.teamservices?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${servicecompetitorInstance?.id}" />
					<g:link class="edit" action="edit" id="${servicecompetitorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete competitor service?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
