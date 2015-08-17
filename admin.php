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
    protected $path = '/admin';

    function startRule()
    {
        return Rule::arrays([
            'REQUEST' => Rule::arrays([
                'path' => Rule::regexp('/^'.preg_quote($this->path,'/').'($|\/)/ui')->required()
            ])
        ]);
    }

    function work(Request $request)
    {
        $request->mix(['REQUEST' => ['object' => mb_substr($request['REQUEST']['path'], mb_strlen($this->path))]]);
        return parent::work($request);
    }


    function show($v, Request $request)
    {
        $v['menu_side'] = $this->menu_side->start($request);
        $v['menu_main'] = $this->menu_main->start($request);
        $v['menu_operations'] = $this->menu_operations->start($request);
        $v['main'] = $this->main->start($request);
        return parent::show($v, $request);
    }
}