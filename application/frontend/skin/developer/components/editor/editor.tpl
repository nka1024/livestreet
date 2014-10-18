{**
 * Редактор
 *}

{* Название компонента *}
{$component = 'editor'}

{* Получаем тип редактора *}
{$type = ( ( $smarty.local.type ) ? $smarty.local.type : ( Config::Get('view.wysiwyg') ) ? 'visual' : 'markup' )}
{$set = $smarty.local.sSet|default:'default'}

{* Уникальный ID *}
{$_uid = $smarty.local.id|default:($component|cat:rand(0, 10e10))}

{* Уникальный ID окна загрузки файлов *}
{$_mediaUid = "media{$_uid}"}

{**
 * Textarea
 *}
{function editor_textarea}
	{include 'components/field/field.textarea.tpl'
		name            = $smarty.local.name
		value           = $smarty.local.value
		label           = $smarty.local.label
		mods            = $smarty.local.mods
		classes         = $smarty.local.classes
		id              = $_uid
		attributes      = $smarty.local.attributes
		rules           = $smarty.local.rules
		entityField     = $smarty.local.entityField
		entity          = $smarty.local.entity
		inputClasses    = "{$smarty.local.classes} {$smarty.local.inputClasses}"
		inputAttributes = "{$smarty.local.attributes} data-editor-type=\"{$type}\" data-editor-set=\"{$set}\" data-editor-media=\"{$_mediaUid}\""
		note            = $smarty.local.note
		rows            = $smarty.local.rows|default:10}
{/function}

{* Визуальный редактор *}
{if $type == 'visual'}
	{hookb run='editor_visual'}
		{asset type='js' name='editor_visual' "{Config::Get('path.skin.web')}/components/editor/vendor/tinymce/js/tinymce/tinymce.min.js"}
		{asset type='js' name='editor_visual_1' "{Config::Get('path.skin.web')}/components/editor/vendor/tinymce/js/tinymce/jquery.tinymce.min.js"}
		{asset type='js' name='editor_visual_2' "{Config::Get('path.skin.web')}/components/editor/js/editor.visual.js"}

		{editor_textarea}
	{/hookb}

{* Markup редактор *}
{else}
	{hookb run='editor_markup'}
		{asset type='js' name='editor_markup' "{Config::Get('path.skin.web')}/components/editor/vendor/markitup/jquery.markitup.js"}
		{asset type='js' name='editor_markup_options' "{Config::Get('path.skin.web')}/components/editor/js/editor.markup.js"}

		{asset type='css' name='editor_markup' "{Config::Get('path.skin.web')}/components/editor/vendor/markitup/skins/livestreet/style.css"}
		{asset type='css' name='editor_markup_set' "{Config::Get('path.skin.web')}/components/editor/vendor/markitup/sets/livestreet/style.css"}
		{asset type='css' name='editor_markup_help' "{Config::Get('path.skin.web')}/components/editor/css/editor.css"}

		{editor_textarea}

		{if $smarty.local.help|default:true}
			{include './editor.markup.help.tpl' targetId=$_uid}
		{/if}
	{/hookb}
{/if}

{* Управление медиа-файлами *}
{include 'components/media/media.tpl'
	sMediaTargetType = $smarty.local.mediaTargetType
	sMediaTargetId   = $smarty.local.mediaTargetId
	id               = $_mediaUid
	assign           = 'sMediaModal'}

{* Добавляем модальное окно (компонент media) в конец лэйаута чтобы избежать вложенных форм *}
{$sLayoutAfter = "$sLayoutAfter $sMediaModal" scope='root'}