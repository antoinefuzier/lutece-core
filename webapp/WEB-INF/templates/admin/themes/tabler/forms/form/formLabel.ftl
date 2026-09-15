<#-- Macro: formLabel

Description: Generates a label for a Bootstrap form group.

Parameters:
- class (string, optional): additional CSS classes to add to the label element.
- labelFor (string, optional): the ID of the input field that the label is associated with.
- labelId (string, optional): the ID of the label element.
- labelKey (string, optional): the internationalization key for the label text.
- hideLabel (list, optional): a list of label properties to hide (e.g. "label", "i18nLabel").
- mandatory (boolean, optional): whether the input field is mandatory.
- deprecated: whether the macro is deprecated.

Snippet:

    Standard form label associated with an input:

    <@formLabel labelFor='email' labelKey='#i18n{portal.users.label.email}' />

    Mandatory label with custom class:

    <@formLabel labelFor='password' labelKey='#i18n{portal.users.label.password}' mandatory=true class='form-label fw-bold' />

-->
<#macro formLabel class='form-label' labelFor='' labelId='' labelKey='' labelKeyDesc='' hideLabel=[] mandatory=false deprecated...>
<@deprecatedWarning args=deprecated />	
<#if class?is_markup_output><#local classText = class?markup_string><#else><#local classText = class></#if>
<#if labelKey?is_markup_output><#local labelKeyText = labelKey?markup_string><#else><#local labelKeyText = labelKey></#if>
<#if labelKeyDesc?is_markup_output><#local labelKeyDescText = labelKeyDesc?markup_string><#else><#local labelKeyDescText = labelKeyDesc></#if>
<#local labelClass = ' ' + displaySettings(hideLabel,'') />
<label class="<#if classText?has_content>${classText?trim}</#if><#if hideLabel?seq_contains('all')> visually-hidden</#if>"<#if labelFor?has_content> for="${labelFor}"</#if><#if labelId?has_content> id="${labelId}"</#if>>
<#if labelKeyText?trim?has_content><#if labelClass?trim?has_content><span class="${labelClass}"></#if>${labelKeyText}<#if mandatory> <span class="text-danger">*</span></#if><#if labelClass?trim?has_content></span></#if><#if labelKeyDescText?trim?has_content><span class="form-label-description">${labelKeyDescText}</span></#if><#else><#nested></#if>
</label>
</#macro>
