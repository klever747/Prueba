<?php 
namespace App\Controllers;

use CodeIgniter\Controller;
use App\Models\OrdenDet;
use CodeIgniter\HTTP\Request;

class OrdenDetController extends BaseController{
    public function insert(){
        $OrdenDet= new OrdenDet();
        $data = [
            'estado' => $this->request->getPost('estado')
        ];
        //$OrdenDet->save($data);
        //$data =['status'=>'orden creada'];
        return $this->response->setJSON($data);
    }
    public function findById(){
        $id_orden =$this->request->getPost('ordenId');
        
        $db = \Config\Database::connect();
        $builder= $db->table('orden_det');
        $builder->select('*');
        
        $builder->where('orden_id',$id_orden);
        
        $query = $builder->get();
        
        //$data = $query->getRowArray();
        $data = $query->getRowArray();
       echo json_encode($data, JSON_UNESCAPED_UNICODE);
       
    }
    public function edit(){
        $OrdenDet = new OrdenDet();
        
        $descripcion =$this->request->getPost('descripcion');
        $cantidad =$this->request->getPost('cantidad');
        $idDetalle = $this->request->getPost('idDetalle');
        
        $db = \Config\Database::connect();
        $query=$db->query("UPDATE orden_det SET producto_descripcion='$descripcion', cantidad='$cantidad'
                    where id=$idDetalle");
                    
        echo json_encode($query);
        
      

    }
}