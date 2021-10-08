<?php 
namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\Orden;
class OrdenController extends BaseController{
    public function index(){

        
        $data['Header'] = view('Orders/Header');
        $data['Footer'] = view('Orders/Footer');
               
        return view('Orders/listar',$data );
    }
    public function refresh(){
        $db = \Config\Database::connect();
        $builder= $db->table('orden');
        $builder->select('*');
        
        $builder->where('estado','Activo');
        
        $query = $builder->get();
        $data['Ordenes'] = $query->getResultArray();
        echo json_encode($data);
    }
    public function insert(){
        $Orden = new Orden();
        
        $descripcion =$this->request->getPost('descripcion');
        $cantidad =$this->request->getPost('cantidad');
        $db = \Config\Database::connect();
        $query=$db->query("CALL insertarOrden('$descripcion','$cantidad')");

        //return $this->response->setJSON($data);
    }
    public function delete(){
        
        $idOrden = $this->request->getPost('ordenId');
        
        $db = \Config\Database::connect();
        $query=$db->query("UPDATE orden SET estado='Inactivo'
                    where id=$idOrden");
                    
        echo json_encode($query);
    }
   
}