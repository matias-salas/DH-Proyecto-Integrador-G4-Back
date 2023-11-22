package com.TPI.DigitalCars.model;


import com.TPI.DigitalCars.model.security.AppUsuario;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Reservas")
public class Reserva {

    @Id
    @SequenceGenerator(name = "reserva_sequence", sequenceName = "reserva_sequence", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reserva_sequence")
    private Long id;


    @ManyToOne
    @JoinColumn (name = "usuarios_id")
    private AppUsuario appUsuario;


    @ManyToOne
    @JoinColumn (name = "cars_id")
    private Car car;


    @Column
    private LocalDate fechaInicio;

    @Column
    private LocalDate fechaFinal;





}
