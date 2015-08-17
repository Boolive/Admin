<?php
    $uri = $v['parent']->entity()->uri();
?>

<div class="menu_operations" data-widget="menu_operations" data-uri="<?=$v['controller']?>">
    <ul class="menu_operations__list">
        <li class="menu_operations__item"><span>Создать</span>
            <ul>
                <?php foreach ($v['items'] as $item):
                    /** @var \boolive\core\data\Entity $obj */
                    $obj = $item->entity();
                    if (!($title = $obj->title->value())) $title = $obj->name();
                ?>
                <li class="menu_operations__item"><a class="menu_operations__link" href="<?=\boolive\core\request\Request::url('/admin'.$uri,['proto'=>$obj->linked()->uri()])?>"><?=$title?></a></li>
                <?php endforeach; ?>
            </ul>
        </li>
<!--        <li class="menu_operations__item"><span>Операции</span>-->
<!--            <ul>-->
<!--                <li class="menu_operations__item"><a class="menu_operations__link" href="">Скрыть</a></li>-->
<!--                <li class="menu_operations__item"><a class="menu_operations__link" href="">В черновик</a></li>-->
<!--                <li class="menu_operations__item"><a class="menu_operations__link" href="">Удалить</a></li>-->
<!--            </ul>-->
<!--        </li>-->
    </ul>
</div>