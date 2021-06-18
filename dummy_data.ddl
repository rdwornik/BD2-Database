-- DUMMY DATA

-- DELETE EVERYTHING

DELETE FROM "rental"
RETURNING *;

DELETE FROM "relocation"
RETURNING *;

DELETE FROM "maintenanceservice"
RETURNING *;

DELETE FROM "booking"
RETURNING *;

DELETE FROM "customer"
RETURNING *;

DELETE FROM "employee"
RETURNING *;

DELETE FROM "scooter"
RETURNING *;

DELETE FROM "address"
RETURNING *;

DELETE FROM "password"
RETURNING *;

DELETE FROM "paymentstatus"
RETURNING *;

DELETE FROM "bookingstatus"
RETURNING *;

DELETE FROM "position"
RETURNING *;

DELETE FROM "relocationstatus"
RETURNING *;

DELETE FROM "scooterstatus"
RETURNING *;

DELETE FROM "servicestatus"
RETURNING *;

-- RESET SERIAL SEQUENCES

ALTER SEQUENCE maintenanceservice_id_service_seq    RESTART WITH 1;
ALTER SEQUENCE password_id_password_seq             RESTART WITH 1;
ALTER SEQUENCE paymentstatus_id_status_seq          RESTART WITH 1;
ALTER SEQUENCE relocation_id_relocation_seq         RESTART WITH 1;
ALTER SEQUENCE relocationstatus_id_status_seq       RESTART WITH 1;
ALTER SEQUENCE address_id_address_seq               RESTART WITH 1;
ALTER SEQUENCE booking_id_booking_seq               RESTART WITH 1;
ALTER SEQUENCE bookingstatus_id_status_seq          RESTART WITH 1;
ALTER SEQUENCE customer_id_customer_seq             RESTART WITH 1;
ALTER SEQUENCE employee_id_employee_seq             RESTART WITH 1;
ALTER SEQUENCE rental_id_rental_seq                 RESTART WITH 1;
ALTER SEQUENCE scooter_id_scooter_seq               RESTART WITH 1;
ALTER SEQUENCE scooterstatus_id_status_seq          RESTART WITH 1;
ALTER SEQUENCE servicestatus_id_status_seq          RESTART WITH 1;

-- RE-INSERT DATA

INSERT INTO "bookingstatus" ("type") VALUES 
  ('BOOKED'),
  ('CANCELLED'),
  ('RECEIVED');

INSERT INTO "paymentstatus" ("type") VALUES 
  ('DUE'),
  ('COMPLETED');

INSERT INTO "relocationstatus" ("type") VALUES 
  ('PENDING'),
  ('IN PROGRESS'),
  ('COMPLETED');

INSERT INTO "scooterstatus" ("conditiontype") VALUES 
  ('FREE'),
  ('TAKEN'),
  ('OUT OF ORDER'),
  ('UNDER REPAIR');

INSERT INTO "servicestatus" ("type") VALUES 
  ('PENDING'),
  ('IN PROGRESS'),
  ('COMPLETED');

INSERT INTO "address" ("address") VALUES 
  ('ul. Polna, 01-100 Warszawa'),
  ('ul. Skrajna, 01-205 Warszawa'),
  ('ul. Długa, 01-220 Warszawa'),
  ('ul. Szeroka, 02-300 Warszawa'),
  ('ul. Szara, 00-050 Warszawa'),
  ('ul. Mokra, 00-024 Warszawa'),
  ('ul. Kręta, 12-200 Kraków'),
  ('ul. Bystra, 12-250 Kraków'),
  ('ul. Portowa, 20-005 Gdańsk'),
  ('ul. Morska, 20-304 Gdańsk');

INSERT INTO "password" ("password") VALUES 
  ('e1f261867658f6b8c4c8fe6d30a3d9db769e8be2'),
  ('8df59a5db9d8ff69fafe883a6a7d826358ec7e45'),
  ('284924f8018a99a86b66737e1ef3a27a1f538ded'),
  ('5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8'),
  ('9517b4e47d9a1470ea7fc3690743ec70c6795f8b'),
  ('cc5a95ea634e8e4fe7064422d189b3eb35932231'),
  ('80fa679bfd0aabfbf5680db91735a88e306c8dde'),
  ('80c9649e4d0feb173be6fcff04599de2d5871328'),
  ('374ddc2e336e1751fe923f185c27763ed8a44012'),
  ('be799c9026422c03c8bad1dc5c74a910ef831ef9');

INSERT INTO "position" ("position_name", "salary") VALUES 
  ('kierownik', '6000'),
  ('serwisant', '4500'),
  ('tragarz', '3500');

INSERT INTO "scooter" ("serial_numeric", "age", "comment", "latitude", "longitude", "qr_code", "id_status") VALUES 
  ('XE-9042-112E', '3', NULL, '34.284', '19.377', 'XE-9042-112E', '1'),
  ('XE-9042-102A', '4', NULL, '33.321', '19.327', 'XE-9042-102A', '1'),
  ('XE-9042-201C', '2', 'Uszkodzony akumulator', '35.102', '18.995', 'XE-9042-201C', '3'),
  ('XE-9042-150F', '3', 'Zużyte tylne koło', '31.563', '18.754', 'XE-9042-150F', '4'),
  ('XE-9042-503B', '1', NULL, '36.734', '20.027', 'XE-9042-503B', '1');

INSERT INTO "customer" ("name", "surname", "email", "id_address", "id_password") VALUES 
  ('Rafał', 'Nidecki', 'raf.nid@hotmail.com', '10', '10'),
  ('Andrzej', 'Kraśny', 'and.kra@hotmail.com', '1', '1'),
  ('Krzysztof', 'Szary', 'krz.sza@hotmail.com', '9', '9'),
  ('Adam', 'Kruchy', 'ada.kru@hotmail.com', '2', '2'),
  ('Dariusz', 'Żagiel', 'dar.zag@hotmail.com', '8', '8');

INSERT INTO "employee" ("name", "surname", "email", "id_address", "position_name", "id_password") VALUES 
  ('Mariusz', 'Czyżewski', 'mar.czy@hotmail.com', '3', 'serwisant', '3'),
  ('Marian', 'Zawadzki', 'mar.zaw@hotmail.com', '7', 'serwisant', '7'),
  ('Zdzisław', 'Górski', 'zdz.gor@hotmail.com', '4', 'kierownik', '4'),
  ('Cezary', 'Borowy', 'cez.bor@hotmail.com', '6', 'tragarz', '6'),
  ('Radosław', 'Pawlak', 'rad.paw@hotmail.com', '5', 'tragarz', '5');

INSERT INTO "booking" ("date", "duration", "is_extension_available", "id_status", "id_scooter", "id_customer") VALUES 
  ('2021-05-20 13:00:00', '30', '0', '3', '3', '2'),
  ('2021-05-24 11:00:00', '90', '0', '3', '1', '3'),
  ('2021-05-29 10:00:00', '15', '0', '2', '4', '1'),
  ('2021-06-02 15:30:00', '15', '0', '3', '2', '4'),
  ('2021-06-20 15:00:00', '30', '1', '1', '5', '5');

INSERT INTO "maintenanceservice" ("date", "duration", "id_scooter", "id_status", "id_employee") VALUES 
  ('2021-05-15', '1', '1', '3', '1'),
  ('2021-06-04', '5', '4', '2', '2'),
  ('2021-06-24', '2', '3', '1', '1');

INSERT INTO "relocation" ("date", "id_scooter", "id_status", "id_employee") VALUES 
  ('2021-05-20', '3', '3', '4'),
  ('2021-05-24', '1', '3', '4'),
  ('2021-05-29', '4', '3', '5'),
  ('2021-06-02', '2', '2', '5'),
  ('2021-06-20', '5', '1', '4');

INSERT INTO "rental" ("fee", "id_scooter", "id_customer", "id_paymentstatus") VALUES 
  ('5.00', '3', '2', '2'),
  ('15.00', '1', '3', '2'),
  ('2.50', '4', '1', '2'),
  ('2.50', '2', '4', '2'),
  ('5.00', '5', '5', '1');