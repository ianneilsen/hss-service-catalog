
<%@ page import="hss.service.catalog.Servicebenefit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicebenefit.label', default: 'Service benefit')}" />
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
		<div id="list-servicebenefit" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3> </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <section>
            <table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="benefit" title="${message(code: 'servicebenefit.benefit.label', default: 'Service Benefit')}" />
					
						<g:sortableColumn property="benefitmeasure" title="${message(code: 'servicebenefit.benefitmeasure.label', default: 'Service benefit measure')}" />
					
						<th><g:message code="servicebenefit.teamservices.label" default="Team service" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${servicebenefitInstanceList}" status="i" var="servicebenefitInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${servicebenefitInstance.id}">${fieldValue(bean: servicebenefitInstance, field: "benefit")}</g:link></td>
					
						<td>${fieldValue(bean: servicebenefitInstance, field: "benefitmeasure")}</td>
					
						<td>${fieldValue(bean: servicebenefitInstance, field: "teamservices")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${servicebenefitInstanceTotal}" />
            </div>
            </div>
        </div>
	</body>
</html>
