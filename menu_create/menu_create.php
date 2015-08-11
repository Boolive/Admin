<?php
/**
 * menu_create
 * @author Vladimir Shestakov
 * @version 1.0
 */
namespace boolive\admin\menu_create;

use boolive\basic\widget\widget;
use boolive\core\data\Data;
use boolive\core\request\Request;

class menu_create extends widget
{
    function show($v, Request $request)
    {
        $v['items'] = Data::find([
            'from' => '/library/contents',
            'select' => 'children'
        ]);
        return parent::show($v, $request);
    }
}