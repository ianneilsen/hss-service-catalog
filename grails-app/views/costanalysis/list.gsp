
<%@ page import="hss.service.catalog.Costanalysis" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'costanalysis.label', default: 'Cost analysis')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>

		<div id="list-costanalysis" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3> </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <section>
            <table class="eso-table">
				<thead>
					<tr>

                        <g:sortableColumn property="role" title="${message(code: 'costanalysis.role.label', default: 'Cost Role')}" />

                        <g:sortableColumn property="reason" title="${message(code: 'costanalysis.reason.label', default: 'reason for this Cost')}" />

                        <g:sortableColumn property="cost" title="${message(code: 'costanalysis.cost.label', default: 'Cost in Hrs')}" />

                        <g:sortableColumn property="othercosts" title="${message(code: 'costanalysis.othercosts.label', default: 'Other costs')}" />

                        <g:sortableColumn property="totalmoneycosts" title="${message(code: 'costanalysis.totalmoneycosts.label', default: 'Total $ costs')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${costanalysisInstanceList}" status="i" var="costanalysisInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link  controller="costanalysis" action="show" id="${costanalysisInstance.id}">${fieldValue(bean: costanalysisInstance, field: "role")}</g:link></td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "reason")}</td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "cost")}</td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "othercosts")}</td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "totalmoneycosts")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
            </div>
			<div class="pagination">
				<g:paginate total="${costanalysisInstanceTotal}" />
            </div>

        </div>
	</body>
</html>

