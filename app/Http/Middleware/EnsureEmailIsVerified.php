<?php

namespace App\Http\Middleware;

use Closure;

class EnsureEmailIsVerified
{
    /**
     * @param $request
     * @param Closure $next
     * @param $redirectToRoute
     * @return \Illuminate\Http\JsonResponse|mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->user() && empty($request->user()->email_verified_at)) {
            return response()->json(['message' => 'Your email address is not verified.'], 403);
        }

        return $next($request);
    }
}
