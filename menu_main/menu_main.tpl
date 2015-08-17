<ul class="menu_main" data-widget="menu_main">
<!--    <li class="menu_main__item"><div class="menu_main__item-wrap">-->
<!--            <a class="menu_main__link" href=""><span></span></a>-->
<!--            <div class="menu_main__popup" data-object="">-->
<!--                <span>+<span>-->
<!--            </div>-->
<!--        </div>-->
<!--    </li>-->
<?php
    $show = function($items) use (&$show, $v)
    {
        $result = '';
        foreach ($items as $item){
            /** @var \boolive\core\data\Entity $obj */
            $obj = $item['object']->entity();
            if (!($title = $obj->title->value())) $title = $obj->name();
            $active = $v['active']->string() == $obj->uri();
            $result.= '<li class="menu_main__item '.($active?'menu_main__item_active':'').'"><div class="menu_main__item-wrap">
                <a class="menu_main__link" href="/admin'.$obj->uri().'"><span>'.$title.'</span></a>
                <div class="menu_main__popup" data-object="'.$obj->uri().'">
                    <span>+<span>
                </div>
            </div>';
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
<li class="menu_main__item_bottom">
        <div class="menu_main__popup menu_main__popup_bottom" data-object="<?=$v['from']?>">
            <span>+<span>
        </div>
    </li>
</ul>