
<%@ page import="hss.service.catalog.Servicelevel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicelevel.label', default: 'Servicelevel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-servicelevel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-servicelevel" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list servicelevel">


                <g:if test="${servicelevelInstance?.slaname}">
                    <li class="fieldcontain">
                        <span id="slaname-label" class="property-label"><g:message code="servicelevel.slaname.label" default="Sla name" /></span>

                        <span class="property-value" aria-labelledby="slaname-label"><g:fieldValue bean="${servicelevelInstance}" field="slaname"/></span>

                    </li>
                </g:if>

                <g:if test="${servicelevelInstance?.slatype}">
                    <li class="fieldcontain">
                        <span id="slatype-label" class="property-label"><g:message code="servicelevel.slatype.label" default="Sla type" /></span>

                        <span class="property-value" aria-labelledby="slatype-label"><g:fieldValue bean="${servicelevelInstance}" field="slatype"/></span>

                    </li>
                </g:if>
			
				<g:if test="${servicelevelInstance?.businesshours}">
				<li class="fieldcontain">
					<span id="businesshours-label" class="property-label"><g:message code="servicelevel.businesshours.label" default="Business hours" /></span>
					
						<span class="property-value" aria-labelledby="businesshours-label"><g:fieldValue bean="${servicelevelInstance}" field="businesshours"/></span>
					
				</li>
				</g:if>

                <g:if test="${servicelevelInstance?.servicehours}">
                    <li class="fieldcontain">
                        <span id="servicehours-label" class="property-label"><g:message code="servicelevel.servicehours.label" default="Service hours" /></span>

                        <span class="property-value" aria-labelledby="servicehours-label"><g:fieldValue bean="${servicelevelInstance}" field="servicehours"/></span>

                    </li>
                </g:if>
			
				<g:if test="${servicelevelInstance?.frequencyservice}">
				<li class="fieldcontain">
					<span id="frequencyservice-label" class="property-label"><g:message code="servicelevel.frequencyservice.label" default="Frequency of service" /></span>
					
						<span class="property-value" aria-labelledby="frequencyservice-label"><g:fieldValue bean="${servicelevelInstance}" field="frequencyservice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicelevelInstance?.implementrequire}">
				<li class="fieldcontain">
					<span id="implementrequire-label" class="property-label"><g:message code="servicelevel.implementrequire.label" default="Implementation required" /></span>
					
						<span class="property-value" aria-labelledby="implementrequire-label"><g:fieldValue bean="${servicelevelInstance}" field="implementrequire"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicelevelInstance?.offpeakusers}">
				<li class="fieldcontain">
					<span id="offpeakusers-label" class="property-label"><g:message code="servicelevel.offpeakusers.label" default="Offpeak number of users" /></span>
					
						<span class="property-value" aria-labelledby="offpeakusers-label"><g:fieldValue bean="${servicelevelInstance}" field="offpeakusers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicelevelInstance?.peakusage}">
				<li class="fieldcontain">
					<span id="peakusage-label" class="property-label"><g:message code="servicelevel.peakusage.label" default="Peak usage time" /></span>
					
						<span class="property-value" aria-labelledby="peakusage-label"><g:fieldValue bean="${servicelevelInstance}" field="peakusage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicelevelInstance?.peakusers}">
				<li class="fieldcontain">
					<span id="peakusers-label" class="property-label"><g:message code="servicelevel.peakusers.label" default="Peak number of users" /></span>
					
						<span class="property-value" aria-labelledby="peakusers-label"><g:fieldValue bean="${servicelevelInstance}" field="peakusers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicelevelInstance?.responsetime}">
				<li class="fieldcontain">
					<span id="responsetime-label" class="property-label"><g:message code="servicelevel.responsetime.label" default="Response times" /></span>
					
						<span class="property-value" aria-labelledby="responsetime-label"><g:fieldValue bean="${servicelevelInstance}" field="responsetime"/></span>
					
				</li>
				</g:if>

			
				<g:if test="${servicelevelInstance?.servicelifetime}">
				<li class="fieldcontain">
					<span id="servicelifetime-label" class="property-label"><g:message code="servicelevel.servicelifetime.label" default="Service lifetime" /></span>
					
						<span class="property-value" aria-labelledby="servicelifetime-label"><g:fieldValue bean="${servicelevelInstance}" field="servicelifetime"/></span>
					
				</li>
				</g:if>

				<g:if test="${servicelevelInstance?.slareview}">
				<li class="fieldcontain">
					<span id="slareview-label" class="property-label"><g:message code="servicelevel.slareview.label" default="SLA reviewed at" /></span>
					
						<span class="property-value" aria-labelledby="slareview-label"><g:fieldValue bean="${servicelevelInstance}" field="slareview"/></span>
					
				</li>
				</g:if>

                <g:if test="${servicelevelInstance?.whatifnoservice}">
                    <li class="fieldcontain">
                        <span id="whatifnoservice-label" class="property-label"><g:message code="servicelevel.whatifnoservice.label" default="What if no service" /></span>

                        <span class="property-value" aria-labelledby="whatifnoservice-label"><g:fieldValue bean="${servicelevelInstance}" field="whatifnoservice"/></span>

                    </li>
                </g:if>

				<g:if test="${servicelevelInstance?.teamservices}">
				<li class="fieldcontain">
					<span id="teamservices-label" class="property-label"><g:message code="servicelevel.teamservices.label" default="Teamservices" /></span>
					
						<span class="property-value" aria-labelledby="teamservices-label"><g:link controller="teamservice" action="show" id="${servicelevelInstance?.teamservices?.id}">${servicelevelInstance?.teamservices?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${servicelevelInstance?.id}" />
					<g:link class="edit" action="edit" id="${servicelevelInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
