<div class="form form_auto">
    <h4 class="form__title"><?=$v['object']->entity()->proto(null, true)->title?></h4>
    <?php
    /** @var \boolive\core\data\Entity $ob */
    $obj = $v['object']->entity();
    $result = $v['result']->int();
    $result_class = $result==1 ? 'form__result_error' : ($result==2 ? 'form__result_ok' : '');
    if ($result_class){
    ?>
    <div class="form__result <?=$result_class?>">
        <?php echo $v['message']->string(); ?>
    </div>
    <?php } ?>
    <form action="" method="POST" enctype="multipart/form-data">
        <!-- Идентификатор формы -->
        <input type="hidden" name="form" value="<?=$v['controller']?>">
        <?php if (isset($v['proto'])):?>
            <input type="hidden" name="proto" value="<?=$v['proto']->entity()->uri()?>">
            <input type="hidden" name="object" value="<?=$v['parent']->entity()->uri()?>">
        <?php else: ?>
            <input type="hidden" name="object" value="<?=$obj->uri()?>">
        <?php endif; ?>

        <!-- атрибут имени -->
        <div class="field">
            <label class="field__label" for="id_title">Адрес</label>
            <div class="field__input-wrap field_address">
                <div class="layout">
                    <div class="layout_col layout_col_min field_address__parent">
                        <?=$obj->parent()?>/
                    </div>
                    <div class="layout_col layout_col_max field_address__name">
                        <input class="field__input input_size_big" id="id_title" name="attr[name]" value="<?=$obj->name()?>" type="text">
                    </div>
                </div>
            </div>
        </div>

        <!-- Поляс войства -->
        <?php
        $list = $v['views']->arrays(\boolive\core\values\Rule::string());
        foreach ($list as $item){
            echo $item;
        }
        ?>
<!--        <input type="file" name="title">-->
        <div class="form__buttons">
            <input class="btn btn_type_primary" type="submit" name="<?=$v['controller']?>[submit]" value="Сохранить">
        </div>
    </form>
</div>