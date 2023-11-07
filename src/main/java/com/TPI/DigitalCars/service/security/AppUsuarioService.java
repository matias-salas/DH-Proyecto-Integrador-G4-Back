package com.TPI.DigitalCars.service.security;

import com.TPI.DigitalCars.model.security.AppUsuario;
import com.TPI.DigitalCars.repository.security.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AppUsuarioService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<AppUsuario> usuarioBuscado= userRepository.findByEmail(username);
        if (usuarioBuscado.isPresent()){
            return usuarioBuscado.get();
        }else{
            throw new UsernameNotFoundException("Usuario con correo, no se encuentra en la basa de datos.");
        }
    }
    public AppUsuario guardarUsuario(AppUsuario appUsuario){
        return userRepository.save(appUsuario);
    }

    public Optional<AppUsuario> buscarUsuarioPorId (Long id){
        return userRepository.findById(id);
    }
}
