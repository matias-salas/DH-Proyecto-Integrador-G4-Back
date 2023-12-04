package com.TPI.DigitalCars.controller;


import com.TPI.DigitalCars.exceptions.BadRequestException;
import com.TPI.DigitalCars.model.Car;
import com.TPI.DigitalCars.model.Reserva;
import com.TPI.DigitalCars.service.ReservaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

    @RestController
    @RequestMapping("/reservas")
    public class ReservaController {

        @Autowired
        private ReservaService reservaService;

        @GetMapping("/fechas-disponibles/{carId}")
        public ResponseEntity<List<LocalDate>> obtenerFechasDisponibles(@PathVariable Long carId) {
            List<LocalDate> fechasDisponibles = reservaService.obtenerFechasDisponiblesParaDosMeses(carId);
            return new ResponseEntity<>(fechasDisponibles, HttpStatus.OK);
        }

        @PostMapping("/crear-reserva")
        public ResponseEntity<String> crearReserva(@RequestBody Reserva reserva) {


            try {
                if (isFechasDisponibles(reserva) == false) {


                    return new ResponseEntity<>("las fechas seleccionadas no estan disponibles", HttpStatus.BAD_REQUEST);
                }else{

                reservaService.guardarReserva(reserva);
                return new ResponseEntity<>("Reserva creada exitosamente", HttpStatus.CREATED);}
            } catch (Exception e) {
                return new ResponseEntity<>("Error al crear la reserva: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }


        private boolean isFechasDisponibles(Reserva reserva) {

            Car car = reserva.getCar();
            if (car != null) {
                List<Reserva> reservasConflictivas = reservaService.findByCarIdAndFechaInicioLessThanEqualAndFechaFinalGreaterThanEqual(
                        car.getId(),
                        reserva.getFechaInicio(),
                        reserva.getFechaFinal()
                );

                System.out.println("Reservas conflictivas: " + reservasConflictivas);

                return reservasConflictivas.isEmpty();
            }else {return false;}
        }

        @GetMapping("/listar")

        public ResponseEntity<List<Reserva>> listarReservas() throws BadRequestException {
            List<Reserva> reservas = reservaService.listarReservas();
            if(reservas.isEmpty()){
                //return ResponseEntity.badRequest().build();
                throw new BadRequestException("La lista se encuentra vacia");
            }else{
                return ResponseEntity.ok(reservas);
            }
        }

    }

