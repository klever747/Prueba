<!-- Modal -->
<div class="modal fade" id="editarOrden" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar Orden</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <input type="hidden" name="" class="idDetalle">
                    <div class="form-group">
                        <label for="">Descripcion</label>
                        <textarea name="descripcion" id="descripcionE" class="EDescripcion" cols="20"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="">Cantidad</label>
                        <input type="number" name="cantidad" id="cantidadE" class="form-control ECantidad">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="editarOrden()" id="editar">Guardar Orden</button>
            </div>
        </div>
    </div>
</div>