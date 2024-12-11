<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendOtpEmailNotification extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * @var
     */
    public $otp;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($otp)
    {
        $this->otp = $otp;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('OTP Code')
            ->view('Email.send_otp_email_notification')
            ->with('otp', $this->otp);
    }
}
