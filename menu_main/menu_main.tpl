<ul>
<?php
    $show = function($items) use (&$show)
    {
        $result = '';
        foreach ($items as $item){
            /** @var \boolive\core\data\Entity $obj */
            $obj = $item['object']->entity();
            if (!($title = $obj->title->value())) $title = $obj->name();
            $result.= '<li><a href="/admin'.$obj->uri().'"><span>'.$title.'</span></a>';
            if (isset($item['sub']) && ($sub = $show($item['sub']))){
                $result.='<ul>'.$sub.'</ul>';
            }
            $result.='</li>';
        }
        return $result;
    };
    echo $show($v['items']);
    //trace($v['items']);
?>
</ul>