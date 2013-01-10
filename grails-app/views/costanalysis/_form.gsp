<%@ page import="hss.service.catalog.Costanalysis" %>



<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'costname', 'error')} required">
	<label for="costname">
		<g:message code="costanalysis.costname.label" default="Cost Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="costname" required="" value="${costanalysisInstance?.costname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'rapcost', 'error')} ">
	<label for="rapcost">
		<g:message code="costanalysis.rapcost.label" default="Rap Cost" />
		
	</label>
	<g:textArea name="rapcost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.rapcost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'eipcost', 'error')} ">
	<label for="eipcost">
		<g:message code="costanalysis.eipcost.label" default="EIP Cost" />
		
	</label>
	<g:textArea name="eipcost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.eipcost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'pacost', 'error')} ">
	<label for="pacost">
		<g:message code="costanalysis.pacost.label" default="PA Cost" />
		
	</label>
	<g:textArea name="pacost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.pacost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'iedcost', 'error')} ">
	<label for="iedcost">
		<g:message code="costanalysis.iedcost.label" default="IED Cost" />
		
	</label>
	<g:textArea name="iedcost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.iedcost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'engopscost', 'error')} ">
	<label for="engopscost">
		<g:message code="costanalysis.engopscost.label" default="Eng-Ops Cost" />
		
	</label>
	<g:textArea name="engopscost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.engopscost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'qecost', 'error')} ">
	<label for="qecost">
		<g:message code="costanalysis.qecost.label" default="QE Cost" />
		
	</label>
	<g:textArea name="qecost" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.qecost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'othercosts', 'error')} ">
	<label for="othercosts">
		<g:message code="costanalysis.othercosts.label" default="Other costs" />
		
	</label>
	<g:textArea name="othercosts" cols="40" rows="5" maxlength="500" value="${costanalysisInstance?.othercosts}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: costanalysisInstance, field: 'teamservices', 'error')} required">
	<label for="teamservices">
		<g:message code="costanalysis.teamservices.label" default="Team service" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${costanalysisInstance?.teamservices?.id}" class="many-to-one"/>
</div>

