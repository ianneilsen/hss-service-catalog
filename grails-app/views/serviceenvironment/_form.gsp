<%@ page import="hss.service.catalog.Serviceenvironment" %>



<div class="fieldcontain ${hasErrors(bean: serviceenvironmentInstance, field: 'successfactors', 'error')} required">
	<label for="successfactors">
		<g:message code="serviceenvironment.successfactors.label" default="Success factors" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="successfactors" cols="40" rows="5" maxlength="1000" required="" value="${serviceenvironmentInstance?.successfactors}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceenvironmentInstance, field: 'successmeasure', 'error')} ">
	<label for="successmeasure">
		<g:message code="serviceenvironment.successmeasure.label" default="Success measure" />
		
	</label>
	<g:textArea name="successmeasure" cols="40" rows="5" maxlength="1000" value="${serviceenvironmentInstance?.successmeasure}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serviceenvironmentInstance, field: 'teamservices', 'error')} required">
	<label for="teamservices">
		<g:message code="serviceenvironment.teamservices.label" default="Team service" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${serviceenvironmentInstance?.teamservices?.id}" class="many-to-one"/>
</div>

