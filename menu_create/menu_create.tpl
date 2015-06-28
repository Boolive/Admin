<div class="menu_create">
<span class="menu_create__label">+ Создать:</span>
<ul class="menu_create__list"><?php

$result = '';
foreach ($v['items'] as $item){
    /** @var \boolive\core\data\Entity $obj */
    $obj = $item->entity();
    if (!($title = $obj->title->value())) $title = $obj->name();
    $result.= '<li class="menu_create__item"><a href="'.\boolive\core\request\Request::url(null,['proto'=>$obj->linked()->uri()]).'"><span>'.$title.'</span></a>';
    $result.='</li>';
}
echo $result;

?></ul>
</div>