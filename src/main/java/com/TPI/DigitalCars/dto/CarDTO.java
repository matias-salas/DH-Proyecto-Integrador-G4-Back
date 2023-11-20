package com.TPI.DigitalCars.dto;

import com.TPI.DigitalCars.model.Imagen;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class CarDTO {
    private long Id;

    private String marca;
    private String modelo;
    private int anioModelo;
    private String patente;
    private String motorCode;
    private List<Imagen> imagenes;
    private List<String> categories;
    //fechaIngreso se crea automaticamente en service

    //constructor sin fecha de ingreso ya que se crea automaticamente
    public CarDTO(String marca, String modelo, int anioModelo, String patente, String motorCode, List<Imagen> imagenes, List<String> categories) {
        this.marca = marca;
        this.modelo = modelo;
        this.anioModelo = anioModelo;
        this.patente = patente;
        this.motorCode = motorCode;
        this.imagenes = imagenes;
        this.categories = categories;
    }
}
