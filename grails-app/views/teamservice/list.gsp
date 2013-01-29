
<%@ page import="hss.service.catalog.Teamservice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamservice.label', default: 'Team service')}" />
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

		<div id="list-teamservice" class="content scaffold-list" role="main">
			<div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3></div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <table class="eso-table">
				<thead>
					<tr>

                        <g:sortableColumn property="id" title="${message(code: 'teamservice.id.label', default: 'Id')}" />

                        <g:sortableColumn property="servicename" title="${message(code: 'teamservice.servicename.label', default: 'Service Name')}" />
					
						<g:sortableColumn property="servicedescription" title="${message(code: 'teamservice.servicedescription.label', default: 'Service Description')}" />

                        <g:sortableColumn property="catagoryname" title="${message(code: 'teamservice.catagoryname.label', default: 'Service Catagory')}" />

                        <g:sortableColumn property="baselevelservices" title="${message(code: 'teamservice.baselevelservices.label', default: 'Base service offering')}" />
					
						<g:sortableColumn property="coreresponsibility" title="${message(code: 'teamservice.coreresponsibility.label', default: 'Core Responsibility')}" />
					
						%{--<g:sortableColumn property="competencyalignment" title="${message(code: 'teamservice.competencyalignment.label', default: 'Competency Alignment')}" />--}%

                        <g:sortableColumn property="servicecontact" title="${message(code: 'teamservice.servicecontact.label', default: 'Service Contact')}" />
					
						<th><g:message code="team.teamname.label" default="Team Name" /></th>

                        <th><g:message code="team.teamdivision.label" default="Team Parent Division" /></th>

                        <g:sortableColumn property="lastUpdated" title="${message(code: 'teamservice.lastUpdated.label', default: 'Last Updated')}" />

                        <g:sortableColumn property="version" title="${message(code: 'teamservice.version.label', default: 'Version')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teamserviceInstanceList}" status="i" var="teamserviceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: teamserviceInstance, field: "id")}</td>

                        <td><g:link action="show" id="${teamserviceInstance.id}">${fieldValue(bean: teamserviceInstance, field: "servicename")}</g:link></td>
					
						<td>${fieldValue(bean: teamserviceInstance, field: "servicedescription")}</td>

                        <td>${fieldValue(bean: teamserviceInstance.servicecatagory, field: "catagoryname")}</td>

                        <td>${fieldValue(bean: teamserviceInstance, field: "baselevelservices")}</td>
					
						<td>${fieldValue(bean: teamserviceInstance, field: "coreresponsibility")}</td>
					
						%{--<td>${fieldValue(bean: teamserviceInstance, field: "competencyalignment")}</td>--}%

                        <td>${fieldValue(bean: teamserviceInstance, field: "servicecontact")}</td>

						<td>${fieldValue(bean: teamserviceInstance, field: "team")}</td>

                        %{--<td>${fieldValue(bean: teamserviceInstance, field: "team")}</td>--}%
                        <td>${teamserviceInstance?.team?.teamdivision}</td>

                        <td>${fieldValue(bean: teamserviceInstance, field: "lastUpdated")}</td>

                        <td>${fieldValue(bean: teamserviceInstance, field: "version")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${teamserviceInstanceTotal}" />
            </div>
        </div>
        </div>
	</body>
</html>
