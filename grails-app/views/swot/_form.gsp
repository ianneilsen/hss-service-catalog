<%@ page import="hss.service.catalog.Swot" %>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: swotInstance, field: 'strength', 'error')} ">
	<label class="control-label" for="strength">
		<g:message code="swot.strength.label" default="Strengths" />
		
	</label>
	<div class="controls"><g:textArea name="strength" cols="40" rows="5" maxlength="500" value="${swotInstance?.strength}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: swotInstance, field: 'weaknesses', 'error')} ">
    <label class="control-label" for="weaknesses">
        <g:message code="swot.weaknesses.label" default="Weaknesses" />

    </label>
    <div class="controls"><g:textArea name="weaknesses" cols="40" rows="5" maxlength="500" value="${swotInstance?.weaknesses}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: swotInstance, field: 'opportunities', 'error')} ">
	<label class="control-label" for="opportunities">
		<g:message code="swot.opportunities.label" default="Opportunities" />
		
	</label>
	<div class="controls" style="width: 400px"><g:textArea name="opportunities" cols="40" rows="5" maxlength="500" value="${swotInstance?.opportunities}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: swotInstance, field: 'threats', 'error')} ">
	<label class="control-label" for="threats">
		<g:message code="swot.threats.label" default="Threats" />
		
	</label>
	<div class="controls"> <g:textArea name="threats" cols="40" rows="5" maxlength="500" value="${swotInstance?.threats}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: swotInstance, field: 'gaps', 'error')} ">
	<label class="control-label" for="gaps">
		<g:message code="swot.gaps.label" default="Gaps" />
		
	</label>
	<div class="controls"> <g:textArea name="gaps" cols="40" rows="5" maxlength="500" value="${swotInstance?.gaps}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: swotInstance, field: 'swotnumber', 'error')} ">
    <label  class="control-label" for="swotnumber">
        <g:message code="swot.swotnumber.label" default="Swot number" />

    </label>
    <div class="controls"><g:textField name="swotnumber" value="${swotInstance?.swotnumber}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: swotInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="swot.teamservices.label" default="Team service" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"><g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${swotInstance?.teamservices?.id}" class="many-to-one"/>  </div>
</div>
</div>

