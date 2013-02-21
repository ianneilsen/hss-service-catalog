<%@ page import="hss.communications.plan.Communication" %>
<%@  page import="hss.communications.plan.Commlevel" %>



<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'communication', 'error')} ">
	<label class="control-label" for="communication">
		<h4><g:message code="communication.communication.label" default="Communication" /></h4>
		
	</label>
	<div class="controls"> <g:textField autofocus="true" style="width: 400px;" name="communication" value="${communicationInstance?.communication}"/>
        <p class="help-inline">The name / description used to describe this communication.</p></div>
</div>
</div>

<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: commlevelInstance, field: 'comlevelname', 'error')} ">
        <label class="control-label" for="comlevelname">
            <b><g:message code="communciation.comlevelname.label" default="Level" /></b>

        </label>
        <div class="controls"><g:select  name="commlevel.id" from="${hss.communications.plan.Commlevel.list()}" optionKey="id" required="" value="${communicationInstance?.commlevel?.id}" class="many-to-one"/>   </div>
    </div>
</div>                                      <!-- make multi-select-->

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'purpose', 'error')} ">
	<label class="control-label" for="purpose">
		<g:message code="communication.purpose.label" default="Purpose" />
		
	</label>
	<div class="controls"> <g:textArea name="purpose" style="width: 400px;" cols="40" rows="5" value="${communicationInstance?.purpose}"/>
    <p class="help-inline">Why do we want to communicate this information and changes?;</br> What is the goal of the communication?</br> Can the information support decision making?  </br>Field takes markdown in textarea</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'targetGroups', 'error')} ">
	<label class="control-label" for="targetGroups">
		<g:message code="communication.targetGroups.label" default="Target Groups" />
		
	</label>
	<div class="controls"> <g:textArea name="targetGroups" style="width: 400px;" cols="40" rows="5" value="${communicationInstance?.targetGroups}"/>
        <p class="help-inline">Who will receive this information/internal and external groups?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'expectations', 'error')} ">
	<label class="control-label" for="expectations">
		<g:message code="communication.expectations.label" default="Expectations" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" cols="40" rows="5" name="expectations" value="${communicationInstance?.expectations}"/>
        <p class="help-inline">What are the target groups expectations for this communication?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'communicator', 'error')} ">
	<label class="control-label" for="communicator">
		<g:message code="communication.communicator.label" default="Communicator" />
		
	</label>
	<div class="controls"> <g:textField name="communicator" value="${communicationInstance?.communicator}"/>
        <p class="help-inline">Who is responsible for delivering the communication?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'datacollector', 'error')} ">
	<label class="control-label" for="datacollector">
		<g:message code="communication.datacollector.label" default="Data collector" />
		
	</label>
	<div class="controls"> <g:textField name="datacollector" value="${communicationInstance?.datacollector}"/>
        <p class="help-inline">Who will prepare and generate the required information and content?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'monitor', 'error')} ">
	<label class="control-label" for="monitor">
		<g:message code="communication.monitor.label" default="Monitor" />
		
	</label>
	<div class="controls"> <g:textField name="monitor" value="${communicationInstance?.monitor}"/>
        <p class="help-inline">Who will ensure that the communications process is followed</br> and is responsible for tracking the performance in delivering the communication?</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'communicationchannelsmedia', 'error')} ">
	<label class="control-label" for="commchannelsmedia">
		<g:message code="communication.commchannelsmedia.label" default="Communication channels/media" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" cols="40" rows="5" name="commchannelsmedia" value="${communicationInstance?.commchannelsmedia}"/>
        <p class="help-inline">How will we communicate or share the information?</br> e.g. report, email, or portal. </p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'timingfrequency', 'error')} ">
	<label class="control-label" for="timingfrequency">
		<g:message code="communication.timingfrequency.label" default="Timing/frequency" />
		
	</label>
	<div class="controls"> <g:textField name="timingfrequency" value="${communicationInstance?.timingfrequency}"/>
        <p class="help-inline">Time frame and frequency for the distribution of required information.</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'processdetailsdescrip', 'error')} ">
	<label class="control-label" for="processdetailsdescrip">
		<g:message code="communication.processdetailsdescrip.label" default="Process details description" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" name="processdetailsdescrip" cols="40" rows="5" maxlength="2000" value="${communicationInstance?.processdetailsdescrip}"/>
        <p class="help-inline">What is the process that needs to be followed for this communication?</br> What content / details needs to be included in this communication?</br>Field takes markdown in textarea</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: communicationInstance, field: 'commplan', 'error')} required">
	<label class="control-label" for="commplan">
		<g:message code="communication.commplan.label" default="Associated Plan " />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:select id="commplan" name="commplan.id" from="${hss.communications.plan.Communicationplan.list()}" optionKey="id" required="" value="${communicationInstance?.commplan?.id}" class="many-to-one"/></div>
</div>
</div>

