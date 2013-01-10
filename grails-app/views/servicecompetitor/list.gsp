
<%@ page import="hss.service.catalog.Servicecompetitor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicecompetitor.label', default: 'Service competitor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-servicecompetitor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-servicecompetitor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="competitorname" title="${message(code: 'servicecompetitor.competitorname.label', default: 'Competitor name')}" />
					
						<g:sortableColumn property="competitorservice" title="${message(code: 'servicecompetitor.competitorservice.label', default: 'Competitor service')}" />
					
						<g:sortableColumn property="competitordescription" title="${message(code: 'servicecompetitor.competitordescription.label', default: 'Competitor description')}" />
					
						<g:sortableColumn property="compservicedifference" title="${message(code: 'servicecompetitor.compservicedifference.label', default: 'Compservice difference')}" />
					
						<g:sortableColumn property="whousescompservice" title="${message(code: 'servicecompetitor.whousescompservice.label', default: 'Who uses comp service')}" />
					
						<g:sortableColumn property="competitorsmotivation" title="${message(code: 'servicecompetitor.competitorsmotivation.label', default: 'Competitors motivation')}" />
					
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
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${servicecompetitorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
