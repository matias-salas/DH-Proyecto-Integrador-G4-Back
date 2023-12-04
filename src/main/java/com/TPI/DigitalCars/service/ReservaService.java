package com.TPI.DigitalCars.service;


import com.TPI.DigitalCars.model.Car;
import com.TPI.DigitalCars.model.Reserva;
import com.TPI.DigitalCars.repository.CarRepository;
import com.TPI.DigitalCars.repository.ReservaRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ReservaService {


    @Autowired
    private ReservaRepository reservaRepository;

    @Autowired
    private CarRepository carRepository;

    public List<LocalDate> obtenerFechasDisponiblesParaDosMeses(Long autoId) {

        // Paso 1: Obtener el auto por ID
        Car car = carRepository.findById(autoId).orElse(null);

        if (car == null) {

            return null;
        }

        // Paso 2: Obtener todas las fechas reservadas para el automóvil en los próximos ''dos meses''
        LocalDate hoy = LocalDate.now();
        LocalDate primerDiaDelProximoMes = hoy.plusMonths(1).withDayOfMonth(1);
        LocalDate ultimoDiaDelSiguienteMes = hoy.plusMonths(2).withDayOfMonth(hoy.plusMonths(2).lengthOfMonth());
        List<LocalDate> fechasReservadas = reservaRepository.findByCarIdAndFechaInicioBetween(autoId, hoy, ultimoDiaDelSiguienteMes)
                .stream()
                .flatMap(reserva -> obtenerRangoDeFechas(reserva.getFechaInicio(), reserva.getFechaFinal()).stream())
                .collect(Collectors.toList());

        // Paso 3: Generar todas las fechas en los próximos dos meses
        List<LocalDate> todasLasFechasEnElRango = obtenerRangoDeFechas(primerDiaDelProximoMes, ultimoDiaDelSiguienteMes);

        // Paso 4: Filtrar las fechas disponibles
        List<LocalDate> fechasDisponibles = todasLasFechasEnElRango.stream()
                .filter(fecha -> !fechasReservadas.contains(fecha))
                .collect(Collectors.toList());

        return fechasDisponibles;
    }

    // Método para obtener un rango de fechas entre dos fechas dadas (inclusive)
    private List<LocalDate> obtenerRangoDeFechas(LocalDate inicio, LocalDate fin) {
        return inicio.datesUntil(fin.plusDays(1)).collect(Collectors.toList());}

    // guardar reserva

    public Reserva guardarReserva(Reserva reserva){ return reservaRepository.save(reserva);}

    //buscar fechas disponibles para un auto en particular

    public List<Reserva> findByCarIdAndFechaInicioLessThanEqualAndFechaFinalGreaterThanEqual(Long carId, LocalDate fechaInicio, LocalDate fechaFin) {
        return reservaRepository.findByCarIdAndFechaInicioLessThanEqualAndFechaFinalGreaterThanEqual(carId, fechaInicio, fechaFin);
    }

    //listar reservas



    public List<Reserva> listarReservas(){ return reservaRepository.findAll();}
}
