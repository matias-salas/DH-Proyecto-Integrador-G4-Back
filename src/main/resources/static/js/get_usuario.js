window.addEventListener('load', function () {
    (function(){

      //con fetch invocamos a la API de peliculas con el método GET
      //nos devolverá un JSON con una colección de peliculas
      const url = '/user/1'  ;
      const settings = {
        method: 'GET'
      }

      fetch(url, settings)
        .then(response => response.json())
        .then(user => {
          const table = document.getElementById("userTable");
          const userRow = table.insertRow();
          const tr_id = 'tr_' + user.id;
          userRow.id = tr_id;

          userRow.innerHTML = '<table class="table table-dark table-striped-columns">' +

            '<td class=\"td_nombre\">' + user.nombre.toUpperCase() + '</td>' +
            '<td class=\"td_apellido\">' + user.apellido.toUpperCase() + '</td>' +
            '<td class=\"td_email\">' + user.email.toUpperCase() + '</td>' +
            '<td class=\"td_reserva\">' + user.reserva + '</td>' +
            '</table';
        })
        .catch(error => {
          console.error('Error al obtener los datos del usuario:', error);
        });

    })


    (function(){
      let pathname = window.location.pathname;
      if (pathname == "/funciones-usuario.html") {
          document.querySelector(".nav .nav-item a:last").addClass("active");
      }
    })
    })
