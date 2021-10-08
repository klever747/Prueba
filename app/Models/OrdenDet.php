<?php 
namespace App\Models;

use CodeIgniter\Model;

class OrdenDet extends Model{
    protected $table      = 'orden_det';
    // Uncomment below if you want add primary key
     protected $primaryKey = 'id';
     protected $allowFields =[
         'orden_id',
         'producto_descripcion',
         'cantidad',
         'estado'
     ];
     
}