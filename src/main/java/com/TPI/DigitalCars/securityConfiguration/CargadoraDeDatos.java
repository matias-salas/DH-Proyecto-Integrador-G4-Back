//package com.TPI.DigitalCars.securityConfiguration;
//
//
//import com.TPI.DigitalCars.model.security.AppUsuario;
//import com.TPI.DigitalCars.model.security.AppUsuarioRol;
//import com.TPI.DigitalCars.service.security.AppUsuarioService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.ApplicationArguments;
//import org.springframework.boot.ApplicationRunner;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Component;
//
//@Component
//public class CargadoraDeDatos implements ApplicationRunner {
//
//
//    AppUsuarioService appUsuarioService;
//
//    @Autowired
//    public CargadoraDeDatos(AppUsuarioService appUsuarioService) {
//        this.appUsuarioService = appUsuarioService;
//    }
//
//
//    @Override
//    public void run(ApplicationArguments args) throws Exception {
//        BCryptPasswordEncoder passwordEncoder= new BCryptPasswordEncoder();
//        //ROL ADMINISTRADOR
//        String passAdmin="pass";
//        String passCifradoAdmin= passwordEncoder.encode(passAdmin);
//        System.out.println("La contraseña cifrada es: "+passCifradoAdmin);
//
//        appUsuarioService.guardarUsuario(new AppUsuario("luis","Cedenio","luis_cm95@hotmail.com",passCifradoAdmin, AppUsuarioRol.ROLE_ADMIN, false));
//        //ROL USUARIO
//        String passUser="pass";
//        String passCifradoUser= passwordEncoder.encode(passUser);
//        System.out.println("La contraseña cifrada es: "+passCifradoUser);
//        appUsuarioService.guardarUsuario(new AppUsuario("Romina","Barraveccia","romibarra@gmail.com",passCifradoUser, AppUsuarioRol.ROLE_USER, false));
//        //ROL CEO
//        String passCeo="pass";
//        String passCifradoCeo= passwordEncoder.encode(passUser);
//        System.out.println("La contraseña cifrada es: "+passCifradoCeo);
//        appUsuarioService.guardarUsuario(new AppUsuario("athenea","Cedenio","athenea@gmail.com",passCifradoUser, AppUsuarioRol.ROLE_CEO, false));
//
//    }
//}
