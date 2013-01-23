<%@ page import="hss.service.catalog.Servicelevel" %>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'slaname', 'error')} ">
    <label class="control-label" for="slaname">
        <g:message code="servicelevel.slaname.label" default="Service name" />

    </label>
    <div class="controls"> <g:textField name="slaname" value="${servicelevelInstance?.slaname}"/></div>
</div>
</div>

<div class="control-group"></div>
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'slatype', 'error')} ">
    <label class="control-label" for="slatype">
        <g:message code="servicelevel.slatype.label" default="This service is of type" />

    </label>
    <div class="controls"><g:textField name="slatype" value="${servicelevelInstance?.slatype}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'businesshours', 'error')} ">
	<label class="control-label" for="businesshours">
		<g:message code="servicelevel.businesshours.label" default="Business hours of service" />
		
	</label>
    <div class="controls"><g:textField name="businesshours" value="${servicelevelInstance?.businesshours}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'servicehours', 'error')} ">
    <label class="control-label" for="servicehours">
        <g:message code="servicelevel.servicehours.label" default="Hours of service are?" />

    </label>
    <div class="controls"><g:textField name="servicehours" value="${servicelevelInstance?.servicehours}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'frequencyservice', 'error')} ">
	<label class="control-label" for="frequencyservice">
		<g:message code="servicelevel.frequencyservice.label" default="Frequency service" />
		
	</label>
    <div class="controls"><g:textField name="frequencyservice" value="${servicelevelInstance?.frequencyservice}"/></div>
</div>
</div>

 <div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'implementrequire', 'error')} ">
	<label class="control-label" for="implementrequire">
		<g:message code="servicelevel.implementrequire.label" default="Implementation is required" />
		
	</label>
    <div class="controls"><g:textField name="implementrequire" value="${servicelevelInstance?.implementrequire}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'offpeakusers', 'error')} ">
	<label class="control-label" for="offpeakusers">
		<g:message code="servicelevel.offpeakusers.label" default="Off peak users times" />
		
	</label>
    <div class="controls"><g:textField name="offpeakusers" value="${servicelevelInstance?.offpeakusers}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'peakusage', 'error')} ">
	<label class="control-label" for="peakusage">
		<g:message code="servicelevel.peakusage.label" default="Peak usage is" />
		
	</label>
    <div class="controls"><g:textField name="peakusage" value="${servicelevelInstance?.peakusage}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'peakusers', 'error')} ">
	<label class="control-label" for="peakusers">
		<g:message code="servicelevel.peakusers.label" default="Peak number of users are?" />
		
	</label>
    <div class="controls"><g:textField name="peakusers" value="${servicelevelInstance?.peakusers}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'responsetime', 'error')} ">
	<label class="control-label" for="responsetime">
		<g:message code="servicelevel.responsetime.label" default="Response time by service provider will be" />
		
	</label>
    <div class="controls"><g:textField name="responsetime" value="${servicelevelInstance?.responsetime}"/></div>
</div>
</div>



<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'servicelifetime', 'error')} ">
	<label class="control-label" for="servicelifetime">
		<g:message code="servicelevel.servicelifetime.label" default="Service lifetime is?" />
		
	</label>
    <div class="controls"><g:textField name="servicelifetime" value="${servicelevelInstance?.servicelifetime}"/></div>
</div>
</div>


<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'slareview', 'error')} ">
	<label class="control-label" for="slareview">
		<g:message code="servicelevel.slareview.label" default="Service SLA is reviewed every period" />
		
	</label>
    <div class="controls"><g:textField name="slareview" value="${servicelevelInstance?.slareview}"/></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="servicelevel.teamservices.label" default="Belongs to Team service" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls"><g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${servicelevelInstance?.teamservices?.id}" class="many-to-one"/>  </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicelevelInstance, field: 'whatifnoservice', 'error')} ">
	<label class="control-label" for="whatifnoservice">
		<g:message code="servicelevel.whatifnoservice.label" default="If no service provided, then this will happen" />
		
	</label>
    <div class="controls"><g:textField name="whatifnoservice" value="${servicelevelInstance?.whatifnoservice}"/> </div>
</div>
</div>
