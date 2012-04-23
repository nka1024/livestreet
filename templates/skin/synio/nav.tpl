<nav id="nav">
	<ul class="nav nav-filter">
		<li {if $sMenuItemSelect=='index'}class="active"{/if}>
			<a href="{cfg name='path.root.web'}/">{$aLang.blog_menu_all}</a>
		</li>

		<li {if $sMenuItemSelect=='blog'}class="active"{/if}>
			<a href="{router page='blog'}">{$aLang.blog_menu_collective}</a>
		</li>

		<li {if $sMenuItemSelect=='log'}class="active"{/if}>
			<a href="{router page='personal_blog'}">{$aLang.blog_menu_personal}</a>
		</li>
		
		{if $oUserCurrent}
			<li {if $sMenuItemSelect=='feed'}class="active"{/if}>
				<a href="{router page='feed'}">{$aLang.userfeed_title}</a>
			</li>
		{/if}

		{hook run='menu_blog'}
	</ul>
	
	{if $oUserCurrent}
		<a href="{router page='topic'}add/" class="button button-write" id="modal_write_show">{$aLang.block_create}</a>
	{/if}
</nav>