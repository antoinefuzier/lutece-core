<#-- 
Macro: tabLink

Description: Generates a tab link with an optional ID, class, and various other features.

Parameters:
- id (string, optional): the ID of the <li> element containing the tab link.
- class (string, optional): the class of the <li> element containing the tab link.
- hide (string[], optional): an array of breakpoint names at which to hide the tab link.
- active (boolean, optional): whether or not the tab link is active.
- href (string, required): the href of the tab link.
- title (string, optional): the title of the tab link.
- tabLabel (string, optional): the label of the tab.
- tabIcon (string, optional): the icon of the tab.
- tabClass (string, optional): the class of the tab content.
- params (string, optional): additional parameters to add to the HTML code.

Snippet:

    Basic active tab link:

    <@tabLink href='#overview' title='Overview' active=true />

    Tab link with icon and label:

    <@tabLink href='#users' title='Users' tabIcon='users' tabLabel='User List' />

    Tab link with custom class and external URL:

    <@tabLink href='jsp/admin/ManageUsers.jsp' title='Manage Users' tabIcon='settings' tabClass='ms-auto' />

-->
<#macro tabLink class='' hide=[] id='' active=false href='' title='' tabLabel='' tabIcon='' tabClass='' params='' deprecated...>
<@deprecatedWarning args=deprecated />
<#if class?is_markup_output><#local classText = class?markup_string><#else><#local classText = class></#if>
<#if id?is_markup_output><#local idText = id?markup_string><#else><#local idText = id></#if>
<#if href?is_markup_output><#local hrefText = href?markup_string><#else><#local hrefText = href></#if>
<#if title?is_markup_output><#local titleText = title?markup_string><#else><#local titleText = title></#if>
<#if tabLabel?is_markup_output><#local tabLabelText = tabLabel?markup_string><#else><#local tabLabelText = tabLabel></#if>
<#if tabIcon?is_markup_output><#local tabIconText = tabIcon?markup_string><#else><#local tabIconText = tabIcon></#if>
<#if tabClass?is_markup_output><#local tabClassText = tabClass?markup_string><#else><#local tabClassText = tabClass></#if>
<li class="nav-item<#if tabClassText?has_content> ${tabClassText}</#if>"<#if idText?has_content> id="${idText}"</#if><#if params?has_content> ${params}</#if>>
<#local tabLinkClass = classText + ' nav-link' />
<#if active><#local tabLinkClass += ' active' /></#if>
<#local tabTarget = hrefText?remove_beginning('#') />
<#local tabToggle = '' />
<#if hrefText?contains('#') && hrefText?contains('.jsp') == false>
	<#local tabToggle = 'tab' />
	<#local tabLinkId = tabTarget + '-tab' />
<#else>
	<#local tabLinkId = hrefText?keep_after_last('/')?keep_before('.')?lower_case />
</#if>
<#if !hrefText?has_content>
	<#nested>
<#else>
	<@link class=tabLinkClass?trim href=hrefText id=tabLinkId title=titleText role='tab' ariaSelected=active?c ariaControls=tabTarget dataBsToggle=tabToggle>
		<#if tabIconText?has_content><@icon style=tabIconText class='mr-1 me-1'/></#if> <#if tabLabelText?has_content>${tabLabelText!}<#else>${titleText!}</#if>
		<#nested>
	</@link>
</#if>
</li>
</#macro>
