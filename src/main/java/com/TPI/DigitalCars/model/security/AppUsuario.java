package com.TPI.DigitalCars.model.security;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import jakarta.persistence.Id;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;


import java.util.Collection;
import java.util.Collections;

@Entity
@Getter
@Setter
@Table(name = "usuarios")
public class AppUsuario implements UserDetails {
    //acale podemos decir si solo es unico ect
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column
    @NotBlank(message = "El nombre no puede estar vacío.")
    @Pattern(regexp = "^[a-zA-Z]+$", message = "El nombre solo puede contener letras.")
    private String nombre;
    @Column
    @NotBlank(message = "El apellido no puede estar vacío.")
    @Pattern(regexp = "^[a-zA-Z]+$", message = "El apellido solo puede contener letras.")
    private String apellido;
    @Column(unique = true)
    @NotBlank(message = "El correo electrónico no puede estar vacío.")
    @Email(message = "El correo electrónico no es válido.")
    private String email;
    @Column
    @NotBlank(message = "La contraseña no puede estar vacía.")
    @Size(min = 8, message = "La contraseña debe tener al menos 8 caracteres.")
    private String password;
    @Column
    private AppUsuarioRol appUsuarioRol;

    private boolean reserva;

    public AppUsuario(String nombre, String apellido, String email, String password, AppUsuarioRol appUsuarioRol, boolean reserva) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.password = password;
        this.appUsuarioRol = appUsuarioRol;
        this.reserva=reserva;
    }

    public AppUsuario() {
    }

   @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
      SimpleGrantedAuthority grantedAuthority = new  SimpleGrantedAuthority(appUsuarioRol.name());
      return Collections.singletonList(grantedAuthority);
    }

   @Override
    public String getPassword() {
        return password;
    }

    //@Override
    public String getUsername() {
        return email;
    }

   @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
       return true;
    }
    @Override
    public boolean isEnabled() {
        return true;
    }
}

