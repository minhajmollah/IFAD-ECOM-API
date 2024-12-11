<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendPasswordResetLink extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * @var
     */
    public string $url;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(string $url)
    {
        $this->url = $url;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Reset Link')->view('Email.send_password_reset_link', [
            'url' => $this->url
        ]);
    }
}
