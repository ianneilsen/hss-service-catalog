
<%@ page import="hss.service.catalog.Servicelevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicelevel.label', default: 'Service level')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav" role="navigation">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>

		<div id="list-servicelevel" class="content scaffold-list" role="main">
            <div class="breadcrumb"><h3><g:message code="default.list.label" args="[entityName]" /></h3></div>

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

                <section>
                <table class="eso-table">
				<thead>
					<tr>

                        <g:sortableColumn property="slaname" title="${message(code: 'servicelevel.slaname.label', default: 'Level Name')}" />
                        <g:sortableColumn property="slatype" title="${message(code: 'servicelevel.slatype.label', default: 'Type')}" />
                        <g:sortableColumn property="servicehours" title="${message(code: 'servicelevel.servicehours.label', default: 'Service Hours')}" />
                        <g:sortableColumn property="businesshours" title="${message(code: 'servicelevel.businesshours.label', default: 'Business Hours')}" />
                        <g:sortableColumn property="peakusage" title="${message(code: 'servicelevel.peakusage.label', default: 'Peak Usage Time')}" />
                        <g:sortableColumn property="responsetime" title="${message(code: 'servicelevel.responsetime.label', default: 'Response Time')}" />
                        <g:sortableColumn property="peakusers" title="${message(code: 'servicelevel.peakusers.label', default: 'Peak # of Users')}" />
                        <g:sortableColumn property="offpeakusers" title="${message(code: 'servicelevel.offpeakusers.label', default: 'Off Peak # Users')}" />
                        <g:sortableColumn property="whatifnoservice" title="${message(code: 'servicelevel.whatifnoservice.label', default: 'If No Service avail')}" />
                        <g:sortableColumn property="slareview" title="${message(code: 'servicelevel.slareview.label', default: 'SLA reviewed every')}" />
                        <g:sortableColumn property="implementrequire" title="${message(code: 'servicelevel.implementrequire.label', default: 'Implementation required')}" />
                        <g:sortableColumn property="servicelifetime" title="${message(code: 'servicelevel.servicelifetime.label', default: 'Lifetime of service')}" />
                        <g:sortableColumn property="frequencyservice" title="${message(code: 'servicelevel.frequencyservice.label', default: 'Frequency of service')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${servicelevelInstanceList}" status="i" var="servicelevelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${servicelevelInstance.id}">${fieldValue(bean: servicelevelInstance, field: "slaname")}</g:link></td>

                        <td>${fieldValue(bean: servicelevelInstance, field: "slatype")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "servicehours")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "businesshours")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "peakusage")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "responsetime")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "peakusers")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "offpeakusers")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "whatifnoservice")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "slareview")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "implementrequire")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "servicelifetime")}</td>
                        <td>${fieldValue(bean: servicelevelInstance, field: "frequencyservice")}</td>
					
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