
<%@ page import="hss.service.catalog.Teamtool" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamtool.label', default: 'Team tool')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
		<div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="list-teamtool" class="content scaffold-list" role="main">
		<div class="breadcrumb"><h1><g:message code="default.list.label" args="[entityName]" /></h1> </div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="toolname" title="${message(code: 'teamtool.toolname.label', default: 'Tool Name')}" />
					
						<g:sortableColumn property="tooluse" title="${message(code: 'teamtool.tooluse.label', default: 'Tool Use')}" />
					
						<g:sortableColumn property="toolmotivation" title="${message(code: 'teamtool.toolmotivation.label', default: 'Tool Motivation')}" />
					
						<th><g:message code="teamtool.teamservices.label" default="Teamservices" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teamtoolInstanceList}" status="i" var="teamtoolInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${teamtoolInstance.id}">${fieldValue(bean: teamtoolInstance, field: "toolname")}</g:link></td>
					
						<td>${fieldValue(bean: teamtoolInstance, field: "tooluse")}</td>
					
						<td>${fieldValue(bean: teamtoolInstance, field: "toolmotivation")}</td>
					
						<td>${fieldValue(bean: teamtoolInstance, field: "teamservices")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${teamtoolInstanceTotal}" />
			</div>
		</div>
    </div>
	</body>
</html>
