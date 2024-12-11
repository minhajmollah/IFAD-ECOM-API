<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Setting;

class SettingsController extends Controller
{
     /**
     * @method_name :- allCategory
     * --------------------------------------------------------
     * @param  :-
     * ?return :-  json($data)
     * author :-  API
     * created_by:- Abul Kalam Azad
     * created_at:- 08/12/2022 10:10:17
     * description :- this function given all categories data
     */
    public function allSettings(){

        try {
            $settings=Setting::select('id','name','value')->get();
            $data[] = [
                'status' => true,
                'status_code' => 200,
                'message' => 'Settings List',
                'settings_list' =>$settings,
                ];
            return response()->json($data);

        } catch (\Exception $exception) {
            report($exception);

            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }

    }


}
