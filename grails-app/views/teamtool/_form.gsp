<%@ page import="hss.service.catalog.Teamtool" %>



<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'toolname', 'error')} ">
	<label for="toolname">
		<g:message code="teamtool.toolname.label" default="Tool Name" />
		
	</label>
	<g:textField name="toolname" value="${teamtoolInstance?.toolname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'tooluse', 'error')} ">
	<label for="tooluse">
		<g:message code="teamtool.tooluse.label" default="Tool Use" />
		
	</label>
	<g:textArea name="tooluse" cols="40" rows="5" maxlength="1000" value="${teamtoolInstance?.tooluse}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'toolmotivation', 'error')} ">
	<label for="toolmotivation">
		<g:message code="teamtool.toolmotivation.label" default="Tool Motivation" />
		
	</label>
	<g:textArea name="toolmotivation" cols="40" rows="5" maxlength="1000" value="${teamtoolInstance?.toolmotivation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'teamservices', 'error')} required">
	<label for="teamservices">
		<g:message code="teamtool.teamservices.label" default="Team Services" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${teamtoolInstance?.teamservices?.id}" class="many-to-one"/>
</div>

