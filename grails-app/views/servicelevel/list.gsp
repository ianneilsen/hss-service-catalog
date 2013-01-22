
<%@ page import="hss.service.catalog.Servicelevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicelevel.label', default: 'Servicelevel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-servicelevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-servicelevel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="businesshours" title="${message(code: 'servicelevel.businesshours.label', default: 'Business hours')}" />
					
						<g:sortableColumn property="frequencyservice" title="${message(code: 'servicelevel.frequencyservice.label', default: 'Frequency service')}" />
					
						<g:sortableColumn property="implementrequire" title="${message(code: 'servicelevel.implementrequire.label', default: 'Implementationrequired')}" />
					
						<g:sortableColumn property="offpeakusers" title="${message(code: 'servicelevel.offpeakusers.label', default: 'Offpeak number of users')}" />
					
						<g:sortableColumn property="peakusage" title="${message(code: 'servicelevel.peakusage.label', default: 'Peak usage is')}" />
					
						<g:sortableColumn property="peakusers" title="${message(code: 'servicelevel.peakusers.label', default: 'Peak number users')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${servicelevelInstanceList}" status="i" var="servicelevelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${servicelevelInstance.id}">${fieldValue(bean: servicelevelInstance, field: "businesshours")}</g:link></td>
					
						<td>${fieldValue(bean: servicelevelInstance, field: "frequencyservice")}</td>
					
						<td>${fieldValue(bean: servicelevelInstance, field: "implementrequire")}</td>
					
						<td>${fieldValue(bean: servicelevelInstance, field: "offpeakusers")}</td>
					
						<td>${fieldValue(bean: servicelevelInstance, field: "peakusage")}</td>
					
						<td>${fieldValue(bean: servicelevelInstance, field: "peakusers")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${servicelevelInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
                      <!-- todo ad in remaining fields for service level table -->