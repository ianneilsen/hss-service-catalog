
<%@ page import="hss.service.catalog.Servicelevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicelevel.label', default: 'Servicelevel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="eso-inner">
        <div class="navbar" role="navigation">
            <ul class="nav" role="navigation">
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
%{--				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
                <li><g:link  action="show" controller="teamservice" id="${servicelevelInstance?.teamservices?.id}"><g:message code="Back to ${servicelevelInstance?.teamservices?.encodeAsHTML()}" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<div id="show-servicelevel" class="content scaffold-show" role="main">
            <div class="breadcrumb"><h3><g:message code="default.show.label" args="[entityName]" /></h3>

				<g:if test="${flash.message}">
			        <div class="message" role="status">${flash.message}</div>
			    </g:if>

        <div class="formArea">
            <div class="form-horizontal">
                <dl class="dl-horizontal">


                <g:if test="${servicelevelInstance?.slaname}">

                    <dt><span id="slaname-label" class="property-label"><g:message code="servicelevel.slaname.label" default="Sla name" /></span> </dt>

                        <dd><span class="property-value" aria-labelledby="slaname-label"><g:fieldValue bean="${servicelevelInstance}" field="slaname"/></span> </dd>

                </g:if>

                <g:if test="${servicelevelInstance?.slatype}">

                    <dt><span id="slatype-label" class="property-label"><g:message code="servicelevel.slatype.label" default="Sla type" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="slatype-label"><g:fieldValue bean="${servicelevelInstance}" field="slatype"/></span></dd>


                </g:if>
			
				<g:if test="${servicelevelInstance?.businesshours}">

                    <dt><span id="businesshours-label" class="property-label"><g:message code="servicelevel.businesshours.label" default="Business hours" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="businesshours-label"><g:fieldValue bean="${servicelevelInstance}" field="businesshours"/></span></dd>
					

				</g:if>

                <g:if test="${servicelevelInstance?.servicehours}">

                    <dt><span id="servicehours-label" class="property-label"><g:message code="servicelevel.servicehours.label" default="Service hours" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="servicehours-label"><g:fieldValue bean="${servicelevelInstance}" field="servicehours"/></span></dd>

                </g:if>
			
				<g:if test="${servicelevelInstance?.frequencyservice}">

                    <dt><span id="frequencyservice-label" class="property-label"><g:message code="servicelevel.frequencyservice.label" default="Frequency of service" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="frequencyservice-label"><g:fieldValue bean="${servicelevelInstance}" field="frequencyservice"/></span></dd>

				</g:if>
			
				<g:if test="${servicelevelInstance?.implementrequire}">

                    <dt><span id="implementrequire-label" class="property-label"><g:message code="servicelevel.implementrequire.label" default="Implementation required" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="implementrequire-label"><g:fieldValue bean="${servicelevelInstance}" field="implementrequire"/></span></dd>
					

				</g:if>
			
				<g:if test="${servicelevelInstance?.offpeakusers}">

                    <dt><span id="offpeakusers-label" class="property-label"><g:message code="servicelevel.offpeakusers.label" default="Offpeak number of users" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="offpeakusers-label"><g:fieldValue bean="${servicelevelInstance}" field="offpeakusers"/></span></dd>
					

				</g:if>
			
				<g:if test="${servicelevelInstance?.peakusage}">

                    <dt><span id="peakusage-label" class="property-label"><g:message code="servicelevel.peakusage.label" default="Peak usage time" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="peakusage-label"><g:fieldValue bean="${servicelevelInstance}" field="peakusage"/></span></dd>
					

				</g:if>
			
				<g:if test="${servicelevelInstance?.peakusers}">

                    <dt><span id="peakusers-label" class="property-label"><g:message code="servicelevel.peakusers.label" default="Peak number of users" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="peakusers-label"><g:fieldValue bean="${servicelevelInstance}" field="peakusers"/></span></dd>
					

				</g:if>
			
				<g:if test="${servicelevelInstance?.responsetime}">

                    <dt><span id="responsetime-label" class="property-label"><g:message code="servicelevel.responsetime.label" default="Response times" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="responsetime-label"><g:fieldValue bean="${servicelevelInstance}" field="responsetime"/></span></dd>
					

				</g:if>

			
				<g:if test="${servicelevelInstance?.servicelifetime}">

                    <dt><span id="servicelifetime-label" class="property-label"><g:message code="servicelevel.servicelifetime.label" default="Service lifetime" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="servicelifetime-label"><g:fieldValue bean="${servicelevelInstance}" field="servicelifetime"/></span></dd>
					

				</g:if>

				<g:if test="${servicelevelInstance?.slareview}">

                    <dt><span id="slareview-label" class="property-label"><g:message code="servicelevel.slareview.label" default="SLA reviewed at" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="slareview-label"><g:fieldValue bean="${servicelevelInstance}" field="slareview"/></span></dd>
					

				</g:if>

                <g:if test="${servicelevelInstance?.whatifnoservice}">

                    <dt><span id="whatifnoservice-label" class="property-label"><g:message code="servicelevel.whatifnoservice.label" default="What if no service" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="whatifnoservice-label"><g:fieldValue bean="${servicelevelInstance}" field="whatifnoservice"/></span></dd>


                </g:if>

				<g:if test="${servicelevelInstance?.teamservices}">

                    <dt><span id="teamservices-label" class="property-label"><g:message code="servicelevel.teamservices.label" default="Teamservices" /></span></dt>

                    <dd><span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${servicelevelInstance?.teamservices?.id}">${servicelevelInstance?.teamservices?.encodeAsHTML()}</g:link></span></dd>
					

				</g:if>
			


			<g:form>
				<fieldset class="btn">
					<g:hiddenField name="id" value="${servicelevelInstance?.id}" />
					<g:link class="edit" action="edit" id="${servicelevelInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
