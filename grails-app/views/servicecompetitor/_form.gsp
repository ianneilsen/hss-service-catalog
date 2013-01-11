<%@ page import="hss.service.catalog.Servicecompetitor" %>

<div class="formAreaLeft">
<div  class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitorname', 'error')} required">
	<label class="control-label" for="competitorname">
		<g:message code="servicecompetitor.competitorname.label" default="Competitor name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textField name="competitorname" required="" value="${servicecompetitorInstance?.competitorname}"/> </div>
</div>
</div>

<div  class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitorservice', 'error')} ">
	<label class="control-label" for="competitorservice">
		<g:message code="servicecompetitor.competitorservice.label" default="Competitor service" />
		
	</label>
<div class="controls"><g:textField name="competitorservice" value="${servicecompetitorInstance?.competitorservice}"/> </div>
</div>
</div>

<div  class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitordescription', 'error')} ">
	<label class="control-label" for="competitordescription">
		<g:message code="servicecompetitor.competitordescription.label" default="Competitor description" />
		
	</label>
    <div class="controls"><g:textArea name="competitordescription" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.competitordescription}"/>  </div>
</div>
</div>

<div  class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'compservicedifference', 'error')} ">
	<label class="control-label" for="compservicedifference">
		<g:message code="servicecompetitor.compservicedifference.label" default="Compservice difference" />
		
	</label>
    <div class="controls"><g:textArea name="compservicedifference" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.compservicedifference}"/>  </div>
</div>
</div>
</div>

<div class="formAreaRight">
<div  class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'whousescompservice', 'error')} ">
	<label class="control-label" for="whousescompservice">
		<g:message code="servicecompetitor.whousescompservice.label" default="Who uses competitor service" />
		
	</label>
    <div class="controls"><g:textArea name="whousescompservice" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.whousescompservice}"/> </div>
</div>
</div>

<div  class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitorsmotivation', 'error')} ">
	<label class="control-label" for="competitorsmotivation">
		<g:message code="servicecompetitor.competitorsmotivation.label" default="Competitors motivation" />
		
	</label>
    <div class="controls"><g:textArea name="competitorsmotivation" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.competitorsmotivation}"/> </div>
</div>
</div>

<div  class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'competitorvalue', 'error')} ">
	<label class="control-label" for="competitorvalue">
		<g:message code="servicecompetitor.competitorvalue.label" default="Competitor value" />
		
	</label>
<div class="controls"><g:textArea name="competitorvalue" cols="40" rows="5" maxlength="1000" value="${servicecompetitorInstance?.competitorvalue}"/> </div>
</div>
</div>

<div  class="control-group">
<div class="fieldcontain ${hasErrors(bean: servicecompetitorInstance, field: 'teamservices', 'error')} required">
	<label class="control-label" for="teamservices">
		<g:message code="servicecompetitor.teamservices.label" default="Team service" />
		<span class="required-indicator">*</span>
	</label>
    <div class="controls"><g:select id="teamservices" name="teamservices.id" from="${hss.service.catalog.Teamservice.list()}" optionKey="id" required="" value="${servicecompetitorInstance?.teamservices?.id}" class="many-to-one"/> </div>
</div>
</div>
</div>
