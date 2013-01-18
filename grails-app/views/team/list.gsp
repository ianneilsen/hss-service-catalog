
<%@ page import="hss.service.catalog.Team" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
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
        <div class="content">
		<div id="list-team" class="content scaffold-list" role="main">
			<div class="breadcrumb"> <h3><g:message code="default.list.label" args="[entityName]" /></h3></div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <table class="eso-table">

				<thead>
					<tr>
					
						<g:sortableColumn property="teamname" title="${message(code: 'team.teamname.label', default: 'Team Name')}" />
					
						<g:sortableColumn property="teamdivision" title="${message(code: 'team.teamdivision.label', default: 'Team Division')}" />

                        <g:sortableColumn property="dateCreated" title="${message(code: 'team.dateCreated.lable', default: 'Date Created')}"/>

                        <g:sortableColumn property="lastUpdated" title="${message(code: 'team.lastUpdated.lable', default: 'Last Updated')}"/>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${teamInstanceList}" status="i" var="teamInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${teamInstance.id}">${fieldValue(bean: teamInstance, field: "teamname")}</g:link></td>
					
						<td>${fieldValue(bean: teamInstance, field: "teamdivision")}</td>

                        <td>${fieldValue(bean: teamInstance, field: "dateCreated")}</td>

                        <td>${fieldValue(bean: teamInstance, field: "lastUpdated")}</td>


					
					</tr>
				</g:each>
				</tbody>
			</table>
            </div>

              <div class="pagination">
				<g:paginate total="${teamInstanceTotal}" />
			  </div>
           <p><span class="badge badge-success"> Total teams in service capture: ${teamInstanceTotal}</span></p>
           <p><span class="badge badge-success"> Total services captured: ${hss.service.catalog.Teamservice.count}</span></p>
		    </div>

        </div>
    </div>
</body>
</html>
