<?php
/**
 * menu_operations
 * @author Vladimir Shestakov
 * @version 1.0
 */
namespace boolive\admin\menu_operations;

use boolive\basic\widget\widget;
use boolive\core\data\Data;
use boolive\core\request\Request;
use boolive\core\values\Rule;

class menu_operations extends widget
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
        $v['parent'] = $request['REQUEST']['object'];
        $v['items'] = Data::find([
            'from' => '/library/contents',
            'select' => 'children'
        ]);
        return parent::show($v, $request);
    }
}