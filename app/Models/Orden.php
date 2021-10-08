<?php 
namespace App\Models;

use CodeIgniter\Model;

class Orden extends Model{
    protected $table      = 'Orden';
    // Uncomment below if you want add primary key
     protected $primaryKey = 'id';
     protected $allowedFields =['estado'];

}