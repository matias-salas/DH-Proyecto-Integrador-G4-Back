package com.TPI.DigitalCars.controller;


import com.TPI.DigitalCars.dto.CarDTO;
import com.TPI.DigitalCars.exceptions.BadRequestException;
import com.TPI.DigitalCars.exceptions.ResourceNotFoundException;
import com.TPI.DigitalCars.model.Car;
import com.TPI.DigitalCars.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/cars")
public class CarController {


    private CarService carService;
    @Autowired
    public CarController(CarService carService) {
        this.carService = carService;
    }

    //-------guardar auto-----


    @PostMapping
    public ResponseEntity<Car> guardarAuto(@RequestBody CarDTO carDTO) {
        System.out.println("inicio carDTO ------------ ---- ------ ------------");
        System.out.println(carDTO.toString());
        System.out.println("fin carDTO ------------ ---- ------ ------------");
        return ResponseEntity.ok(carService.guardarCar(carDTO));
    }

    @PutMapping("/actualizar")
    public ResponseEntity<Car> modificarAuto(@RequestBody CarDTO carDTO) {


        return ResponseEntity.ok(carService.modificarCar(carDTO));
    }


    @GetMapping("/{id}")
    public ResponseEntity<Optional> getCarById(@PathVariable Long id) {
        Optional<Car> car = carService.buscarCar(id);
        System.out.println(car);
        return ResponseEntity.ok().body(car);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCarById(@PathVariable Long id) throws ResourceNotFoundException {
        carService.eliminarCar(id);
        return ResponseEntity.ok().build();
    }



    /*
    @PostMapping("/crear")
    public ResponseEntity<?> guardarPaciente(@RequestBody Car car){
        carService.guardarCar(car);
        return ResponseEntity.ok(HttpStatus.OK);
    }
    */



    //---------------------------------GET LISTAR auto ----------------------------------------------
    @GetMapping("/listar")
    public ResponseEntity<List<Car>> listarCars() throws BadRequestException {
        List<Car> cars = carService.listarCars();
        if(cars.isEmpty()){
            //return ResponseEntity.badRequest().build();
            throw new BadRequestException("La lista se encuentra vacia");
        }else{
            return ResponseEntity.ok(cars);
        }
    }

}
