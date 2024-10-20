
USE main;

CREATE TABLE `Vehicles` (
  `id` integer NOT NULL,
  `vehicle_number` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` YEAR NOT NULL,
  `type` text NOT NULL,
  `last_service_date` datetime NOT NULL,
  `status` boolean NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `Drivers` (
  `driver_id` integer,
  `name` text,
  `license_number` integer,
  `license_category` varchar(255),
  `phone` tinyint,
  `hire_date` datetime,
  `roll` integer,
  `status` boolean,
   PRIMARY KEY (`driver_id`)
  
);

CREATE TABLE `InsuranceCompanies` (
  `company_id` integer,
  `name` text,
  `contact_info` text,
  `vehicle_count` integer,
  `status` boolean,
   PRIMARY KEY (`company_id`)
);

CREATE TABLE `Mechanic` (
  `mechanic_id` integer,
  `name` text,
  `service_id` integer,
  `phone` tinyint,
  `hire_date` datetime,
  `service_count` integer,
  `status` boolean,
   PRIMARY KEY (`mechanic_id`)
);

CREATE TABLE `DeliveredGoods` (
  `good_id` integer,
  `type` varchar(255),
  `supplier_id` integer,
  `route_id` integer,
  `count` integer,
  `vehicle_id` integer,
  `driver_id` integer,
  `status` boolean,
  `trip_id` integer,
  PRIMARY KEY (`good_id`)
);

CREATE TABLE `Routes` (
  `route_id` integer,
  `end_point` varchar(255),
  `distanse` integer,
  `status` boolean,
  PRIMARY KEY (`route_id`)
  
);

CREATE TABLE `Trips` (
  `trip_id` integer,
  `vehicle_id` integer,
  `driver_id` integer,
  `route_id` integer,
  `departure_time` timestamp,
  `arrival_tipe` timestamp,
   PRIMARY KEY (`trip_id`)
);

CREATE TABLE `Suppliers` (
  `supplier_id` integer,
  `goods` text,
  `contact_info` text,
  `address` text,
  PRIMARY KEY (`supplier_id`)
);

CREATE TABLE `ServiceTypes` (
  `service_id` integer,
  `name` varchar(255),
  `description` text,
  PRIMARY KEY (`service_id`)
);

CREATE TABLE `Services` (
  `repair_id` integer,
  `vehicle_id` integer,
  `mechanic_id` integer,
  `service_id` integer,
  `service_date` timestamp,
  `accident_id` integer,
  PRIMARY KEY (`repair_id`)
);

CREATE TABLE `Accidents` (
  `accident_id` integer,
  `vehicle_id` integer,
  `driver_id` integer,
  `accident_date` timestamp,
  `desctiption` text,
  `insurance_status` boolean,
  PRIMARY KEY (`accident_id`)
);

CREATE TABLE `VehicleReplacement` (
  `replacement_id` integer,
  `vehicle_id` integer,
  `replacement_type` varchar(255),
  PRIMARY KEY (`replacement_id`)
);

CREATE TABLE `Fuel` (
  `fuel_id` integer,
  `fuel_type` varchar(255),
  `price` integer,
  `count` integer,
  PRIMARY KEY (`fuel_id`)
);

CREATE TABLE `Refueling` (
  `refueling_id` integer,
  `vehicle_id` integer,
  `fuel_id` integer,
  `count` integer,
  `refueling_date` datetime,
  PRIMARY KEY (`refueling_id`)
);

CREATE TABLE `Insurance` (
  `insurance_id` integer,
  `vehicle_id` integer,
  `company_id` integer,
  `policy_number` varchar(255),
  `start_date` datetime,
  `end_date` datetime,
  `status` boolean,
  PRIMARY KEY (`insurance_id`)
);

ALTER TABLE `Mechanic` ADD FOREIGN KEY (`service_id`) REFERENCES `ServiceTypes` (`service_id`);

ALTER TABLE `DeliveredGoods` ADD FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers` (`supplier_id`);

ALTER TABLE `DeliveredGoods` ADD FOREIGN KEY (`route_id`) REFERENCES `Routes` (`route_id`);

ALTER TABLE `DeliveredGoods` ADD FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`id`);

ALTER TABLE `DeliveredGoods` ADD FOREIGN KEY (`driver_id`) REFERENCES `Drivers` (`driver_id`);

ALTER TABLE `DeliveredGoods` ADD FOREIGN KEY (`trip_id`) REFERENCES `Trips` (`trip_id`);

ALTER TABLE `Trips` ADD FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`id`);

ALTER TABLE `Trips` ADD FOREIGN KEY (`driver_id`) REFERENCES `Vehicles` (`id`);

ALTER TABLE `Trips` ADD FOREIGN KEY (`route_id`) REFERENCES `Routes` (`route_id`);

ALTER TABLE `Services` ADD FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`id`);

ALTER TABLE `Services` ADD FOREIGN KEY (`mechanic_id`) REFERENCES `Mechanic` (`mechanic_id`);

ALTER TABLE `Services` ADD FOREIGN KEY (`service_id`) REFERENCES `ServiceTypes` (`service_id`);

ALTER TABLE `Services` ADD FOREIGN KEY (`accident_id`) REFERENCES `Accidents` (`accident_id`);

ALTER TABLE `Accidents` ADD FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`id`);

ALTER TABLE `Accidents` ADD FOREIGN KEY (`driver_id`) REFERENCES `Drivers` (`driver_id`);

ALTER TABLE `Accidents` ADD `insurance_id` integer;

ALTER TABLE `Accidents` ADD FOREIGN KEY (`insurance_id`) REFERENCES `Insurance` (`insurance_id`);


ALTER TABLE `VehicleReplacement` ADD FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`id`);

ALTER TABLE `Refueling` ADD FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`id`);

ALTER TABLE `Refueling` ADD FOREIGN KEY (`fuel_id`) REFERENCES `Fuel` (`fuel_id`);

ALTER TABLE `Insurance` ADD FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicles` (`id`);

ALTER TABLE `Insurance` ADD FOREIGN KEY (`company_id`) REFERENCES `InsuranceCompanies` (`company_id`);
