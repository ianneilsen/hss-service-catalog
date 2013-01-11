<%@ page import="hss.service.catalog.Serviceenvironment" %>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceenvironmentInstance, field: 'successfactors', 'error')} required">
	<label class="control-label" for="successfactors">
		<g:message code="serviceenvironment.successfactors.label" default="Success factors" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textArea name="successfactors" cols="40" rows="5" maxlength="1000" required="" value="${serviceenvironmentInstance?.successfactors}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceenvironmentInstance, field: 'successmeasure', 'error')} ">
	<label class="control-label" for="successmeasure">
		<g:message code="serviceenvironment.successmeasure.label" default="Success measure" />
		
	</label>
	<div class="controls"><g:textArea name="successmeasure" cols="40" rows="5" maxlength="1000" value="${serviceenvironmentInstance?.successmeasure}"/>  </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: serviceenvironmentInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="serviceenvironment.teamservices.label" default="Team service" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${serviceenvironmentInstance?.teamservices?.id}" class="many-to-one"/> </div>
</div>
</div>
