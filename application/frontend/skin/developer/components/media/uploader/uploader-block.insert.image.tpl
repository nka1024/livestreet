{**
 * Опции вставки
 *}

{extends 'components/uploader/uploader-block.tpl'}

{block 'block_options' append}
	{$classes = "{$classes} js-media-info-block"}
	{$attributes = "{$attributes} data-type=\"insert\" data-filetype=\"1\""}
{/block}

{block 'block_title'}
	{lang name='media.insert.settings.title'}
{/block}

{block 'block_content'}
	<form method="post" action="" enctype="multipart/form-data">
		{* Выравнивание *}
		{include 'components/field/field.select.tpl'
			name  = 'align'
			label = {lang name='media.image_align.title'}
			items = [
				[ 'value' => '',       'text' => {lang name='media.image_align.no'} ],
				[ 'value' => 'left',   'text' => {lang name='media.image_align.left'} ],
				[ 'value' => 'right',  'text' => {lang name='media.image_align.right'} ],
				[ 'value' => 'center', 'text' => {lang name='media.image_align.center'} ]
			]}

	    {* Размер *}
		{include 'components/field/field.select.tpl'
			name          = 'size'
			label         = {lang name='media.insert.settings.fields.size.label'}
			selectedValue = $_aRequest.blog_category
			items         = [[ 'value' => 'original', 'text' => {lang name='media.insert.settings.fields.size.original'} ]]}
	</form>
{/block}