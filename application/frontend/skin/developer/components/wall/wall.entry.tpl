{**
 * Стена / Запись (Пост / Комментарий)
 *
 * @param object  $entry     Комментарий
 * @param boolean $showReply Показывать или нет кнопку комментирования
 * @param string  $classes   Классы
 *}

{include 'components/comment/comment.tpl'
	oComment    = $smarty.local.entry
	bShowReply  = $smarty.local.showReply
	attributes = "data-type=\"{$smarty.local.type}\""
	classes    = "wall-comment js-wall-entry {$smarty.local.classes}"}