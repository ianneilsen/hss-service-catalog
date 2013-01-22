<%@ page import="hss.service.catalog.Servicecategory; hss.service.catalog.Teamservice; hss.service.catalog.Servicecategory" %>

<div class="formAreaLeft">
<div class="control-group">
  <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicename', 'error')} ">
	<label class="control-label" for="servicename">
		<g:message code="teamservice.servicename.label" default="Service Name" />
		
	</label>
	<div class="controls"> <g:field type="text" autofocus="true" style="width: 400px;" name="servicename" value="${teamserviceInstance?.servicename}"/>
        <p class="help-block">Name of the service</p></div>
  </div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicedescription', 'error')} ">
	<label class="control-label" for="servicedescription">
		<g:message code="teamservice.servicedescription.label" default="Service Description" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" name="servicedescription" cols="40" rows="5" maxlength="1000" value="${teamserviceInstance?.servicedescription}"/>
    <p class="help-block">Description of your service</p> </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'coreresponsibility', 'error')} ">
	<label class="control-label" for="coreresponsibility">
		<g:message code="teamservice.coreresponsibility.label" default="Core Responsibility" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" name="coreresponsibility" cols="40" rows="5" maxlength="1000" value="${teamserviceInstance?.coreresponsibility}"/>
    <p class="help-block">Core responsibility from your team compass</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'competencyalignment', 'error')} ">
	<label class="control-label" for="competencyalignment">
		<g:message code="teamservice.competencyalignment.label" default="Competency Alignment" />
		
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" name="competencyalignment" cols="40" rows="5" maxlength="1000" value="${teamserviceInstance?.competencyalignment}"/>
    <p class="help-block">Competency alignment from your team compass</p> </div>
</div>
</div>                                         <!-- todo - find better way or provide link to compass as short term measure to help explain the above RH alignments-->

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicecontact', 'error')} ">
            <label class="control-label" for="servicecontact">
                <g:message code="teamservice.servicecontact.label" default="Service Contact" />

            </label>
            <div class="controls"> <g:field name="servicecontact" value="${teamserviceInstance?.servicecontact}" type="text"/>
                <p class="help-block">Who is the main contact for this service?</p> </div>
        </div>
    </div>

%{--    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: servicecategory, field: 'servicecategory', 'error')} ">
            <label class="control-label" for="servicecategory">
                <g:message code="teamservice.servicecategory.label" default="Service Category" />

            </label>
            <div class="controls"><g:select  name="servicecategory.id" from="${servicecategory.list()}" optionKey="id" required="" value="${servicecategory?.id}" class="many-to-many"/>
                <p class="help-block">Service categories are unqiue and setup by your admin.</br> If you need a new category email support.</p> </div>
        </div>
    </div>--}%
   %{-- <g:select  name="pubproduct.id" from="${spotlight.content.Pubproduct.list()}" optionKey="id" required="" value="${publicationInstance?.pubproduct?.id}" class="many-to-one"/>--}%
    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'team', 'error')} required">
            <label class="control-label" for="team">
                <g:message code="teamservice.team.label" default="Team" />
                <span class="required-indicator">*</span>
            </label>
            <div class="controls">
                <g:select style="width: 255px;" id="team" name="team.id" from="${hss.service.catalog.Team.list()}" optionKey="id" required="" value="${teamserviceInstance?.team?.id}" class="many-to-one"/>
            </div>
        </div>
    </div>
</div>

%{--<div class="formAreaRight">

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'tools', 'error')} ">
            <label class="control-label" for="tools">
                <g:message code="teamservice.tools.label" default="1. Tools" />

            </label>

            <div class="controls">
                <ul class="one-to-many">
                    <g:each in="${teamserviceInstance?.tools?}" var="t">
                        <li><g:link controller="teamtool" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                    </g:each>
            </div>
            <div class="controls">

                <li class="add">
                    <g:link controller="teamtool" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'teamtool.label', default: 'Team Tools')])}</g:link>
                </li>
            </ul>
            </div>
        </div>
    </div>

    <div class="control-group">
        <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicesusers', 'error')} ">
            <label class="control-label" for="servicesusers">
                <g:message code="teamservice.servicesusers.label" default="2. Services Users" />

            </label>

            <div class="controls">
                <ul class="one-to-many">
                    <g:each in="${teamserviceInstance?.servicesusers?}" var="s">
                        <li><g:link controller="serviceuser" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                    </g:each>
            </div>
            <div class="controls">
                <li class="add">
                    <g:link controller="serviceuser" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'serviceuser.label', default: 'Service Users')])}</g:link>
                </li>
            </ul>
            </div>
        </div>
    </div>



<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'costs', 'error')} ">
    <label class="control-label" for="costs">
        <g:message code="teamservice.costs.label" default="3. Costs" />

    </label>
    <div class="controls">
    <ul class="one-to-many">
        <g:each in="${teamserviceInstance?.costs?}" var="c">
            <li><g:link controller="costanalysis" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
    </div>
    <div class="controls">
        <li class="add">
            <g:link controller="costanalysis" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'costanalysis.label', default: 'Cost Analysis')])}</g:link>
        </li>
    </ul>
    </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'servicebenefits', 'error')} ">
    <label class="control-label" for="servicebenefits">
        <g:message code="teamservice.servicebenefits.label" default="4. Service Benefits" />

    </label>
    <div class="controls">
    <ul class="one-to-many">
        <g:each in="${teamserviceInstance?.servicebenefits?}" var="s">
            <li><g:link controller="servicebenefit" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
        </g:each>
    </div>
    <div class="controls">
        <li class="add">
            <g:link controller="servicebenefit" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'servicebenefit.label', default: 'Service Benefits')])}</g:link>
        </li>
    </ul>
    </div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'competitors', 'error')} ">
	<label class="control-label" for="competitors">
		<g:message code="teamservice.competitors.label" default="5. Competitors" />
	</label>

    <div class="controls">
      <ul class="one-to-many">
        <g:each in="${teamserviceInstance?.competitors?}" var="c">
          <li><g:link controller="servicecompetitor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
     </div>
    <div class="controls">
      <li class="add">
        <g:link controller="servicecompetitor" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'servicecompetitor.label', default: 'a service competitor')])}</g:link>
      </li>
    </ul>
    </div>
</div>
</div>--}%
%{--
<div class="control-group">
    <div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'serviceenvironments', 'error')} ">
        <label class="control-label" for="serviceenvironments">
            <g:message code="teamservice.serviceenvironments.label" default="6. Service environments" />
        </label>

        <div class="controls">
            <ul class="one-to-many">
                <g:each in="${teamserviceInstance?.serviceenvironments}" var="c">
                    <li><g:link controller="serviceenvironment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                </g:each>
        </div>
        <div class="controls">
            <li class="add">
                <g:link controller="serviceenvironment" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'serviceenvironment.label', default: 'Service environments')])}</g:link>
            </li>
        </ul>
        </div>
    </div>
</div>--}%


%{--<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: teamserviceInstance, field: 'swots', 'error')} ">
	<label class="control-label" for="swots">
		<g:message code="teamservice.swots.label" default="7. Swot" />

	</label>
	<div class="controls">
      <ul class="one-to-many">
        <g:each in="${teamserviceInstance?.swots?}" var="s">
          <li><g:link controller="swot" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
        </g:each>
    </div>
        <div class="controls">
        <li class="add">
            <g:link controller="swot" action="create" params="['teamservice.id': teamserviceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'swot.label', default: 'Swot')])}</g:link>
        </li>
       </ul>
    </div>
</div>
</div>
</div>--}%




