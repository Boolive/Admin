<?php
/**
 * View widget in content
 * @aurhor Vladimir Shestakov
 * @version 1.0
 */
namespace boolive\admin\main\views\field_widget;

use boolive\basic\widget\widget;
use boolive\core\request\Request;
use boolive\core\values\Rule;

class field_widget extends widget
{
    function startRule()
    {
        return Rule::arrays([
            'REQUEST' => Rule::arrays([
                'object' => Rule::entity(['is','/vendor/boolive/basic/widget'])->required(),
            ])
        ]);
    }

    function show($v, Request $request)
    {
        $widget = $request['REQUEST']['object']->linked();
        $v['name'] = $widget->name();
        $v['title'] = $widget->title->value();
        $v['description'] = $widget->description->value();
        return parent::show($v, $request);
    }
}