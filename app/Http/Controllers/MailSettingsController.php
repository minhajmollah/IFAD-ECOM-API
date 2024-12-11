<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MailSettings;
class MailSettingsController extends Controller
{
    public function allMailDepartment(){
        $MailSettings=MailSettings::select('id','name as department_name','mail_address')->where('status','=',1)->get();
        return response()->json($MailSettings);
    }

}
