
<%@ page import="hss.service.catalog.Teamservice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'teamservice.label', default: 'Team service')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="eso-inner">
		<div class="navbar" role="navigation">
			<ul class="nav">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link controller="teamtool" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: '1. Add service tools', args: [message(code: 'teamtool.label', default: 'Team Tools')])}</g:link></li>
                <li><g:link controller="serviceuser" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: '2. Add service users', args: [message(code: 'serviceuser.label', default: 'Service Users')])}</g:link></li>
                <li><g:link controller="costanalysis" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: '3. Add costs', args: [message(code: 'costanalysis.label', default: 'Cost Analysis')])}</g:link></li>
                <li><g:link controller="servicebenefit" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: '4. Add service benefits', args: [message(code: 'servicebenefit.label', default: 'Service Benefits')])}</g:link></li>
                <li><g:link controller="servicecompetitor" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: '5. Add Competitors', args: [message(code: 'servicecompetitor.label', default: 'a service competitor')])}</g:link></li>
                <li><g:link controller="serviceenvironment" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: '6. Add service enviro', args: [message(code: 'serviceenvironment.label', default: 'Service environments')])}</g:link></li>
                <li><g:link controller="swot" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: '7. Do SWOT', args: [message(code: 'swot.label', default: 'Swot')])}</g:link></li>
                <li><g:link controller="servicelevel" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: '8. Service Levels', args: [message(code: 'servicelevel.label', default: 'Service Levels')])}</g:link></li>
                <li></li>
			</ul>
		</div>

		<div id="show-teamservice" class="content scaffold-show" role="main">
			<div class="breadcrumb"><h3>Service provider <g:link controller="team" action="show" id="${teamserviceInstance?.team?.id}">${teamserviceInstance?.team?.teamname?.encodeAsHTML()}</g:link> for service ${teamserviceInstance?.servicename}</h3></div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

%{--
        <div class="formArea">
        <div class="form-horizontal">--}%

        <dl class="dl-horizontal">
			
            <g:if test="${teamserviceInstance?.servicename}">

                    <dt>Service Name: </dt>
                    <dd><g:fieldValue bean="${teamserviceInstance}" field="servicename"/></dd>

            </g:if>
			
		    <g:if test="${teamserviceInstance?.servicedescription}">

                    <dt>Service Description: </dt>
                    <dd><markdown:renderHtml><g:fieldValue bean="${teamserviceInstance}" field="servicedescription"/></markdown:renderHtml></dd>

            </g:if>

            <g:if test="${teamserviceInstance?.servicecontact}">

                    <dt><span id="servicecontact-label" class="property-label"><g:message code="teamservice.servicecontact.label" default="Service Contact" /></span>    </dt>
                    <dd><span class="property-value" aria-labelledby="servicecontact-label"><g:fieldValue bean="${teamserviceInstance}" field="servicecontact"/></span></dd>

            </g:if>
			
			<g:if test="${teamserviceInstance?.coreresponsibility}">

                    <dt><span id="coreresponsibility-label" class="property-label"><g:message code="teamservice.coreresponsibility.label" default="Core Responsibility" /></span>  </dt>

                    <dd><span class="property-value" aria-labelledby="coreresponsibility-label"><markdown:renderHtml><g:fieldValue bean="${teamserviceInstance}" field="coreresponsibility"/></markdown:renderHtml></span></dd>

            </g:if>
			
			<g:if test="${teamserviceInstance?.competencyalignment}">

                    <dt><span id="competencyalignment-label" class="property-label"><g:message code="teamservice.competencyalignment.label" default="Competency Alignment" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="competencyalignment-label"><markdown:renderHtml><g:fieldValue bean="${teamserviceInstance}" field="competencyalignment"/></markdown:renderHtml></span></dd>

            </g:if>

            <g:if test="${teamserviceInstance?.tools}">

                    <div class="page-header"><h4><span class="badge badge-warning">1</span><g:message code="teamservice.tools.label" default="Tools Used" /></h4></div>

                    <p class="help-block">Number of tools: ${teamserviceInstance?.tools?.size()}</p>

            </g:if>
        <g:else test="${teamserviceInstance?.tools < 0}">
            <p class="text-warning">You need to add in some tools</p>
        </g:else>
                <div class="btn btn-mini"><g:link controller="teamtool" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'Add a tool', args: [message(code: 'teamtool.label', default: 'Team Tools')])}</g:link></div>
                    <table class="eso-table">
                        <thead>
                        <tr>
                            <g:sortableColumn property="toolname" title="${message(code: 'teamtool.toolname.label', default: 'Tool Name')}" />

                            <g:sortableColumn property="tooluse" title="${message(code: 'teamtool.tooluse.label', default: 'Tool Use')}" />

                            <g:sortableColumn property="toolmotivation" title="${message(code: 'teamtool.toolmotivation.label', default: 'Tool Motivation')}" />

                            <th><g:message code="teamtool.teamservices.label" default="Teamservices" /></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${teamserviceInstance.tools}" status="i" var="teamtoolInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:link controller="teamtool" action="show" id="${teamtoolInstance?.id}">${teamtoolInstance?.toolname}</g:link></td>

                                <td>${fieldValue(bean: teamtoolInstance, field: "tooluse")}</td>

                                <td>${fieldValue(bean: teamtoolInstance, field: "toolmotivation")}</td>

                                <td>${fieldValue(bean: teamtoolInstance, field: "teamservices")}</td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>


            <g:if test="${teamserviceInstance?.servicesusers}">

                     <div class="page-header"><h4><span class="badge badge-warning">2</span><g:message code="teamservice.serviceusers.label" default="2. Service Users" /></h4></div>
%{--
                        <g:each in="${teamserviceInstance.servicesusers}" var="s">
                            <dd><span class="property-value" aria-labelledby="servicesusers-label"><g:link controller="serviceuser" action="show" id="${s.id}">${s?.users?.encodeAsHTML()} - ${s?.role?.encodeAsHTML()}</g:link></span></dd>
                        </g:each>--}%
            </g:if>
        <g:else test="${teamserviceInstance?.tools < 0}">
            <p class="text-warning">You need to add who uses your service</p>
        </g:else>
            <div class="btn btn-mini"><g:link controller="serviceuser" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'Add users', args: [message(code: 'serviceuser.label', default: 'Service Users')])}</g:link></div>
        <table class="eso-table">
            <thead>
            <tr>
                <g:sortableColumn property="users" title="${message(code: 'serviceuser.users.label', default: 'Users')}" />

                <g:sortableColumn property="role" title="${message(code: 'serviceuser.role.label', default: 'Role')}" />

                <g:sortableColumn property="howtheyuse" title="${message(code: 'serviceuser.howtheyuse.label', default: 'How they use')}" />

                <g:sortableColumn property="motivation" title="${message(code: 'serviceuser.motivation.label', default: 'Motivation')}" />

                <g:sortableColumn property="estimatedusers" title="${message(code: 'serviceuser.estimatedusers.label', default: 'Estimated total users')}" />

                <g:sortableColumn property="peakusetimes" title="${message(code: 'serviceuser.peakusetimes.label', default: 'Peak use times')}" />

                <g:sortableColumn property="frequencyofserviceoffering" title="${message(code: 'serviceuser.frequencyofserviceoffering.label', default: 'frequencyofserviceoffering')}" />

                <th><g:message code="serviceuser.teamservices.label" default="Team Service" /></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${teamserviceInstance.servicesusers}" status="i" var="serviceuserInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show" id="${serviceuserInstance.id}">${fieldValue(bean: serviceuserInstance, field: "users")}</g:link></td>

                    <td>${fieldValue(bean: serviceuserInstance, field: "role")}</td>

                    <td>${fieldValue(bean: serviceuserInstance, field: "howtheyuse")}</td>

                    <td>${fieldValue(bean: serviceuserInstance, field: "motivation")}</td>

                    <td>${fieldValue(bean: serviceuserInstance, field: "estimatedusers")}</td>

                    <td>${fieldValue(bean: serviceuserInstance, field: "peakusetimes")}</td>

                    <td>${fieldValue(bean: serviceuserInstance, field: "frequencyofserviceoffering")}</td>

                    <td>${fieldValue(bean: serviceuserInstance, field: "teamservices")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>

<g:if test="${teamserviceInstance?.costs}">

            <div class="page-header"><h4><span class="badge badge-warning">3</span><g:message code="teamservice.costs.label" default="Costs" /></h4></div>
            </g:if>
        <g:else test="${teamserviceInstance?.tools < 0}">
            <p class="text-warning">You need to add in your costs</p>
        </g:else>

            <div class="btn btn-mini"><g:link controller="costanalysis" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'Add costs', args: [message(code: 'costanalysis.label', default: 'Cost Analysis')])}</g:link></div>
                <table class="eso-table">
                    <thead>
                    <tr>
                        <g:sortableColumn property="costname" title="${message(code: 'costanalysis.costname.label', default: 'Cost Name')}" />

                        <g:sortableColumn property="rapcost" title="${message(code: 'costanalysis.rapcost.label', default: 'RAP Cost')}" />

                        <g:sortableColumn property="eipcost" title="${message(code: 'costanalysis.eipcost.label', default: 'EIP Cost')}" />

                        <g:sortableColumn property="pacost" title="${message(code: 'costanalysis.pacost.label', default: 'PA Cost')}" />

                        <g:sortableColumn property="iedcost" title="${message(code: 'costanalysis.iedcost.label', default: 'IED Cost')}" />

                        <g:sortableColumn property="engopscost" title="${message(code: 'costanalysis.engopscost.label', default: 'Eng-Ops Cost')}" />

                        <g:sortableColumn property="qecosts" title="${message(code: 'costanalysis.qecost.label', default: 'QE Cost')}" />

                        <g:sortableColumn property="othercosts" title="${message(code: 'costanalysis.othercosts.label', default: 'Other Costs')}" />
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${teamserviceInstance.costs}" status="i" var="costanalysisInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link  controller="costanalysis" action="show" id="${costanalysisInstance.id}">${fieldValue(bean: costanalysisInstance, field: "costname")}</g:link></td>

                            <td>${fieldValue(bean: costanalysisInstance, field: "rapcost")}</td>

                            <td>${fieldValue(bean: costanalysisInstance, field: "eipcost")}</td>

                            <td>${fieldValue(bean: costanalysisInstance, field: "pacost")}</td>

                            <td>${fieldValue(bean: costanalysisInstance, field: "iedcost")}</td>

                            <td>${fieldValue(bean: costanalysisInstance, field: "engopscost")}</td>

                            <td>${fieldValue(bean: costanalysisInstance, field: "qecost")}</td>

                            <td>${fieldValue(bean: costanalysisInstance, field: "othercosts")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>


<g:if test="${teamserviceInstance?.servicebenefits}">

                    <div class="page-header"><h4><span class="badge badge-warning">4</span><g:message code="teamservice.servicebenefits.label" default="Service Benefits" /></h4></div>

            </g:if>
        <g:else test="${teamserviceInstance?.tools < 0}">
            <p class="text-warning">You need to add what benefits your service offers to others</p>
        </g:else>
            <div class="btn btn-mini"><g:link controller="servicebenefit" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'Add service benefits', args: [message(code: 'servicebenefit.label', default: 'Service Benefits')])}</g:link></div>
        <table class="eso-table">
            <thead>
            <tr>
                <g:sortableColumn property="benefit" title="${message(code: 'servicebenefit.benefit.label', default: 'Service Benefit')}" />
                <g:sortableColumn property="benefitmeasure" title="${message(code: 'servicebenefit.benefitmeasure.label', default: 'Service benefit measure')}" />

            <th><g:message code="servicebenefit.teamservices.label" default="Team service" /></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${teamserviceInstance.servicebenefits}" status="i" var="servicebenefitInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show" id="${servicebenefitInstance.id}">${fieldValue(bean: servicebenefitInstance, field: "benefit")}</g:link></td>

                    <td>${fieldValue(bean: servicebenefitInstance, field: "benefitmeasure")}</td>

                    <td>${fieldValue(bean: servicebenefitInstance, field: "teamservices")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>



<g:if test="${teamserviceInstance?.competitors}">

                    <div class="page-header"><h4><span class="badge badge-warning">5</span><g:message code="teamservice.competitors.label" default="Competitors" /></h4></div>

			</g:if>
        <g:else test="${teamserviceInstance?.tools < 0}">
            <p class="text-warning">You still need to add in your competitors</p>
        </g:else>
            <div class="btn btn-mini"><g:link controller="servicecompetitor" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'Add Competitors', args: [message(code: 'servicecompetitor.label', default: 'a service competitor')])}</g:link></div>
        <table class="eso-table">
            <thead>
            <tr>
                <g:sortableColumn property="competitorname" title="${message(code: 'servicecompetitor.competitorname.label', default: 'Competitor name')}" />

                <g:sortableColumn property="competitorservice" title="${message(code: 'servicecompetitor.competitorservice.label', default: 'Competitor service')}" />

                <g:sortableColumn property="competitordescription" title="${message(code: 'servicecompetitor.competitordescription.label', default: 'Competitor description')}" />

                <g:sortableColumn property="compservicedifference" title="${message(code: 'servicecompetitor.compservicedifference.label', default: 'Compservice difference')}" />

                <g:sortableColumn property="whousescompservice" title="${message(code: 'servicecompetitor.whousescompservice.label', default: 'Who uses comp service')}" />

                <g:sortableColumn property="competitorsmotivation" title="${message(code: 'servicecompetitor.competitorsmotivation.label', default: 'Competitors motivation')}" />

                <g:sortableColumn property="competitorsvalue" title="${message(code: 'servicecompetitor.competitorvalue.label', default: 'Competitors value')}" />

                <g:sortableColumn property="teamservice" title="${message(code: 'servicecompetitor.teamservices.label', default: 'Service Link')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${teamserviceInstance.competitors}" status="i" var="servicecompetitorInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show" id="${servicecompetitorInstance.id}">${fieldValue(bean: servicecompetitorInstance, field: "competitorname")}</g:link></td>

                    <td>${fieldValue(bean: servicecompetitorInstance, field: "competitorservice")}</td>

                    <td>${fieldValue(bean: servicecompetitorInstance, field: "competitordescription")}</td>

                    <td>${fieldValue(bean: servicecompetitorInstance, field: "compservicedifference")}</td>

                    <td>${fieldValue(bean: servicecompetitorInstance, field: "whousescompservice")}</td>

                    <td>${fieldValue(bean: servicecompetitorInstance, field: "competitorsmotivation")}</td>

                    <td>${fieldValue(bean: servicecompetitorInstance, field: "competitorvalue")}</td>

                    <td>${fieldValue(bean: servicecompetitorInstance.teamservices, field:"servicename")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>




<g:if test="${teamserviceInstance?.serviceenvironments}">

                    <div class="page-header"><h4><span class="badge badge-warning">6</span><g:message code="teamservice.serviceenvironments.label" default="Service environment" /></h4></div>

            </g:if>
        <g:else test="${teamserviceInstance?.tools < 0}">
            <p class="text-warning">You need to add your service environments</p>
        </g:else>
            <div class="btn btn-mini"><g:link controller="serviceenvironment" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'Add service enviro', args: [message(code: 'serviceenvironment.label', default: 'Service environments')])}</g:link></div>
        <table class="eso-table">
            <thead>
            <tr>

                <g:sortableColumn property="successfactors" title="${message(code: 'serviceenvironment.successfactors.label', default: 'Success factors')}" />

                <g:sortableColumn property="successmeasure" title="${message(code: 'serviceenvironment.successmeasure.label', default: 'Success measures')}" />

                <th><g:message code="serviceenvironment.teamservices.label" default="Team service" /></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${teamserviceInstance.serviceenvironments}" status="i" var="serviceenvironmentInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show" id="${serviceenvironmentInstance.id}">${fieldValue(bean: serviceenvironmentInstance, field: "successfactors")}</g:link></td>

                    <td>${fieldValue(bean: serviceenvironmentInstance, field: "successmeasure")}</td>

                    <td>${fieldValue(bean: serviceenvironmentInstance, field: "teamservices")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>



<g:if test="${teamserviceInstance?.swots}">

                    <div class="page-header"><h4><span class="badge badge-warning">7</span><g:message code="teamservice.swots.label" default="Swot" /></h4></div>

			</g:if>
        <g:else test="${teamserviceInstance?.tools < 0}">
            <p class="text-warning">You need to build a SWOT for this service</p>
        </g:else>
            <div class="btn btn-mini"><g:link controller="swot" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'Do SWOT', args: [message(code: 'swot.label', default: 'Swot')])}</g:link></div>
                  <table class="eso-table">
                    <thead>
                    <tr>
                        <g:sortableColumn property="swotnumber" title="${message(code: 'swot.swotnumber.label', default: 'Swot number')}" />

                        <g:sortableColumn property="strength" title="${message(code: 'swot.strength.label', default: 'Strengths')}" />

                        <g:sortableColumn property="opportunities" title="${message(code: 'swot.opportunities.label', default: 'Opportunities')}" />

                        <g:sortableColumn property="weaknesses" title="${message(code: 'swot.weaknesses.label', default: 'Weaknesses')}" />

                        <g:sortableColumn property="threats" title="${message(code: 'swot.threats.label', default: 'Threats')}" />

                        <g:sortableColumn property="gaps" title="${message(code: 'swot.gaps.label', default: 'Gaps')}" />

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${teamserviceInstance.swots}" status="i" var="swotInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link controller="swot" action="show" id="${swotInstance.id}">${fieldValue(bean: swotInstance, field: "swotnumber")}</g:link></td>

                            <td>${fieldValue(bean: swotInstance, field: "strength")}</td>

                            <td>${fieldValue(bean: swotInstance, field: "opportunities")}</td>

                            <td>${fieldValue(bean: swotInstance, field: "weaknesses")}</td>

                            <td>${fieldValue(bean: swotInstance, field: "threats")}</td>

                            <td>${fieldValue(bean: swotInstance, field: "gaps")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>


<g:if test="${teamserviceInstance?.servicelevels}">
                <div class="page-header"><h4><span class="badge badge-warning">8</span><g:message code="teamservice.servicelevels.label" default="Service levels" /></h4></div>
            </g:if>
        <g:else test="${teamserviceInstance?.tools < 0}">
            <p class="text-warning">You need to build your SLA for this service</p>
        </g:else>
            <div class="btn btn-mini"><g:link controller="servicelevel" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'Add SLA', args: [message(code: 'servicelevel.label', default: 'Service Levels')])}</g:link></div>

                <table class="eso-table">
                    <thead>
                        <tr>
                <g:sortableColumn property="slaname" title="${message(code: 'servicelevel.slaname.label', default: 'Level Name')}" />
                <g:sortableColumn property="slatype" title="${message(code: 'servicelevel.slatype.label', default: 'Type')}" />
                <g:sortableColumn property="servicehours" title="${message(code: 'servicelevel.servicehours.label', default: 'SOB')}" />
                <g:sortableColumn property="businesshours" title="${message(code: 'servicelevel.businesshours.label', default: 'BO')}" />
                <g:sortableColumn property="peakusage" title="${message(code: 'servicelevel.peakusage.label', default: 'Peak')}" />
                <g:sortableColumn property="responsetime" title="${message(code: 'servicelevel.responsetime.label', default: 'Response')}" />
                <g:sortableColumn property="peakusers" title="${message(code: 'servicelevel.peakusers.label', default: 'Peak Users')}" />
                <g:sortableColumn property="offpeakusers" title="${message(code: 'servicelevel.offpeakusers.label', default: 'Off Peak')}" />
                <g:sortableColumn property="whatifnoservice" title="${message(code: 'servicelevel.whatifnoservice.label', default: 'No Service')}" />
                <g:sortableColumn property="slareview" title="${message(code: 'servicelevel.slareview.label', default: 'Review time')}" />
                <g:sortableColumn property="implementrequire" title="${message(code: 'servicelevel.implementrequire.label', default: 'Implement')}" />
                <g:sortableColumn property="servicelifetime" title="${message(code: 'servicelevel.servicelifetime.label', default: 'Lifetime')}" />
                <g:sortableColumn property="frequencyservice" title="${message(code: 'servicelevel.frequencyservice.label', default: 'Frequency')}" />
                        </tr>
                    </thead>
                <tbody>
                    <g:each in="${teamserviceInstance.servicelevels}" status="i" var="servicelevelInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:link controller="servicelevel" action="show" id="${servicelevelInstance.id}">${fieldValue(bean: servicelevelInstance, field: "slaname")}</g:link></td>
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


<g:if test="${teamserviceInstance?.team}">

                    <dt><span id="team-label" class="property-label"><g:message code="teamservice.team.label" default="Team" /></span>        </dt>
					
					<dd><span class="property-value" aria-labelledby="team-label"><g:link controller="team" action="show" id="${teamserviceInstance?.team?.id}">${teamserviceInstance?.team?.teamname?.encodeAsHTML()}</g:link></span></dd>

            </g:if>

<g:if test="${teamserviceInstance?.lastUpdated}">

                     <dt><span id="lastUpdated-label" class="property-label"><g:message code="teamservice.lastUpdated.label" default="Last Updated" /></span></dt>

                     <dd><span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${teamserviceInstance}" field="lastUpdated"/></span></dd>

            </g:if>
			</dl>
        </div>

			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${teamserviceInstance?.id}" />
					<g:link class="edit" action="edit" id="${teamserviceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the entire service?')}');" />
				</fieldset>
			</g:form>
            </div>

		</div>
        </div>
	</body>
</html>
               <!--todo add in create links for new tools, costs, etc etc in show page -->
<!-- todo - add in deleted button to each table of tools, cost etc to allow user easy delete option -->