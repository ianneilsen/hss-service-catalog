
<%@ page import="hss.communications.plan.Communicationplan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'communicationplan.label', default: 'Plan')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <script type="text/JavaScript" src="../js/eso-theme.js"></script>
        <script type="text/JavaScript" src="../js/plugins.js"></script>
        <script type="text/JavaScript" src="../js/lib/jquery-1.7.2.js"></script>
        <script type="text/JavaScript" src="../js/lib/dropdown.js"></script>
	</head>
	<body>

    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>

                <div class="btn-group">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                        Config Levels
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">

                        <li><g:link controller="commlevel" class="list" action="list"><g:message code="Config communication levels" args="[entityName]" /></g:link></li>
                    </ul>
                </div>
			</ul>
		</div>
		<div id="list-communicationplan" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
            <section>
			<table class="eso-table">
				<thead>
					<tr>
					
						<g:sortableColumn property="planname" title="${message(code: 'communicationplan.planname.label', default: 'Plan name')}" />
					
						<g:sortableColumn property="planoverview" title="${message(code: 'communicationplan.planoverview.label', default: 'Plan overview')}" />
					
						<g:sortableColumn property="planmeasures" title="${message(code: 'communicationplan.planmeasures.label', default: 'Plan measures')}" />
					
						<g:sortableColumn property="planchanges" title="${message(code: 'communicationplan.planchanges.label', default: 'Plan changes')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${communicationplanInstanceList}" status="i" var="communicationplanInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${communicationplanInstance.id}">${fieldValue(bean: communicationplanInstance, field: "planname")}</g:link></td>
					
						<td><markdown:renderHtml>${fieldValue(bean: communicationplanInstance, field: "planoverview")}</markdown:renderHtml></td>
					
						<td><markdown:renderHtml>${fieldValue(bean: communicationplanInstance, field: "planmeasures")}</markdown:renderHtml></td>
					
						<td><markdown:renderHtml>${fieldValue(bean: communicationplanInstance, field: "planchanges")}</markdown:renderHtml></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${communicationplanInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
