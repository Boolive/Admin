<?php
/**
 * menu_main
 * @author Vladimir Shestakov
 * @version 1.0
 */
namespace boolive\admin\menu_main;

use boolive\basic\widget\widget;
use boolive\core\data\Data;
use boolive\core\request\Request;

class menu_main extends widget
{
    function show($v, Request $request)
    {
        $v['items'] = Data::find([
            'from' => '',
            'select' => 'children',
            'depth' => 10,
            'struct' => 'tree'
        ]);
        return parent::show($v, $request);
    }
} 