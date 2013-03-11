
<%@ page import="hss.service.catalog.Serviceuser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'serviceuser.label', default: 'Service User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

			</ul>
		</div>
		<div id="list-serviceuser" class="content scaffold-list" role="main">
			<div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3> </div>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <section>
			<table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="users" title="${message(code: 'serviceuser.users.label', default: 'Users')}" />
					
						<g:sortableColumn property="role" title="${message(code: 'serviceuser.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="howtheyuse" title="${message(code: 'serviceuser.howtheyuse.label', default: 'How they use')}" />
					
						<g:sortableColumn property="motivation" title="${message(code: 'serviceuser.motivation.label', default: 'Motivation')}" />

                        <g:sortableColumn property="estimatedusers" title="${message(code: 'serviceuser.estimatedusers.label', default: 'Estimated total users')}" />

                        <g:sortableColumn property="peakusetimes" title="${message(code: 'serviceuser.peakusetimes.label', default: 'Peak use times')}" />

                        <g:sortableColumn property="frequencyofserviceoffering" title="${message(code: 'serviceuser.frequencyofserviceoffering.label', default: 'Frequency of service offering')}" />
					
						<th><g:message code="serviceuser.teamservices.label" default="Team Service" /></th>

                        <g:sortableColumn property="teamname" params="${teamservices_id}" title="${message(code: 'serviceuser.team.teamname.label', default: 'Team Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${serviceuserInstanceList}" status="i" var="serviceuserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${serviceuserInstance.id}">${fieldValue(bean: serviceuserInstance, field: "users")}</g:link></td>
					
						<td>${fieldValue(bean: serviceuserInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: serviceuserInstance, field: "howtheyuse")}</td>
					
						<td>${fieldValue(bean: serviceuserInstance, field: "motivation")}</td>

                        <td>${fieldValue(bean: serviceuserInstance, field: "estimatedusers")}</td>
					
						<td>${fieldValue(bean: serviceuserInstance, field: "peakusetimes")}</td>

                        <td>${fieldValue(bean: serviceuserInstance, field: "frequencyofserviceoffering")}</td>

                        <td>${fieldValue(bean: serviceuserInstance, field: "teamservices")}</td>

                        <td>${fieldValue(bean: serviceuserInstance.teamservices.team, field: "teamname")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${serviceuserInstanceTotal}" />
            </div>
        </div>
    </div>
	</body>
</html>
