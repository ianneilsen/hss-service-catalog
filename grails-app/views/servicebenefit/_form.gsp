<%@ page import="hss.service.catalog.Servicebenefit" %>



<div class="fieldcontain ${hasErrors(bean: servicebenefitInstance, field: 'benefit', 'error')} ">
	<label for="benefit">
		<g:message code="servicebenefit.benefit.label" default="Service Benefit" />
		
	</label>
	<g:textArea name="benefit" cols="40" rows="5" maxlength="1000" value="${servicebenefitInstance?.benefit}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicebenefitInstance, field: 'benefitmeasure', 'error')} ">
	<label for="benefitmeasure">
		<g:message code="servicebenefit.benefitmeasure.label" default="Service benefit measure" />
		
	</label>
	<g:textArea name="benefitmeasure" cols="40" rows="5" maxlength="1000" value="${servicebenefitInstance?.benefitmeasure}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicebenefitInstance, field: 'teamservices', 'error')} required">
	<label for="teamservices">
		<g:message code="servicebenefit.teamservices.label" default="Team Service" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${servicebenefitInstance?.teamservices?.id}" class="many-to-one"/>
</div>

