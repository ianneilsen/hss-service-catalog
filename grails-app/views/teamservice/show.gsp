
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
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="show-teamservice" class="content scaffold-show" role="main">
			<div class="breadcrumb"><h1><g:message code="default.show.label" args="[entityName]" /></h1></div>

            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>


        <div class="formArea">
            <div class="form-horizontal">
                <dl class="dl-horizontal">
			
				        <g:if test="${teamserviceInstance?.servicename}">

				<dt> <span id="servicename-label" class="property-label"><g:message code="teamservice.servicename.label" default="Service Name" /></span></dt>
					
						<dd><span class="property-value" aria-labelledby="servicename-label"><g:fieldValue bean="${teamserviceInstance}" field="servicename"/></span></dd>


                        </g:if>
			
				<g:if test="${teamserviceInstance?.servicedescription}">

                <dt> <span id="servicedescription-label" class="property-label"><g:message code="teamservice.servicedescription.label" default="Service Description" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="servicedescription-label"><g:fieldValue bean="${teamserviceInstance}" field="servicedescription"/></span></dd>


                </g:if>
			
				<g:if test="${teamserviceInstance?.coreresponsibility}">

                    <dt>	<span id="coreresponsibility-label" class="property-label"><g:message code="teamservice.coreresponsibility.label" default="Core Responsibility" /></span>  </dt>

                    <dd><span class="property-value" aria-labelledby="coreresponsibility-label"><g:fieldValue bean="${teamserviceInstance}" field="coreresponsibility"/></span></dd>


                </g:if>
			
				<g:if test="${teamserviceInstance?.competencyalignment}">

                    <dt>	<span id="competencyalignment-label" class="property-label"><g:message code="teamservice.competencyalignment.label" default="Competency Alignment" /></span>    </dt>

                    <dd><span class="property-value" aria-labelledby="competencyalignment-label"><g:fieldValue bean="${teamserviceInstance}" field="competencyalignment"/></span></dd>


                </g:if>

                <g:if test="${teamserviceInstance?.tools}">

                    <dt>        <span id="tools-label" class="property-label"><g:message code="teamservice.tools.label" default="1. Tools Used" /></span>   </dt>

                        <g:each in="${teamserviceInstance.tools}" var="t">
                            <dd><span class="property-value" aria-labelledby="tools-label"><g:link controller="teamtool" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span></dd>
                        </g:each>


                </g:if>

                <g:if test="${teamserviceInstance?.servicesusers}">

                    <dt>        <span id="servicesusers-label" class="property-label"><g:message code="teamservice.servicesusers.label" default="2. Service Users" /></span>  </dt>

                        <g:each in="${teamserviceInstance.servicesusers}" var="s">
                            <dd><span class="property-value" aria-labelledby="servicesusers-label"><g:link controller="serviceuser" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span></dd>
                        </g:each>


                </g:if>

                <g:if test="${teamserviceInstance?.costs}">

                    <dt>        <span id="costs-label" class="property-label"><g:message code="teamservice.costs.label" default="3. Costs" /></span>    </dt>

                        <g:each in="${teamserviceInstance.costs}" var="c">
                            <dd><span class="property-value" aria-labelledby="costs-label"><g:link controller="costanalysis" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span></dd>
                        </g:each>


                </g:if>

                <g:if test="${teamserviceInstance?.servicebenefits}">

                    <dt>       <span id="servicebenefits-label" class="property-label"><g:message code="teamservice.servicebenefits.label" default="4. Service Benefits" /></span>   </dt>

                    <g:each in="${teamserviceInstance.servicebenefits}" var="s">
                        <dd><span class="property-value" aria-labelledby="servicebenefits-label"><g:link controller="servicebenefit" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span></dd>
                    </g:each>


                </g:if>

				<g:if test="${teamserviceInstance?.competitors}">

                    <dt>	<span id="competitors-label" class="property-label"><g:message code="teamservice.competitors.label" default="5. Competitors" /></span> </dt>
					
						<g:each in="${teamserviceInstance.competitors}" var="c">
                            <dd><span class="property-value" aria-labelledby="competitors-label"><g:link controller="servicecompetitor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span></dd>
                        </g:each>
					

				</g:if>

                <g:if test="${teamserviceInstance?.serviceenvironments}">

                    <dt>   <span id="serviceenvironments-label" class="property-label"><g:message code="teamservice.serviceenvironments.label" default="6. Service environment" /></span> </dt>

                        <g:each in="${teamserviceInstance.serviceenvironments}" var="e">
                            <dd><span class="property-value" aria-labelledby="serviceenvironment-label"><g:link controller="serviceenvironment" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span></dd>
                        </g:each>


                </g:if>

				<g:if test="${teamserviceInstance?.swots}">

                    <dt>	<span id="swots-label" class="property-label"><g:message code="teamservice.swots.label" default="7 .Swots" /></span>    </dt>
					
						<g:each in="${teamserviceInstance.swots}" var="s">
                            <dd><span class="property-value" aria-labelledby="swots-label"><g:link controller="swot" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span></dd>
                        </g:each>
					

				</g:if>
			
				<g:if test="${teamserviceInstance?.team}">

                    <dt>	<span id="team-label" class="property-label"><g:message code="teamservice.team.label" default="Team" /></span>        </dt>
					
					<dd><span class="property-value" aria-labelledby="team-label"><g:link controller="team" action="show" id="${teamserviceInstance?.team?.id}">${teamserviceInstance?.team?.encodeAsHTML()}</g:link></span></dd>


                </g:if>
			 </dl>

			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${teamserviceInstance?.id}" />
					<g:link class="edit" action="edit" id="${teamserviceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'This will delete the entire service?')}');" />
				</fieldset>
			</g:form>
		</div>
        </div>
	</body>
</html>
