{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

	<div class="cmp_skip_to_content">
		<a href="#pkp_content_main">{translate key="navigation.skip.main"}</a>
		<a href="#pkp_content_nav">{translate key="navigation.skip.nav"}</a>
		<a href="#pkp_content_footer">{translate key="navigation.skip.footer"}</a>
	</div>
	<div class="pkp_structure_page">

		{* Header *}
		<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">
			<div class="pkp_head_wrapper">

				<div class="pkp_site_name_wrapper">
					{* Logo or site title. Only use <h1> heading on the homepage.
					   Otherwise that should go to the page title. *}
					{if $requestedOp == 'index'}
						<h1 class="pkp_site_name">
					{else}
						<div class="pkp_site_name">
					{/if}
						{if $currentContext && $multipleContexts}
							{url|assign:"homeUrl" journal="index" router=$smarty.const.ROUTE_PAGE}
						{else}
							{url|assign:"homeUrl" page="index" router=$smarty.const.ROUTE_PAGE}
						{/if}
						{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
							<a href="{$homeUrl}" class="is_img">
                                <img src="data:image/png;base64,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"/>
                                <!--<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />!-->
							</a>
                            <a href="{$homeUrl}" class="is_img">
                                <img src="data:image/png;base64,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"/>
                                <!--<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />!-->
							</a>
						{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
							<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle}</a>
						{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
							<a href="{$homeUrl}" class="is_img">
								<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" />
							</a>
						{else}
							<a href="{$homeUrl}" class="is_img">
								<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
							</a>
						{/if}
					{if $requestedOp == 'index'}
						</h1>
					{else}
						</div>
					{/if}
				</div>

				{* Primary site navigation *}
				{if $currentContext}
					<nav id="pkp_content_nav" class="pkp_navigation_primary_row navDropdownMenu" aria-label="{translate|escape key="common.navigation.site"}">
						<div class="pkp_navigation_primary_wrapper">

							{* Primary navigation menu for current application *}
							{include file="frontend/components/primaryNavMenu.tpl"}

							{* Search form *}
							{include file="frontend/components/searchForm_simple.tpl"}
						</div>
					</nav>
				{/if}

				<nav class="pkp_navigation_user_wrapper navDropdownMenu" id="navigationUserWrapper" aria-label="{translate|escape key="common.navigation.user"}">
					<ul id="navigationUser" class="pkp_navigation_user pkp_nav_list">
						{if $isUserLoggedIn}
							<li class="profile {if $unreadNotificationCount} has_tasks{/if}" aria-haspopup="true" aria-expanded="false">
								<a href="{url router=$smarty.const.ROUTE_PAGE page="submissions"}">
									{$loggedInUsername|escape}
									<span class="task_count">
										{$unreadNotificationCount}
									</span>
								</a>
								<ul>
									{if array_intersect(array(ROLE_ID_MANAGER, ROLE_ID_ASSISTANT, ROLE_ID_REVIEWER, ROLE_ID_AUTHOR), (array)$userRoles)}
										<li>
											<a href="{url router=$smarty.const.ROUTE_PAGE page="submissions"}">
												{translate key="navigation.dashboard"}
												<span class="task_count">
													{$unreadNotificationCount}
												</span>
											</a>
										</li>
									{/if}
									<li>
										<a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="profile"}">
											{translate key="common.viewProfile"}
										</a>
									</li>
									{if array_intersect(array(ROLE_ID_SITE_ADMIN), (array)$userRoles)}
									<li>
										<a href="{if $multipleContexts}{url router=$smarty.const.ROUTE_PAGE context="index" page="admin" op="index"}{else}{url router=$smarty.const.ROUTE_PAGE page="admin" op="index"}{/if}">
											{translate key="navigation.admin"}
										</a>
									</li>
									{/if}
									<li>
										<a href="{url router=$smarty.const.ROUTE_PAGE page="login" op="signOut"}">
											{translate key="user.logOut"}
										</a>
									</li>
									{if $isUserLoggedInAs}
										<li>
											<a href="{url router=$smarty.const.ROUTE_PAGE page="login" op="signOutAsUser"}">
												{translate key="user.logOutAs"} {$loggedInUsername|escape}
											</a>
										</li>
									{/if}
								</ul>
							</li>
						{else}
							{if !$disableUserReg}
								<li><a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="register"}">{translate key="navigation.register"}</a></li>
							{/if}
							<li><a href="{url router=$smarty.const.ROUTE_PAGE page="login"}">{translate key="navigation.login"}</a></li>
						{/if}
					</ul>
				</nav><!-- .pkp_navigation_user_wrapper -->

			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div id="pkp_content_main" class="pkp_structure_main" role="main">
