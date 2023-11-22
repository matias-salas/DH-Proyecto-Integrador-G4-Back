package com.TPI.DigitalCars.controller;


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


    }

