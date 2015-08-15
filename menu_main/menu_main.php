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
use boolive\core\values\Rule;

class menu_main extends widget
{
    function startRule()
    {
        return Rule::arrays([
            'REQUEST' => Rule::arrays([
                'object' => Rule::entity()->required()
            ])
        ]);
    }

    function show($v, Request $request)
    {
        $v['active'] = $request['REQUEST']['object']->uri();

        $from = trim($v['active'],'/ ');
        if ($from) {
            $paths = explode('/', $from);
            $from = '';
            $cnt = min(1, count($paths));
            for ($i = 0; $i < $cnt; $i++) {
                $from .= '/' . $paths[$i];
            }
            $v['items'] = Data::find(['from' => $from, 'select' => 'children', 'depth' => 10, 'struct' => 'tree', 'order' => ['order', 'asc']]);
        }else{
            return false;
        }
        return parent::show($v, $request);
    }
}