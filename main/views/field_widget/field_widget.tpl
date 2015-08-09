<div class="field_widget">
    <?=$v['result']->string()?>
</div>

<div class="field<?=$v['error']->bool()?' field_state_error':''?>">
    <label class="field__label" for="id_<?=$v['id']?>">Виджет</label>
    <div class="field__box">
        <div><?=$v['title']?> (<?=$v['name']?>)</div>
        <div class="field__description"><?=$v['description']?></div>
    </div>
    <?php if ($v['error']->bool()): ?>
    <div class="field__error"><?=$v['error']?></div>
    <?php endif; ?>
</div>
