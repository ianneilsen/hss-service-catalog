
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
%{--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link controller="teamservice" class="list" action="list"><g:message code="Service list" args="[entityName]" /></g:link></li>
				<li><g:link controller="teamtool" class="list" action="list"><g:message code="Tool list" args="[entityName]" /></g:link></li>
                <li><g:link controller="serviceuser" class="list" action="list"><g:message code="Service Users list" args="[entityName]" /></g:link></li>
                <li><g:link controller="servicebenefit" class="list" action="list"><g:message code="Service Benefits list" args="[entityName]" /></g:link></li>
                <li><g:link controller="costanalysis" class="list" action="list"><g:message code="Costs for services list" args="[entityName]" /></g:link></li>
                <li><g:link controller="servicecompetitor" class="list" action="list"><g:message code="Service Competitiors list" args="[entityName]" /></g:link></li>
                <li><g:link controller="serviceenvironment" class="list" action="list"><g:message code="Service Environment" args="[entityName]" /></g:link></li>
                <li><g:link controller="swot" class="list" action="list"><g:message code="SWOT" args="[entityName]" /></g:link></li>--}%
                <li><g:link controller="teamservice" action="create" params="['team.id': teamInstance?.id]">${message(code: 'ADD a new service', args: [message(code: 'teamservice.label', default: 'a team service')])}</g:link></li>
			</ul>
		</div>

		<div id="show-team" class="content scaffold-show" role="main">
		<div class="breadcrumb"><h3>Service provider information</h3> </div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

           %{-- <div class="formArea">--}%
            %{--<div class="form-horizontal">--}%

            <dl class="dl-horizontal">

				<g:if test="${teamInstance?.teamname}">

				<dt>	<span id="teamname-label" class="property-label"><g:message code="team.teamname.label" default="Service provider/Owner" /></span>   </dt>

				<dd>		<span class="property-value" aria-labelledby="teamname-label"><g:fieldValue bean="${teamInstance}" field="teamname"/></span>    </dd>


				</g:if>
			
				<g:if test="${teamInstance?.teamdivision}">

				<dt>	<span id="teamdivision-label" class="property-label"><g:message code="team.teamdivision.label" default="Business Group" /></span>     </dt>
					
				<dd>		<span class="property-value" aria-labelledby="teamdivision-label"><g:fieldValue bean="${teamInstance}" field="teamdivision"/></span>    </dd>
					

				</g:if>

                <g:if test="${teamInstance?.teamcontact}">

                    <dt>	<span id="teamcontact-label" class="property-label"><g:message code="team.teamcontact.label" default="Team Contact" /></span>     </dt>

                    <dd>		<span class="property-value" aria-labelledby="teamcontact-label"><g:fieldValue bean="${teamInstance}" field="teamcontact"/></span>    </dd>


                </g:if>

                <g:if test="${teamInstance?.lastUpdated}">

                    <dt>	<span id="lastUpdated-label" class="property-label"><g:message code="team.lastUpdated.label" default="Last Updated" /></span>   </dt>

                    <dd>		<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${teamInstance}" field="lastUpdated"/></span>    </dd>


                </g:if>
			
	%{--			<g:if test="${teamInstance?.teamservices}">

				<dt>	<span id="teamservices-label" class="property-label"><g:message code="team.teamservices.label" default="Team Services list" /></span>      </dt>
					
						<g:each in="${teamInstance.teamservices}" var="t">
				<dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>  </dd>
						</g:each>

				</g:if>--}%

                <dt>	<span id="teamservicescount-label" class="property-label"><g:message code="Services total" default="Total services" /></span>      </dt>
                <dd>${teamInstance?.teamservices?.size()}</dd>

            </dl>
                <g:form>
                    <fieldset class="btn">
                        <g:hiddenField name="id" value="${teamInstance?.id}" />
                        <div class="btn btn-primary"> <g:link class="edit" action="edit" id="${teamInstance?.id}"><g:message code="default.button.edit.label" default="Edit Team" /></g:link></div>
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>


            <section>
                <g:link controller="teamservice" action="create" params="['team.id': teamInstance?.id]">${message(code: '<b>+<b> ADD a new team service', args: [message(code: 'teamservice.label', default: 'a new team service')])}</g:link>
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

                        <g:sortableColumn property="lastUpdated" title="${message(code: 'teamservice.lastUpdated.label', default: 'Last Updated')}" />

                        <g:sortableColumn property="serviceactive" title="${message(code: 'teamservice.serviceactive.label', default: 'Service Active')}" />

                        <g:sortableColumn property="version" title="${message(code: 'teamservice.version.label', default: 'Version')}" />

                        <g:sortableColumn title="Action" property="edit" />

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${teamInstance?.teamservices}" status="i" var="teamserviceInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td>${fieldValue(bean: teamserviceInstance, field: "id")}</td>

                            <td><g:link controller="teamservice" action="show" id="${teamserviceInstance.id}">${fieldValue(bean: teamserviceInstance, field: "servicename")}</g:link></td>


                            <td>${fieldValue(bean: teamserviceInstance, field: "servicedescription")}</td>

                            <td>${fieldValue(bean: teamserviceInstance.servicecatagory, field: "catagoryname")}</td>

                            <td>${fieldValue(bean: teamserviceInstance, field: "baselevelservices")}</td>

                            <td>${fieldValue(bean: teamserviceInstance, field: "coreresponsibility")}</td>

                            %{--<td>${fieldValue(bean: teamserviceInstance, field: "competencyalignment")}</td>--}%

                            <td>${fieldValue(bean: teamserviceInstance, field: "lastUpdated")}</td>

                            <td>${fieldValue(bean: teamserviceInstance, field: "serviceactive")}</td>

                            <td>${fieldValue(bean: teamserviceInstance, field: "version")}</td>

                            <td><g:link controller="teamservice" action="edit" name="edit" id="${teamserviceInstance.id}">+Edit</g:link> </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>


		</div>
    %{--  </div>
    </div>--}%
  </body>
</html>
       <!-- todo move edit and delete buttons inside table -->
<!--todo show service categories on landing page -->