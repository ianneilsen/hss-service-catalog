<%@ page import="hss.communications.plan.Commlevel" %>



<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: commlevelInstance, field: 'comlevelname', 'error')} required">
	<label class="control-label" for="comlevelname">
		<g:message code="commlevel.comlevelname.label" default="Level name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textField autofocus="true" name="comlevelname" maxlength="200" required="" value="${commlevelInstance?.comlevelname}"/>
        <p class="help-block">Levels are assigned to communications. i.e. Executive, management, project, users.</p></div>
</div>
</div>

<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: commlevelInstance, field: 'comleveldsecrip', 'error')} required">
	<label class="control-label" for="comleveldsecrip">
		<g:message code="commlevel.comleveldsecrip.label" default="Level description" />
		<span class="required-indicator">*</span>
	</label>
	<div class="controls"> <g:textArea style="width: 400px;" cols="10" rows="7" name="comleveldsecrip" maxlength="200" required="" value="${commlevelInstance?.comleveldsecrip}"/>
    <p class="help-block">Give the level a description to assist users.</p></div>
</div>
</div>

%{--<div class="control-group">
<div class="fieldcontain ${hasErrors(bean: commlevelInstance, field: 'communications', 'error')} required">
	<label class="control-label" for="communications">
		<g:message code="commlevel.communications.label" default="Communications" />
		<span class="required-indicator">*</span>
	</label>
</div>
</div>--}%

