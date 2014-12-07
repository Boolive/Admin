<?php
/**
 * admin
 * @aurhor Vladimir Shestakov
 * @version 1.0
 */
namespace boolive\admin;

use boolive\basic\layout\layout;
use boolive\core\request\Request;
use boolive\core\values\Rule;

class admin extends layout
{
    function startRule()
    {
        return Rule::arrays([
            'PATH' => Rule::arrays([
                0 => Rule::eq('admin')->required()
            ])
        ]);
    }

    function show($v, Request $request)
    {
        $v['menu_main'] = $this->menu_main->start($request);
        return parent::show($v, $request);
    }
}