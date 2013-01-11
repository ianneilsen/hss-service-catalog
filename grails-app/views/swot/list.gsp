
<%@ page import="hss.service.catalog.Swot" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'swot.label', default: 'Swot')}" />
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
		<div id="list-swot" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3> </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="swotnumber" title="${message(code: 'swot.swotnumber.label', default: 'Swot number')}" />
					
						<g:sortableColumn property="strength" title="${message(code: 'swot.strength.label', default: 'Strengths')}" />
					
						<g:sortableColumn property="opportunities" title="${message(code: 'swot.opportunities.label', default: 'Opportunities')}" />
					
						<g:sortableColumn property="weaknesses" title="${message(code: 'swot.weaknesses.label', default: 'Weaknesses')}" />
					
						<g:sortableColumn property="threats" title="${message(code: 'swot.threats.label', default: 'Threats')}" />
					
						<g:sortableColumn property="gaps" title="${message(code: 'swot.gaps.label', default: 'Gaps')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${swotInstanceList}" status="i" var="swotInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${swotInstance.id}">${fieldValue(bean: swotInstance, field: "swotnumber")}</g:link></td>
					
						<td>${fieldValue(bean: swotInstance, field: "strength")}</td>
					
						<td>${fieldValue(bean: swotInstance, field: "opportunities")}</td>
					
						<td>${fieldValue(bean: swotInstance, field: "weaknesses")}</td>
					
						<td>${fieldValue(bean: swotInstance, field: "threats")}</td>
					
						<td>${fieldValue(bean: swotInstance, field: "gaps")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${swotInstanceTotal}" />
            </div>
            </div>
        </div>
	</body>
</html>
