<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use App\Constants\ResponseCodeConstant;

class UnauthorizedApi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::check()) {
            // return response()->json([
            //     'error' => 'Unauthorized',
            //     'code' => 401], 401);
            $response = response()->json([
                'Code'         => ResponseCodeConstant::UNAUTHORIZED,
                'Data'         => [],
                'MessageNo'    => "",
                'Message'      => "Unauthorized",
                'DataErrors'   => []
            ]);
            return $response;
        }

        return $next($request);
    }
}
