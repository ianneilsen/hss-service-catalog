
<%@ page import="hss.service.catalog.Team" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

        <script type="text/JavaScript" src="../js/eso-theme.js"></script>
        <script type="text/JavaScript" src="../js/plugins.js"></script>
        <script type="text/JavaScript" src="../js/lib/jquery-1.7.2.js"></script>
        <script type="text/JavaScript" src="../js/lib/dropdown.js"></script>
     %{--   <script type="text/JavaScript" src="../js/lib/tab.js"></script>
        <script type="text/JavaScript" src="../js/lib/modal.js"></script>--}%
      %{--  <script type="text/JavaScript" src="../js/jquery-1.8.3.js"></script>
        <script type="text/JavaScript" src="../js/jquery-1.8.3.min.js"></script>--}%

	</head>
	<body>
    <div class="eso-inner">
		<div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    %{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%


                <li><g:link controller="communicationplan" class="list" action="list"><g:message code="Communication Plans" args="[entityName]" /></g:link></li>

                <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                    Admin Lists
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><g:link controller="teamservice" class="list" action="list"><g:message code="Services list" args="[entityName]" /></g:link></li>
                    <li><g:link controller="teamtool" class="list" action="list"><g:message code="Tools list" args="[entityName]" /></g:link></li>
                    <li><g:link controller="serviceuser" class="list" action="list"><g:message code="Service Users list" args="[entityName]" /></g:link></li>
                    <li><g:link controller="servicebenefit" class="list" action="list"><g:message code="Service Benefits list" args="[entityName]" /></g:link></li>
                    <li><g:link controller="costanalysis" class="list" action="list"><g:message code="Costs for services list" args="[entityName]" /></g:link></li>
                    <li><g:link controller="servicecompetitor" class="list" action="list"><g:message code="Service Competitiors list" args="[entityName]" /></g:link></li>
                    <li><g:link controller="serviceenvironment" class="list" action="list"><g:message code="Service Environment list" args="[entityName]" /></g:link></li>
                    <li><g:link controller="swot" class="list" action="list"><g:message code="SWOT lists" args="[entityName]" /></g:link></li>
                    <li><g:link controller="servicelevel" class="list" action="list"><g:message code="SLAs" args="[entityName]" /></g:link></li>
                </ul>
                </div>
                <div class="btn-group">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                        Config Categories
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="servicecatagory" class="list" action="list"><g:message code="Config service catagories" args="[entityName]" /></g:link></li>
                        <li><g:link controller="commlevel" class="list" action="list"><g:message code="Config communication levels" args="[entityName]" /></g:link></li>
                    </ul>
                </div>

            </ul>
		</div>
        <div class="content">
		<div id="list-team" class="content scaffold-list" role="main">
			<div class="breadcrumb"> <h3>%{--<g:message code="default.list.label" args="[entityName]" />--}%Service Provider list</h3></div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <section>
            <table class="eso-table">

				<thead>
					<tr>
					
						<g:sortableColumn property="teamname" title="${message(code: 'team.teamname.label', default: 'Service Provider')}" />
					
						<g:sortableColumn property="teamdivision" title="${message(code: 'team.teamdivision.label', default: 'Business Group')}" />

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

                     <!-- TODO need project name -->
                     <!-- todo - prepopulate team name and division from orgchart -java cristiano speak to-->
                        <!-- todo - got xml-rpc and jar file from maitai -->
					
					</tr>
				</g:each>
				</tbody>
			</table>
            </div>

              <div class="pagination">
				<g:paginate total="${teamInstanceTotal}" />
			  </div>
            <section>
           <p><span class="badge badge-success"> Total teams as service providers: ${teamInstanceTotal}</span></p>
           <p><span class="badge badge-success"> Total services provided: ${hss.service.catalog.Teamservice.count}</span></p>
		    </div>

        </div>
    <div class="catagory-list">
        Placeholder for service catagory display - allow users to choose from catagories to dislay list of service by service providers.
    </div>
</body>

</html>
