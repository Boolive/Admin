<?php
/**
 * menu_create
 * @author Vladimir Shestakov
 * @version 1.0
 */
namespace boolive\admin\main;

use boolive\basic\widget\widget;
use boolive\core\data\Data;
use boolive\core\request\Request;
use boolive\core\values\Rule;
use boolive\forms\form_auto\form_auto;

class main extends form_auto
{
    function startRule()
    {
        return parent::startRule()->mix(
            Rule::arrays([
                'REQUEST' => Rule::arrays([
                    'proto' => Rule::entity()
                ])
            ])
        );
    }

    function work(Request $request)
    {
        if (isset($request['REQUEST']['proto'])){
            $request['REQUEST']['parent'] = $request['REQUEST']['object'];
            $request['REQUEST']['object'] = Data::create($request['REQUEST']['proto'], $request['REQUEST']['parent']);
            $request['REQUEST']['object']->complete();
        }
        return parent::work($request);
    }

    function show($v, Request $request)
    {
        if (isset($request['REQUEST']['proto']) && !$request['REQUEST']['object']->is_exists()){
            $v['proto'] = $request['REQUEST']['proto'];
            $v['parent'] = $request['REQUEST']['parent'];
        }
        return parent::show($v, $request);
    }

    function process(Request $request)
    {
        if (parent::process($request)){
            $request->redirect(Request::url('/admin'.$request['REQUEST']['object']->uri()));
        }else{
            $request->redirect(Request::url(null,[],true));
        }

    }
}