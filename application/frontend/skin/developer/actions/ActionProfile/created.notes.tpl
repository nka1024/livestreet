{**
 * Список заметок созданных пользователем
 *}

{extends file='layouts/layout.user.tpl'}

{block name='layout_user_page_title'}{$aLang.user_menu_publication}{/block}

{block name='layout_content'}
	{include file='navs/nav.user.created.tpl'}

	{include file='user_list.tpl'}
{/block}