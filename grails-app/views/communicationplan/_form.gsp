<%@ page import="hss.communications.plan.Communicationplan" %>



<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationplanInstance, field: 'planname', 'error')} required">
	<label class="control-label" for="planname">
		<g:message code="communicationplan.planname.label" default="Plan name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textField style="width: 270px;" name="planname" required="" value="${communicationplanInstance?.planname}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationplanInstance, field: 'planoverview', 'error')} ">
	<label class="control-label" for="planoverview">
		<g:message code="communicationplan.planoverview.label" default="Plan overview" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 600px;"name="planoverview" cols="40" rows="7" maxlength="2000" value="${communicationplanInstance?.planoverview}"/>
        <p class="help-inline">Field takes markdown in textarea</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationplanInstance, field: 'planmeasures', 'error')} ">
	<label class="control-label" for="planmeasures">
		<g:message code="communicationplan.planmeasures.label" default="Plan reviews and performance measures:" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 600px;"name="planmeasures" cols="40" rows="7" maxlength="2000" value="${communicationplanInstance?.planmeasures}"/>
        <p class="help-inline">Field takes markdown in textarea</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationplanInstance, field: 'planchanges', 'error')} ">
	<label class="control-label" for="planchanges">
		<g:message code="communicationplan.planchanges.label" default="New requirements and communication changes:" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 600px;"name="planchanges" cols="40" rows="7" maxlength="2000" value="${communicationplanInstance?.planchanges}"/>
        <p class="help-inline">Field takes markdown in textarea</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationplanInstance, field: 'communications', 'error')} ">
	<label class="control-label" for="communications">
		<g:message code="communicationplan.communications.label" default="Communications" />
		
	</label>
	<div class="controls"> 
<ul class="one-to-many">
<g:each in="${communicationplanInstance?.communications?}" var="c">
    <li><g:link controller="communication" action="show" id="${c.id}">${c?.id?.encodeAsHTML()} | ${c?.communication}</g:link></li>
</g:each>
<li class="add">
<g:link controller="communication" action="create" params="['communicationplan.id': communicationplanInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'communication.label', default: 'Communication')])}</g:link>
</li>
</ul>
</div>
</div>
</div>

