<!DOCTYPE html>
<html>
<head>
    <title><?=implode(' - ',array_reverse($v['meta']['title']->arrays('escape')))?></title>
    <meta content="text/html; charset=UTF-8">
    <meta name="description" content="<?=implode(' ',$v['meta']['description']->arrays('escape'))?>">
    <meta name="keywords" content="<?=implode(', ',$v['meta']['keywords']->arrays('escape'))?>">
    <?php echo $v['head']->string(); ?>
</head>
<body data-widget="admin">
    <div class="admin">
        <div class="admin__side">
            <?=$v['menu_side']->string()?>
        </div>
        <?php if ($widget = $v['menu_main']->string()):?>
        <div class="admin__menu">
            <?=$widget?>
        </div>
        <?php endif;?>
        <div class="admin__main">
            <?=$v['main']->string()?>
        </div>

    </div>
    <div style="display: block">
        <?=$v['menu_operations']->string()?>
    </div>
</body>
</html>