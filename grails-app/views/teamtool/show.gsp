
<%@ page import="hss.service.catalog.Teamtool" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamtool.label', default: 'Team tool')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
		%{--<a href="#show-teamtool" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
		<div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="show-teamtool" class="content scaffold-show" role="main">
			<div class="breadcrumb"> <h1><g:message code="default.show.label" args="[entityName]" /></h1>   </div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list teamtool">
			
				<g:if test="${teamtoolInstance?.toolname}">
				<li class="fieldcontain">
					<span id="toolname-label" class="property-label"><g:message code="teamtool.toolname.label" default="Tool Name" /></span>
					
						<span class="property-value" aria-labelledby="toolname-label"><g:fieldValue bean="${teamtoolInstance}" field="toolname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamtoolInstance?.tooluse}">
				<li class="fieldcontain">
					<span id="tooluse-label" class="property-label"><g:message code="teamtool.tooluse.label" default="Tool Use" /></span>
					
						<span class="property-value" aria-labelledby="tooluse-label"><g:fieldValue bean="${teamtoolInstance}" field="tooluse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamtoolInstance?.toolmotivation}">
				<li class="fieldcontain">
					<span id="toolmotivation-label" class="property-label"><g:message code="teamtool.toolmotivation.label" default="Tool Motivation" /></span>
					
						<span class="property-value" aria-labelledby="toolmotivation-label"><g:fieldValue bean="${teamtoolInstance}" field="toolmotivation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${teamtoolInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="teamtool.teamservices.label" default="Team Service" /></span>
					
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${teamtoolInstance?.teamservices?.id}">${teamtoolInstance?.teamservices?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${teamtoolInstance?.id}" />
					<g:link class="edit" action="edit" id="${teamtoolInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
    </div>
    </body>
</html>
