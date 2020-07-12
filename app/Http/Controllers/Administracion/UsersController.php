<?php

namespace App\Http\Controllers\Administracion;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class UsersController extends Controller
{
    public function getListarUsuarios(Request $request){
       
       if (!$request->ajax()) return redirect('/');

        $cNombre    =   $request->cNombre;
        $cUsuario   =   $request->cUsuario;
        $cCorreo    =   $request->cCorreo;
        $cEstado    =   $request->cEstado;

        $cNombre    =   ($cNombre   == NULL) ? ($cNombre    = '')   : $cNombre;
        $cUsuario   =   ($cUsuario  == NULL) ? ($cUsuario   = '')   : $cUsuario;
        $cCorreo    =   ($cCorreo   == NULL) ? ($cCorreo    = '')   : $cCorreo;
        $cEstado    =   ($cEstado   == NULL) ? ($cEstado    = '')   : $cEstado;


        $rpta = DB::select('call sp_Usuario_getListarUsuarios(?, ?, ?, ?)', [
           $cNombre,
           $cUsuario,
           $cCorreo,
           $cEstado
        ]);

       

        return $rpta;


    }
}
