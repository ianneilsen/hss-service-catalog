<%@ page import="hss.service.catalog.Costanalysis" %>
<div class="formAreaLeft">
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'role', 'error')} required">
	<label class="control-label" for="role">
		<g:message code="costanalysis.role.label" default="Group/Team/Person" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textField autofocus="true" name="role" required="" value="${costanalysisInstance?.role}"/>
    <p class="help-block">Group or team who are needed to supply this service?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'reason', 'error')} ">
	<label class="control-label" for="reason">
		<g:message code="costanalysis.reason.label" default="Cost justification?" />
		
	</label>
	<div class="controls"><g:textArea style="width: 270px;" name="reason" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.reason}"/>
        <p class="help-block">Why do you need this group/team/person to complete your service?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'cost', 'error')} ">
	<label class="control-label" for="cost">
		<g:message code="costanalysis.cost.label" default="Cost in resource hours" />
		
	</label>
    <div class="controls"><g:textField style="width: 270px;" name="cost" value="${costanalysisInstance?.cost}"/>
        <p class="help-block">Please enter in hours/job, day, week, month or year.</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'othercosts', 'error')} ">
	<label class="control-label" for="othercosts">
		<g:message code="costanalysis.othercosts.label" default="Other costs" />
		
	</label>
    <div class="controls"><g:textArea style="width: 270px;" name="othercosts" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.othercosts}"/></div>
</div>
</div>
%{--<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'totalmoneycosts', 'error')} ">
        <label class="control-label" for="totalmoneycosts">
            <g:message code="costanalysis.totalmoneycosts.label" default="Total \$ costs" />

        </label>
        <div class="controls"><g:textField style="width: 270px;" name="totalmoneycosts" value="${costanalysisInstance?.totalmoneycosts}"/></div>
    </div>
</div>--}%
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="costanalysis.teamservices.label" default="Team service" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls"><g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${costanalysisInstance?.teamservices?.id}" class="many-to-one"/></div>
</div>
</div>