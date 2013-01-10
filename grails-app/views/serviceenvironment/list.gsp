
<%@ page import="hss.service.catalog.Serviceenvironment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceenvironment.label', default: 'Service environment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-serviceenvironment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-serviceenvironment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="successfactors" title="${message(code: 'serviceenvironment.successfactors.label', default: 'Success factors')}" />
					
						<g:sortableColumn property="successmeasure" title="${message(code: 'serviceenvironment.successmeasure.label', default: 'Success measures')}" />

						<th><g:message code="serviceenvironment.teamservices.label" default="Team service" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceenvironmentInstanceList}" status="i" var="serviceenvironmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceenvironmentInstance.id}">${fieldValue(bean: serviceenvironmentInstance, field: "successfactors")}</g:link></td>
					
						<td>${fieldValue(bean: serviceenvironmentInstance, field: "successmeasure")}</td>
					
						<td>${fieldValue(bean: serviceenvironmentInstance, field: "teamservices")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceenvironmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
