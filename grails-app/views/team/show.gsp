
<%@ page import="hss.service.catalog.Team" %>
<%@ page import="hss.service.catalog.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
		<div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link controller="teamtool" class="list" action="list"><g:message code="Tool List" args="[entityName]" /></g:link></li>
                <li><g:link controller="serviceuser" class="list" action="list"><g:message code="Service Users" args="[entityName]" /></g:link></li>
                <li><g:link controller="servicebenefit" class="list" action="list"><g:message code="Service Benefits" args="[entityName]" /></g:link></li>
                <li><g:link controller="costanalysis" class="list" action="list"><g:message code="Costs for services" args="[entityName]" /></g:link></li>
                <li><g:link controller="servicecompetitor" class="list" action="list"><g:message code="Service Competitiors" args="[entityName]" /></g:link></li>
                <li><g:link controller="serviceenvironment" class="list" action="list"><g:message code="Service Environment" args="[entityName]" /></g:link></li>
                <li><g:link controller="swot" class="list" action="list"><g:message code="SWOT" args="[entityName]" /></g:link></li>
                <li><g:link controller="teamservice" action="create" params="['team.id': teamInstance?.id]">${message(code: 'ADD a new service', args: [message(code: 'teamservice.label', default: 'a team service')])}</g:link></li>
			</ul>
		</div>

		<div id="show-team" class="content scaffold-show" role="main">
		<div class="breadcrumb"><h3><g:message code="default.show.label" args="[entityName]" /></h3> </div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <div class="formArea">
            <div class="form-horizontal">

            <dl class="dl-horizontal">

				<g:if test="${teamInstance?.teamname}">

				<dt>	<span id="teamname-label" class="property-label"><g:message code="team.teamname.label" default="Team Name" /></span>   </dt>

				<dd>		<span class="property-value" aria-labelledby="teamname-label"><g:fieldValue bean="${teamInstance}" field="teamname"/></span>    </dd>


				</g:if>
			
				<g:if test="${teamInstance?.teamdivision}">

				<dt>	<span id="teamdivision-label" class="property-label"><g:message code="team.teamdivision.label" default="Team Division" /></span>     </dt>
					
				<dd>		<span class="property-value" aria-labelledby="teamdivision-label"><g:fieldValue bean="${teamInstance}" field="teamdivision"/></span>    </dd>
					

				</g:if>

                <g:if test="${teamInstance?.lastUpdated}">

                    <dt>	<span id="lastUpdated-label" class="property-label"><g:message code="team.lastUpdated.label" default="Last Updated" /></span>   </dt>

                    <dd>		<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${teamInstance}" field="lastUpdated"/></span>    </dd>


                </g:if>
			
				<g:if test="${teamInstance?.teamservices}">

				<dt>	<span id="teamservices-label" class="property-label"><g:message code="team.teamservices.label" default="Teamservices" /></span>      </dt>
					
						<g:each in="${teamInstance.teamservices}" var="t">
				<dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>  </dd>
						</g:each>
					

				</g:if>

            </dl>
                <g:link controller="teamservice" action="create" params="['team.id': teamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'teamservice.label', default: 'a team service')])}</g:link>
                <table class="eso-table">
                    <thead>
                    <tr>

                        <g:sortableColumn property="servicename" title="${message(code: 'teamservice.servicename.label', default: 'Service Name')}" />

                        <g:sortableColumn property="servicedescription" title="${message(code: 'teamservice.servicedescription.label', default: 'Service Description')}" />

                        <g:sortableColumn property="coreresponsibility" title="${message(code: 'teamservice.coreresponsibility.label', default: 'Core Responsibility')}" />

                        <g:sortableColumn property="competencyalignment" title="${message(code: 'teamservice.competencyalignment.label', default: 'Competency Alignment')}" />

                        <th><g:message code="teamservice.team.label" default="Team" /></th>

                        <g:sortableColumn property="lastUpdated" title="${message(code: 'teamservice.lastUpdated.label', default: 'Last Updated')}" />

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${teamInstance?.teamservices}" status="i" var="teamserviceInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${teamInstance.teamservices.id}">${fieldValue(bean: teamserviceInstance, field: "servicename")}</g:link></td>


                            <td>${fieldValue(bean: teamserviceInstance, field: "servicedescription")}</td>

                            <td>${fieldValue(bean: teamserviceInstance, field: "coreresponsibility")}</td>

                            <td>${fieldValue(bean: teamserviceInstance, field: "competencyalignment")}</td>

                            <td>${fieldValue(bean: teamserviceInstance, field: "team")}</td>

                            <td>${fieldValue(bean: teamserviceInstance, field: "lastUpdated")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
                <g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${teamInstance?.id}" />
					<div class="btn btn-primary"> <g:link class="edit" action="edit" id="${teamInstance?.id}"><g:message code="default.button.edit.label" default="Edit Team" /></g:link></div>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			    </g:form>
		</div>
      </div>
    </div>
  </body>
</html>
