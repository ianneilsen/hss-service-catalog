<%@ page import="hss.service.catalog.Teamtool" %>
<%@ page import="hss.service.catalog.Teamservice" %>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'toolname', 'error')} ">
	<label class="control-label" for="toolname">
		<g:message code="teamtool.toolname.label" default="Tool Name" />
		
	</label>
	<div class="controls"><g:textField style="width: 400px;" name="toolname" required="" value="${teamtoolInstance?.toolname}" autofocus="true"/>
    <p class="help-block">Name of tool used?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'tooluse', 'error')} ">
	<label class="control-label" for="tooluse">
		<g:message code="teamtool.tooluse.label" default="Tool Use" />
		
	</label>
	<div class="controls"><g:textArea style="width: 400px;" name="tooluse" cols="40" rows="5" maxlength="1000" value="${teamtoolInstance?.tooluse}"/>
    <p class="help-block">How does the team use the tool?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'toolmotivation', 'error')} ">
	<label class="control-label" for="toolmotivation">
		<g:message code="teamtool.toolmotivation.label" default="Tool Motivation" />
		
	</label>
	<div class="controls"><g:textArea style="width: 400px;" name="toolmotivation" cols="40" rows="5" maxlength="1000" value="${teamtoolInstance?.toolmotivation}"/>
    <p class="help-block">What motivates your team to use this tool?</p></div>
</div>
</div>
<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'toolsatisfaction', 'error')} ">
        <label class="control-label" for="toolsatisfaction">
            <g:message code="teamtool.toolsatisfaction.label" default="Tool Feedback" />

        </label>
        <div class="controls"><g:textArea style="width: 400px;" name="toolsatisfaction" cols="40" rows="5" maxlength="1000" value="${teamtoolInstance?.toolsatisfaction}"/>
            <p class="help-block">Do you have any feedback on this tool, are you happy or disatisfied?</br>What would you change about this tool?</br>Are there other interesting tools that do the same job?</p></div>
    </div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamtoolInstance, field: 'teamservices', 'error')}">
	<label class="control-label" for="teamservices">
		<g:message code="teamtool.teamservices.label" default="Team Service" />
        <span class="required-indicator">*</span>
	</label>
      <g:hiddenField name="teamservice.id" id="${teamtoolInstance?.teamservices?.id}"/>
	<div class="controls"><g:select id="teamservicesId" name="teamservicesId" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${teamtoolInstance?.teamservices?.id}" class="many-to-one"/></div>
</div>
</div>

