
<%@ page import="hss.communications.plan.Commlevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'commlevel.label', default: 'Communication level')}" />
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
		<div id="list-commlevel" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <section>
			<table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="comlevelname" title="${message(code: 'commlevel.comlevelname.label', default: 'Level name')}" />
					
						<g:sortableColumn property="comleveldsecrip" title="${message(code: 'commlevel.comleveldsecrip.label', default: 'Level description')}" />
					
					%{--	<th><g:message code="commlevel.communications.label" default="Communications" /></th>--}%
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${commlevelInstanceList}" status="i" var="commlevelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${commlevelInstance.id}">${fieldValue(bean: commlevelInstance, field: "comlevelname")}</g:link></td>
					
						<td>${fieldValue(bean: commlevelInstance, field: "comleveldsecrip")}</td>
					
					%{--	<td>${fieldValue(bean: commlevelInstance, field: "communications")}</td>--}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${commlevelInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
