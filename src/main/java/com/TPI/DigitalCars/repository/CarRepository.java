package com.TPI.DigitalCars.repository;

import com.TPI.DigitalCars.model.Car;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.Optional;

public interface CarRepository extends JpaRepository<Car, Long>{

    Optional<Car> findByPatente(String patente);

    Optional<Car> findById(Long carId);
}
