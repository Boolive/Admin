<ul class="menu_main">
<?php
    $show = function($items) use (&$show, $v)
    {
        $result = '';
        foreach ($items as $item){
            /** @var \boolive\core\data\Entity $obj */
            $obj = $item['object']->entity();
            if (!($title = $obj->title->value())) $title = $obj->name();
            $active = $v['active']->string() == $obj->uri();
            $result.= '<li class="menu_main__item '.($active?'menu_main__item_active':'').'"><a class="menu_main__link" href="/admin'.$obj->uri().'"><span>'.$title.'</span></a>';
            if (isset($item['sub']) && ($sub = $show($item['sub']))){
                $result.='<ul class="menu_main">'.$sub.'</ul>';
            }
            $result.='</li>';
        }
        return $result;
    };
    echo $show($v['items']);
    //trace($v['items']);
?>
</ul>