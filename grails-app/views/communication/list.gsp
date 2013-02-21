
<%@ page import="hss.communications.plan.Communication" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communication.label', default: 'Communication')}" />
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
		<div id="list-communication" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <section>
            <table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="communication" title="${message(code: 'communication.communication.label', default: 'Communication')}" />
					
						<g:sortableColumn property="purpose" title="${message(code: 'communication.purpose.label', default: 'Purpose')}" />
					
						<g:sortableColumn property="targetGroups" title="${message(code: 'communication.targetGroups.label', default: 'Target Groups')}" />
					
						<g:sortableColumn property="expectations" title="${message(code: 'communication.expectations.label', default: 'Expectations')}" />
					
						<g:sortableColumn property="communicator" title="${message(code: 'communication.communicator.label', default: 'Communicator')}" />
					
						<g:sortableColumn property="datacollector" title="${message(code: 'communication.datacollector.label', default: 'Datacollector')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${communicationInstanceList}" status="i" var="communicationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${communicationInstance.id}">${fieldValue(bean: communicationInstance, field: "communication")}</g:link></td>
					
						<td>${fieldValue(bean: communicationInstance, field: "purpose")}</td>
					
						<td>${fieldValue(bean: communicationInstance, field: "targetGroups")}</td>
					
						<td>${fieldValue(bean: communicationInstance, field: "expectations")}</td>
					
						<td>${fieldValue(bean: communicationInstance, field: "communicator")}</td>
					
						<td>${fieldValue(bean: communicationInstance, field: "datacollector")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${communicationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
