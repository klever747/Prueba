$(document).ready(function () {
    refresh();
    $(document).on('click', '.edit-btn', function () {

        var ordenId = $(this).attr('idOrden');
        $('#editarOrden').modal('show');
        $.ajax({
            method: "POST",
            url: "findById",
            data: { ordenId: ordenId },
            success: function (response) {

                var info = JSON.parse(response);
                //console.log(info);
                $('.idDetalle').val(info.id);
                $('.EDescripcion').val(info.producto_descripcion);
                $('.ECantidad').val(info.cantidad);

            }
        });
    });
    $(document).on('click', '.delete-btn', function () {
        var ordenId = $(this).attr('idOrden');
        alert("borrar")
        $.ajax({
            method: "POST",
            url: "borrarOrden",
            data: { ordenId: ordenId },
            success: function (response) {
                console.log(response);
                $('.OrdenData').html("");
                refresh();
            }
        });

    });

});
$(document).on('click', '#Add', function () {
    var data = {
        'descripcion': $('#descripcion').val(),
        'cantidad': $('#cantidad').val()
    };

    $.ajax({
        method: "POST",
        url: "ordenDetalle",
        data: data,
        success: function (response) {
            $('.OrdenData').html("");
            $('#crearOrden').modal('hide');
            limpiarCampos();
            refresh();
            
        }
    });
});

//funcion para editar
function editarOrden() {
    var data = {
        'idDetalle': $('.idDetalle').val(),
        'descripcion': $('#descripcionE').val(),
        'cantidad': $('#cantidadE').val()
    };
    console.log(data);
    limpiarCampos();
    $.ajax({
        method: "POST",
        url: "editarDetalle",
        data: data,
        success: function (response) {
            console.log(response);
            $('.OrdenData').html("");
            refresh();
            limpiarCampos();
            $('#editarOrden').modal('hide');    
        }
    });
}

//fucion para borrar datos de la orden 
$('.delete-btn').click(function (e) {
    e.preventDefault();
    var ordenId = $(this).attr('idOrden');
    alert("borrar")
    $.ajax({
        method: "POST",
        url: "borrarOrden",
        data: { ordenId: ordenId },
        success: function (response) {
            console.log(response);
            refresh();
        }
    });

});
function refresh() {
    $.ajax({
        method: "GET",
        url: "refresh",
        success: function (response) {
            var info = JSON.parse(response);
            $.each(info.Ordenes, function (key, value) {

                $('.OrdenData').append('<tr>\
                    <td>'+ value['id'] + '</td>\
                    <td>'+ value['estado'] + '</td>\
                    <td>\
                    <a href="#" class="badge btn-primary edit-btn" idOrden='+ value['id'] + '>Agregar Detalle</a>\
                    <a href="#" class="badge btn-danger delete-btn" idOrden='+ value['id'] + '>Borrar</a>\
                    </td>\
                </tr>');
            });

        }
    });
}
function limpiarCampos() {
    $("#descripcion").val("");
    $("#cantidad").val("");
    $("#descripcionE").val("");
    $("#cantidadE").val("");
}