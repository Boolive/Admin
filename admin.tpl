<!DOCTYPE html>
<html>
<head>
    <title><?=implode(' - ',array_reverse($v['meta']['title']->arrays('escape')))?></title>
    <meta content="text/html; charset=UTF-8">
    <meta name="description" content="<?=implode(' ',$v['meta']['description']->arrays('escape'))?>">
    <meta name="keywords" content="<?=implode(', ',$v['meta']['keywords']->arrays('escape'))?>">
    <?php echo $v['head']->string(); ?>
</head>
<body>
    <div class="admin">
        <div class="admin__menu">
                    <?=$v['menu_main']->string()?>
                </div>
        <div class="admin__main">
            <h1>Админка</h1>
        </div>

    </div>
</body>
</html>