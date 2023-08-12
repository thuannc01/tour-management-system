<?php

namespace App\Http\Middleware;

use Closure;

class Cors
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request All value from client
     * @param  \Closure  $next The action will be execute
     * @return mixed The action will be execute with header allow CORS
     */
    public function handle($request, Closure $next)
    {
        header("Access-Control-Allow-Origin: *");

        // ALLOW OPTIONS METHOD
        $headers = [
            'Access-Control-Allow-Methods'=> 'POST, GET, OPTIONS, PUT, PATCH, DELETE',
            'Access-Control-Allow-Headers'=> 'X-Requested-With, Content-Type, X-Auth-Token, Origin, Authorization'
        ];
        
        if($request->getMethod() == "OPTIONS") {
            // The client-side application can set only headers allowed in Access-Control-Allow-Headers
            return Response::make('OK', 200, $headers);
        }

        $response = $next($request);
        foreach($headers as $key => $value) {
            $response->header($key, $value);
        }
        return $response;
    }
}
