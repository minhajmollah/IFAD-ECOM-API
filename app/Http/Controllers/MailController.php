<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

use Symfony\Component\HttpFoundation\Response;

class MailController extends Controller
{
    public function sendEmail(Request $request)
    {
        $data = array(
            'name' => $request->FullName,
            'ContactNum' => $request->ContactNum,
            'DptName' => $request->DptName,
            'email' => $request->Email,
            'massage' => $request->Massage,
            'Subject' => $request->Subject,
        );

        Mail::send(['text' => 'Email.email'], $data, function ($message) use ($data) {
            $message->to($data['DptName']);
            $message->from($data['email'], $data['name']);
            $message->subject($data['Subject']);
        });

        return "Successfully Mail Sent. Check your inbox.";
    }
}

