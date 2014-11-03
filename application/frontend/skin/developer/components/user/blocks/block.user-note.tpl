{**
 * Блок с заметкой о пользователе
 *
 * @styles css/blocks.css
 *}

{extends 'components/block/block.tpl'}

{block 'block_options' append}
	{$mods = "{$mods} user-note nopadding"}

	{if ! $oUserCurrent or ( $oUserCurrent->getId() == $oUserProfile->getId() )}
		{$show = false}
	{/if}
{/block}

{block 'block_content_after'}
	{include 'components/note/note.tpl' classes='js-user-note' note=$oUserProfile->getUserNote() targetId=$oUserProfile->getId()}
{/block}