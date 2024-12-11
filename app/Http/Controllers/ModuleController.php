<?php

namespace App\Http\Controllers;
use App\Models\Module;
use Illuminate\Http\Request;

class ModuleController extends Controller
{
    public function menus(){
        $menus = Module::where([
            ['menu_id','=', 2],
            ['parent_id', '=', NULL],
	    ['status', '=', 1],
        ])->with('children')->get();
        return $menus;
    }
}
