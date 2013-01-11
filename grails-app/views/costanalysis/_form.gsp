<%@ page import="hss.service.catalog.Costanalysis" %>


<div class="formAreaLeft">
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'costname', 'error')} required">
	<label class="control-label" for="costname">
		<g:message code="costanalysis.costname.label" default="Cost Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textField name="costname" required="" value="${costanalysisInstance?.costname}"/>
    <p class="help-block">Name your cost, try to align with cost centre.</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'rapcost', 'error')} ">
	<label class="control-label" for="rapcost">
		<g:message code="costanalysis.rapcost.label" default="Rap Cost" />
		
	</label>
	<div class="controls"><g:textArea name="rapcost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.rapcost}"/>
    </div>
</div>
</div>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'eipcost', 'error')} ">
	<label class="control-label" for="eipcost">
		<g:message code="costanalysis.eipcost.label" default="EIP Cost" />
		
	</label>
    <div class="controls"><g:textArea name="eipcost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.eipcost}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'pacost', 'error')} ">
	<label class="control-label" for="pacost">
		<g:message code="costanalysis.pacost.label" default="PA Cost" />
		
	</label>
    <div class="controls"><g:textArea name="pacost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.pacost}"/></div>
</div>
</div>
</div>

<div class="formAreaRight">
<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'iedcost', 'error')} ">
	<label class="control-label" for="iedcost">
		<g:message code="costanalysis.iedcost.label" default="IED Cost" />
		
	</label>
    <div class="controls"><g:textArea name="iedcost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.iedcost}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'engopscost', 'error')} ">
	<label class="control-label" for="engopscost">
		<g:message code="costanalysis.engopscost.label" default="Eng-Ops Cost" />
		
	</label>
    <div class="controls"><g:textArea name="engopscost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.engopscost}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'qecost', 'error')} ">
	<label class="control-label" for="qecost">
		<g:message code="costanalysis.qecost.label" default="QE Cost" />
		
	</label>
    <div class="controls"><g:textArea name="qecost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.qecost}"/> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'othercosts', 'error')} ">
	<label class="control-label" for="othercosts">
		<g:message code="costanalysis.othercosts.label" default="Other costs" />
		
	</label>
    <div class="controls"><g:textArea name="othercosts" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.othercosts}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="costanalysis.teamservices.label" default="Team service" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls"><g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${costanalysisInstance?.teamservices?.id}" class="many-to-one"/></div>
</div>
</div>
</div>