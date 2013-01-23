
<%@ page import="hss.service.catalog.Servicecompetitor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicecompetitor.label', default: 'Service competitor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
%{--				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="list-servicecompetitor" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3> </div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="competitorname" title="${message(code: 'servicecompetitor.competitorname.label', default: 'Competitor name')}" />
					
						<g:sortableColumn property="competitorservice" title="${message(code: 'servicecompetitor.competitorservice.label', default: 'Competitor service')}" />
					
						<g:sortableColumn property="competitordescription" title="${message(code: 'servicecompetitor.competitordescription.label', default: 'Competitor description')}" />
					
						<g:sortableColumn property="compservicedifference" title="${message(code: 'servicecompetitor.compservicedifference.label', default: 'Compservice difference')}" />
					
						<g:sortableColumn property="whousescompservice" title="${message(code: 'servicecompetitor.whousescompservice.label', default: 'Who uses comp service')}" />
					
						<g:sortableColumn property="competitorsmotivation" title="${message(code: 'servicecompetitor.competitorsmotivation.label', default: 'Competitors motivation')}" />

                        <g:sortableColumn property="competitorsvalue" title="${message(code: 'servicecompetitor.competitorvalue.label', default: 'Competitors value')}" />

                        <g:sortableColumn property="teamservice" title="${message(code: 'servicecompetitor.teamservices.label', default: 'Service Link')}"/>

					</tr>
				</thead>
				<tbody>
				<g:each in="${servicecompetitorInstanceList}" status="i" var="servicecompetitorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${servicecompetitorInstance.id}">${fieldValue(bean: servicecompetitorInstance, field: "competitorname")}</g:link></td>
					
						<td>${fieldValue(bean: servicecompetitorInstance, field: "competitorservice")}</td>
					
						<td>${fieldValue(bean: servicecompetitorInstance, field: "competitordescription")}</td>
					
						<td>${fieldValue(bean: servicecompetitorInstance, field: "compservicedifference")}</td>
					
						<td>${fieldValue(bean: servicecompetitorInstance, field: "whousescompservice")}</td>
					
						<td>${fieldValue(bean: servicecompetitorInstance, field: "competitorsmotivation")}</td>

                        <td>${fieldValue(bean: servicecompetitorInstance, field: "competitorvalue")}</td>

                        <td>${fieldValue(bean: servicecompetitorInstance.teamservices, field:"servicename")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${servicecompetitorInstanceTotal}" />
            </div>
            </div>
        </div>
	</body>
</html>
