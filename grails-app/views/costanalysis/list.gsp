
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
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="list-costanalysis" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3> </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="costname" title="${message(code: 'costanalysis.costname.label', default: 'Cost Name')}" />
					
						<g:sortableColumn property="rapcost" title="${message(code: 'costanalysis.rapcost.label', default: 'RAP Cost')}" />
					
						<g:sortableColumn property="eipcost" title="${message(code: 'costanalysis.eipcost.label', default: 'EIP Cost')}" />
					
						<g:sortableColumn property="pacost" title="${message(code: 'costanalysis.pacost.label', default: 'PA Cost')}" />
					
						<g:sortableColumn property="iedcost" title="${message(code: 'costanalysis.iedcost.label', default: 'IED Cost')}" />
					
						<g:sortableColumn property="engopscost" title="${message(code: 'costanalysis.engopscost.label', default: 'Eng-Ops Cost')}" />

                        <g:sortableColumn property="qecosts" title="${message(code: 'costanalysis.qecost.label', default: 'QE Cost')}" />

                        <g:sortableColumn property="othercosts" title="${message(code: 'costanalysis.othercosts.label', default: 'Other Costs')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${costanalysisInstanceList}" status="i" var="costanalysisInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${costanalysisInstance.id}">${fieldValue(bean: costanalysisInstance, field: "costname")}</g:link></td>
					
						<td>${fieldValue(bean: costanalysisInstance, field: "rapcost")}</td>
					
						<td>${fieldValue(bean: costanalysisInstance, field: "eipcost")}</td>
					
						<td>${fieldValue(bean: costanalysisInstance, field: "pacost")}</td>
					
						<td>${fieldValue(bean: costanalysisInstance, field: "iedcost")}</td>
					
						<td>${fieldValue(bean: costanalysisInstance, field: "engopscost")}</td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "qecost")}</td>

                        <td>${fieldValue(bean: costanalysisInstance, field: "othercosts")}</td>
					
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
