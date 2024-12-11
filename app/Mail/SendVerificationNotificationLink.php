<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendVerificationNotificationLink extends Mailable
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
        return $this->subject('Verification Notification Link')
            ->view('Email.send_verification_notification_link', [
                'url' => $this->url
            ]);
    }
}
