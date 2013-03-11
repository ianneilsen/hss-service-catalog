<%@ page import="hss.service.catalog.Servicebenefit" %>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicebenefitInstance, field: 'benefit', 'error')} ">
	<label class="control-label" for="benefit">
		<g:message code="servicebenefit.benefit.label" default="Service Benefit" />
		
	</label>
	<div class="controls"><g:textArea autofocus="true" name="benefit" style="width: 400px;" cols="40" rows="5" maxlength="1000" value="${servicebenefitInstance?.benefit}"/>
    <p class="help-block">What benefit do you receive?</p></div>
    </div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicebenefitInstance, field: 'benefitmeasure', 'error')} ">
	<label class="control-label" for="benefitmeasure">
		<g:message code="servicebenefit.benefitmeasure.label" default="Service benefit measure" />
		
	</label>
	<div class="controls"><g:textArea name="benefitmeasure" style="width: 400px;" cols="40" rows="5" maxlength="1000" value="${servicebenefitInstance?.benefitmeasure}"/>
    <p class="help-block">How do you measure the benefit</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicebenefitInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="servicebenefit.teamservices.label" default="Team Service" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"><g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${servicebenefitInstance?.teamservices?.id}" class="many-to-one"/>
    </div>
</div>
</div>
