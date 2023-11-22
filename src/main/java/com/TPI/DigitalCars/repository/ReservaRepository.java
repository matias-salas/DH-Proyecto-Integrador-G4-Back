package com.TPI.DigitalCars.repository;

import com.TPI.DigitalCars.model.Car;
import com.TPI.DigitalCars.model.Reserva;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface ReservaRepository extends JpaRepository<Reserva, Long> {



    List<Reserva> findByCarIdAndFechaInicioBetween(Long carid, LocalDate inicio, LocalDate fin);

}
