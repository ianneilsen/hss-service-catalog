
<%@ page import="hss.service.catalog.Costanalysis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costanalysis.label', default: 'Cost analysis')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-costanalysis" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-costanalysis" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list costanalysis">
			
				<g:if test="${costanalysisInstance?.costname}">
				<li class="fieldcontain">
					<span id="costname-label" class="property-label"><g:message code="costanalysis.costname.label" default="Cost Name" /></span>
					
						<span class="property-value" aria-labelledby="costname-label"><g:fieldValue bean="${costanalysisInstance}" field="costname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costanalysisInstance?.rapcost}">
				<li class="fieldcontain">
					<span id="rapcost-label" class="property-label"><g:message code="costanalysis.rapcost.label" default="RAP Costs" /></span>
					
						<span class="property-value" aria-labelledby="rapcost-label"><g:fieldValue bean="${costanalysisInstance}" field="rapcost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costanalysisInstance?.eipcost}">
				<li class="fieldcontain">
					<span id="eipcost-label" class="property-label"><g:message code="costanalysis.eipcost.label" default="EIP Costs" /></span>
					
						<span class="property-value" aria-labelledby="eipcost-label"><g:fieldValue bean="${costanalysisInstance}" field="eipcost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costanalysisInstance?.pacost}">
				<li class="fieldcontain">
					<span id="pacost-label" class="property-label"><g:message code="costanalysis.pacost.label" default="PA Costs" /></span>
					
						<span class="property-value" aria-labelledby="pacost-label"><g:fieldValue bean="${costanalysisInstance}" field="pacost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costanalysisInstance?.iedcost}">
				<li class="fieldcontain">
					<span id="iedcost-label" class="property-label"><g:message code="costanalysis.iedcost.label" default="IED Costs" /></span>
					
						<span class="property-value" aria-labelledby="iedcost-label"><g:fieldValue bean="${costanalysisInstance}" field="iedcost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costanalysisInstance?.engopscost}">
				<li class="fieldcontain">
					<span id="engopscost-label" class="property-label"><g:message code="costanalysis.engopscost.label" default="Eng-Ops Costs" /></span>
					
						<span class="property-value" aria-labelledby="engopscost-label"><g:fieldValue bean="${costanalysisInstance}" field="engopscost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costanalysisInstance?.qecost}">
				<li class="fieldcontain">
					<span id="qecost-label" class="property-label"><g:message code="costanalysis.qecost.label" default="QE Costs" /></span>
					
						<span class="property-value" aria-labelledby="qecost-label"><g:fieldValue bean="${costanalysisInstance}" field="qecost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costanalysisInstance?.othercosts}">
				<li class="fieldcontain">
					<span id="othercosts-label" class="property-label"><g:message code="costanalysis.othercosts.label" default="Other costs" /></span>
					
						<span class="property-value" aria-labelledby="othercosts-label"><g:fieldValue bean="${costanalysisInstance}" field="othercosts"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${costanalysisInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="costanalysis.teamservices.label" default="Team service" /></span>
					
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${costanalysisInstance?.teamservices?.id}">${costanalysisInstance?.teamservices?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${costanalysisInstance?.id}" />
					<g:link class="edit" action="edit" id="${costanalysisInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the costs?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
