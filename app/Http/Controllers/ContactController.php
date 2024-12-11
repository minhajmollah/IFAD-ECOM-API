<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Contact;
class ContactController extends Controller
{
    public function allContact(){

        try {
            $contacts=Contact::select('id','name','contact_address','contact_email','contact_phone','contact_map_key','contact_link','contact_longitude','contact_latitude')->where('status','=',1)->get();
            $data[] = [
                'status' => true,
                'status_code' => 200,
                'message' => 'Contact List',
                'contact_list' =>$contacts,
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
