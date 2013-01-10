
<%@ page import="hss.service.catalog.Serviceuser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceuser.label', default: 'Service User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-serviceuser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-serviceuser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="users" title="${message(code: 'serviceuser.users.label', default: 'Users')}" />
					
						<g:sortableColumn property="role" title="${message(code: 'serviceuser.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="howtheyuse" title="${message(code: 'serviceuser.howtheyuse.label', default: 'How they use')}" />
					
						<g:sortableColumn property="motivation" title="${message(code: 'serviceuser.motivation.label', default: 'Motivation')}" />
					
						<th><g:message code="serviceuser.teamservices.label" default="Team Service" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceuserInstanceList}" status="i" var="serviceuserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceuserInstance.id}">${fieldValue(bean: serviceuserInstance, field: "users")}</g:link></td>
					
						<td>${fieldValue(bean: serviceuserInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: serviceuserInstance, field: "howtheyuse")}</td>
					
						<td>${fieldValue(bean: serviceuserInstance, field: "motivation")}</td>
					
						<td>${fieldValue(bean: serviceuserInstance, field: "teamservices")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceuserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
