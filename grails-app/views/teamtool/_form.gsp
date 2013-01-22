<%@ page import="hss.service.catalog.Teamtool" %>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'toolname', 'error')} ">
	<label class="control-label" for="toolname">
		<g:message code="teamtool.toolname.label" default="Tool Name" />
		
	</label>
	<div class="controls"><g:textField name="toolname" value="${teamtoolInstance?.toolname}"/>
    <p class="help-block">Name of tool used?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'tooluse', 'error')} ">
	<label class="control-label" for="tooluse">
		<g:message code="teamtool.tooluse.label" default="Tool Use" />
		
	</label>
	<div class="controls"><g:textArea name="tooluse" cols="40" rows="5" maxlength="1000" value="${teamtoolInstance?.tooluse}"/>
    <p class="help-block">How does the team use the tool?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'toolmotivation', 'error')} ">
	<label class="control-label" for="toolmotivation">
		<g:message code="teamtool.toolmotivation.label" default="Tool Motivation" />
		
	</label>
	<div class="controls"><g:textArea name="toolmotivation" cols="40" rows="5" maxlength="1000" value="${teamtoolInstance?.toolmotivation}"/>
    <p class="help-block">What motivates your team to use this tool?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="teamtool.teamservices.label" default="Team Service" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"><g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${teamtoolInstance?.teamservices?.id}" class="many-to-one"/>
    %{--<p class="help-block">Services for this tool</p>--}%</div>
</div>
</div>
