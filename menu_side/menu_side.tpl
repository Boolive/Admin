<div class="menu_side">
    <ul class="menu_side__list">
        <li class="menu_side__item menu_side__item_root <?=$v['active']->entity()->uri()==''?'menu_side__item_active':''?>">
            <a href="/admin" class="menu_side__link">★</a>
        </li>
        <?php foreach($v['items'] as $item):
            /** @var \boolive\core\data\Entity $obj */
            $obj = $item->entity();
            if (!($title = $obj->title->value())) $title = $obj->name();
        ?>
        <li class="menu_side__item <?=$v['active']->entity()->in($obj)?'menu_side__item_active':''?>">
            <a href="/admin<?=$obj->uri()?>" class="menu_side__link"><?=$title?></a>
        </li>
        <?php endforeach; ?>
    </ul>
</div>