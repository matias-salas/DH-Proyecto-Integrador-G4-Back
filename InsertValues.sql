SET FOREIGN_KEY_CHECKS = 0;

use 1023c03_GRUPO4;

truncate fuel;
insert into fuel values
    (1, "Diesel", "DS"),
    (2, "Nafta", "NF");

truncate transmission;
insert into transmission values 
	(1, 'Automatica', 1),
	(2, 'Manual', 1),
	(3, 'Automatica', 2),
	(4, 'Manual', 2);




truncate category;
insert into category values
	( 1, 'Suv', 'Suv en alquiler', 'https://images.prd.kavak.io/assets/images/models/suv.png'),
	( 2, 'Pickup', 'Pickup en alquiler', 'https://images.prd.kavak.io/assets/images/models/pickup.png'),
	( 3, 'Van', 'Van en alquiler', 'https://images.prd.kavak.io/assets/images/models/van.png'),
	( 4, 'Coupe', 'Coupe en alquiler', 'https://images.prd.kavak.io/assets/images/models/coupe.png'),
	( 5, 'Sedan', 'Sedan en alquiler', 'https://images.prd.kavak.io/assets/images/models/sedan.png'),
	( 6, 'Minivan', 'Minivan en alquiler', 'https://images.prd.kavak.io/assets/images/models/minivan.png'),
	( 7, 'Hatchback', 'Hatchback en alquiler', 'https://images.prd.kavak.io/assets/images/models/hatchback.png');



truncate product;
insert into product (id, name, description, short_description, active, address, latitude, longitude, area, average_score, category_id, transmission_id, site_policies, hse_policies, cancellation_policies) values 
	(1, '112.000','Con 7 versiones para elegir, como JOY LS + 98CV, LTZ AT 98CV, JOY LS 98CV, LT 98CV, LTZ 98CV, JOY LS entre otros igualmente notables.' , '', 1, 'Chevrolet Prisma 1.4 LTZ AT 2018', '-37.9702777', '-57.5955626', '123', '6', 1, 2, "Hora entrega: 10:30. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
    (2, '124.000', 'Gol Trend Hatchback de la generación 2009-2022 con 39 versiones para elegir, como PACK II, PACK I PLUS 101CV, PACK I 101CV, PACK III 101CV, PACK III 101CV I-MOTION, SERIE 101CV.', '', 1, 'Volkswagen Gol Trend 1.6 TRENDLINE MT 2020','-37.9702777', '-57.5955626', '154', '4', 1, 3, "Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
	(3, '96.000', 'Con 72 versiones para elegir, como ADVENTURE CAB EXTEN AA+DA, ADVENTURE CAB EX AA+DA, TREKKING, WORKING, MJET TREKKING CE, MJET TREKKING CS + AA', '', 1, 'Fiat Strada 1.4 8V ENDURANDE CD MT Pickup 2022','-37.9702777', '-57.5955626', '200', '8', 2, 4, "Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
    (4, '230.000', 'Con 182 versiones para elegir, como CD TDI 163CV TRENDLINE 1T2, CD TDI 163CV HIGHLINE 1H0, CD TDI HIGHLINE CUERO HC2, CD TDI HIGHLINE PACK 1P2, CD TDI 163CV HIGHLINE 1H2, CD TDI 163CV TRENDLINE 1T0 ', '', 1, 'Volkswagen Amarok 2.0 CD TDI 140CV 2017','-37.9702777', '-57.5955626', '225', '9', 2, 2, "Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
    (5, '141.000', 'El Chevrolet Onix Hatchback de la generación 2017-2018 es tu opción. Con 7 versiones para elegir, como ACTIV 98CV, EFFECT 98CV.', '', 1, 'Chevrolet Onix 1.4 JOY LS + MT Hatchback 2018','-37.9702777', '-57.5955626', '100', '7', 3, 3,"Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
    (6, '123.000', ' El Ford Maverick cuenta con 15 versiones para elegir, como DESIGN 120CV TITANIUM', '', 1, 'Ford Maverick 2.0 XLT Pickup 2022','-37.9702777', '-57.5955626', '125', '7', 3, 4, "Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
	(7, '224.000', 'El Ford Fiesta Kinetic Design Hatchback de la generación 2011-2022 es tu opción. Con 15 versiones para elegir, como DESIGN 120CV TITANIUM, DESIGN 120CV TREND.', '', 1, 'Ford Fiesta Kinetic Design 1.6 S MT Hatchback 2017','-37.9702777', '-57.5955626', '225', '10', 4, 1, "Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
	(8, '89.000', ' El Ford Bronco Sport SUV de la generación 2021-2022 con 2 versiones para elegir.', '', 1, 'Ford Bronco Sport 1.5 ECOBOOST BIG BEND AT 4WD Suv 2021','-37.9702777', '-57.5955626', '175', '4', 4, 2, "Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
    (9, '90.000', 'Mirá lo que te ofrece el Chevrolet Cruze II Hatchback de la generación 2016-2022 con 16 versiones.', '', 1, 'Chevrolet Cruze Ii 1.4 LTZ AT Hatchback 2017','-37.9702777', '-57.5955626', '300', '8', 5, 4, "Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto."),
    (10, '78.000', 'El Renault Sandero Hatchback de la generación 2011-2018 con 32 versiones para elegir, como 8V GET UP, AUTHENTIQUE PACK I 90CV, AUTHENTIQUE PACK II 90CV, DCI CONFORT, GT LINE 105CV.', '', 1, 'Renault Sandero 2.0 RS 145CV Hatchback 2016','-37.9702777', '-57.5955626', '230', '5', 5, 3, "Hora entrega: 10:00. No se permite que circule por terrenos montañosos","","Agregá las fechas de tu viaje para obtener los detallles decancelación de este auto.");


truncate image;
insert into image values
    (1, 'Prisma', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Prisma/foto-portada.webp', 1),
    (2, 'Prisma', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Prisma/foto-1.webp', 1),
	(3, 'Prisma', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Prisma/foto-2.webp', 1),
	(4, 'Prisma', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Prisma/foto-3.webp', 1),  
	(5, 'Prisma', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Prisma/foto-4.webp', 1),
    
    (6, 'Gol', 'https://digital-cars.s3.us-east-2.amazonaws.com/Gol+Trend/foto-portada.webp', 2),
    (7, 'Gol', 'https://digital-cars.s3.us-east-2.amazonaws.com/Gol+Trend/foto-1.webp', 2),
	(8, 'Gol', 'https://digital-cars.s3.us-east-2.amazonaws.com/Gol+Trend/foto-2.webp', 2),
	(9, 'Gol', 'https://digital-cars.s3.us-east-2.amazonaws.com/Gol+Trend/foto-3.webp', 2),  
	(10, 'Gol', 'https://digital-cars.s3.us-east-2.amazonaws.com/Gol+Trend/foto-4.webp', 2),
   
    (11, 'Strada', 'https://digital-cars.s3.us-east-2.amazonaws.com/Fiat+Strada/foto-portada.webp', 3),
    (12, 'Strada', 'https://digital-cars.s3.us-east-2.amazonaws.com/Fiat+Strada/foto-1.webp', 3),
	(13, 'Strada', 'https://digital-cars.s3.us-east-2.amazonaws.com/Fiat+Strada/foto-2.webp', 3),
	(14, 'Strada', 'https://digital-cars.s3.us-east-2.amazonaws.com/Fiat+Strada/foto-3.webp', 3),  
	(15, 'Strada', 'https://digital-cars.s3.us-east-2.amazonaws.com/Fiat+Strada/foto-4.webp', 3),
    
    (16, 'Amarok', 'https://digital-cars.s3.us-east-2.amazonaws.com/VW+Amarok/foto-portada.webp', 4),
    (17, 'Amarok', 'https://digital-cars.s3.us-east-2.amazonaws.com/VW+Amarok/foto-1.webp', 4),
	(18, 'Amarok', 'https://digital-cars.s3.us-east-2.amazonaws.com/VW+Amarok/foto-2.webp', 4),
	(19, 'Amarok', 'https://digital-cars.s3.us-east-2.amazonaws.com/VW+Amarok/foto-3.webp', 4),  
	(20, 'Amarok', 'https://digital-cars.s3.us-east-2.amazonaws.com/VW+Amarok/foto-4.webp', 4),
    
    (21, 'Onix', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Onix/foto-portada.webp', 5),
    (22, 'Onix', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Onix/foto-1.webp', 5),
	(23, 'Onix', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Onix/foto-2.webp', 5),
	(24, 'Onix', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Onix/foto-3.webp', 5),  
	(25, 'Onix', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Onix/foto-4.webp', 5),
    
    (26, 'Maverick', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Maverick/foto-portada.webp', 6),
    (27, 'Maverick', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Maverick/foto-1.webp', 6),
	(28, 'Maverick', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Maverick/foto-2.webp', 6),
	(29, 'Maverick', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Maverick/foto-3.webp', 6),  
	(30, 'Maverick', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Maverick/foto-4.webp', 6),
    
    (31, 'Fiesta', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Fiesta/foto-portada.webp', 7),
    (32, 'Fiesta', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Fiesta/foto-1.webp', 7),
	(33, 'Fiesta', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Fiesta/foto-2.webp', 7),
	(34, 'Fiesta', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Fiesta/foto-3.webp', 7),  
	(35, 'Fiesta', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Fiesta/foto-4.webp', 7),
    
    (36, 'Bronco', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Bronco/foto-portada.webp', 8),
    (37, 'Bronco', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Bronco/foto-1.webp', 8),
	(38, 'Bronco', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Bronco/foto-2.webp', 8),
	(39, 'Bronco', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Bronco/foto-3.webp', 8),  
	(40, 'Bronco', 'https://digital-cars.s3.us-east-2.amazonaws.com/Ford+Bronco/foto-4.webp', 8),
     
    (41, 'Cruze', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Cruze/foto-portada.webp', 9),
    (42, 'Cruze', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Cruze/foto-1.webp', 9),
	(43, 'Cruze', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Cruze/foto-2.webp', 9),
	(44, 'Cruze', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Cruze/foto-3.webp', 9),  
	(45, 'Cruze', 'https://digital-cars.s3.us-east-2.amazonaws.com/Chevrolet+Cruze/foto-4.webp', 9),
    
    (46, 'Sandero', 'https://digital-cars.s3.us-east-2.amazonaws.com/Renault+Sandero/foto-portada.webp', 10),
    (47, 'Sandero', 'https://digital-cars.s3.us-east-2.amazonaws.com/Renault+Sandero/foto-1.webp', 10),
	(48, 'Sandero', 'https://digital-cars.s3.us-east-2.amazonaws.com/Renault+Sandero/foto-2.webp', 10),
	(49, 'Sandero', 'https://digital-cars.s3.us-east-2.amazonaws.com/Renault+Sandero/foto-3.webp', 10),  
	(50, 'Sandero', 'https://digital-cars.s3.us-east-2.amazonaws.com/Renault+Sandero/foto-4.webp', 10)
;

insert into role values
	(1, "USER"),
	(2, "ADMIN");
    
truncate user;
insert into user values
    (1, 'Mati', 'Salas', 'matiasalas.e@gmail.com', '$2a$10$0HS.EZnSYVQyDaE1Tzz3I.NjXdP4hibn6DR.yDu1SR2zdiLI.AW82', 1, 1, 2),
	(2, 'Test', 'Normal', 'test@gmail.com', '$2a$10$tng.xSnyBErXsTWEdrhCiOPaQsildB0jXcslHKEW4cUHaZcC/tLF6', 1, 1, 1);

truncate reservation;
insert into reservation values
(1, '10:30:00', '2023-12-24', '2023-12-08', 'Reserva 1', 6, 2),
(2, '11:00:00', '2024/01/01', '2024/01/05', 'Reserva 2', 6, 2),
(3, '10:30:00', '2023/12/16', '2023-12-26', 'Reserva 3', 1, 2),
(4, '10:30:00', '2023/12/23', '2024-01-08', 'Reserva 4', 2, 2);

truncate spec;
INSERT into spec
VALUES
(1, "Aire Acondicionado", "faSnowflake"),
(2, "Maletas", "faSuitcase"),
(3, "Seguro", "faShieldHalved"),
(4, "Automática", "faGear"),
(5, "Seguro", "faShieldHalved"),
(6, "5 Puertas", "faCar"),
(7, "5 Pasajeros", "faUser"),
(8, "GPS", "faCompass>");

INSERT into product_spec VALUES 
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 5),
(3, 4),
(3, 5),
(3, 7),
(4, 4),
(5, 7),
(6, 1),
(6, 5),
(6, 7),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(8, 1),
(8, 3),
(8, 5),
(9, 4),
(9, 5),
(9, 7),
(10, 4),
(10, 5);



