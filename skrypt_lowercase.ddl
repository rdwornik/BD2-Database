create table "address" (
    "id_address"  serial not null,
    "address"     character varying(50) not null
)
with (
  autovacuum_enabled=true)
;

create unique index "address_id__idx" on "address" ( "id_address" );

alter table "address" add constraint "address_pk" primary key ( "id_address" );

create table "booking" (
    "id_booking"                serial not null,
    "date"                      timestamp not null,
    "duration"                  smallint not null,
    "is_extension_available"    character(1) not null,
    "id_status"                 integer not null,
    "id_scooter"                integer not null,
    "id_customer"               integer not null
)
with (
  autovacuum_enabled=true)
;

create unique index "booking_id__idx" on "booking" ( "id_booking" );

create index "booking_date__idx" on "booking" ( "date" );

create index "booking_fk_status__idx" on "booking" ( "id_status" );

create index "booking_fk_scooter__idx" on "booking" ( "id_scooter" );

create index "booking_fk_customer__idx" on "booking" ( "id_customer" );

alter table "booking" add constraint "booking_pk" primary key ( "id_booking" );

create table "bookingstatus" (
    "id_status"  serial not null,
    "type"       character varying(15) not null
)
with (
  autovacuum_enabled=true)
;

create unique index "bookingstatus_id__idx" on "bookingstatus" ( "id_status" );

alter table "bookingstatus" add constraint "bookingstatus_pk" primary key ( "id_status" );

create table "customer" (
    "id_customer"  serial not null,
    "name"         character varying(20) not null,
    "surname"      character varying(20) not null,
    "email"        character varying(30) not null,
    "id_address"   integer not null,
    "id_password"  integer not null
)
with (
  autovacuum_enabled=true)
;

create unique index "customer_id__idx" on "customer" ( "id_customer" );

create unique index "customer_email__idx" on "customer" ( "email" );

create index "customer_fk_address__idx" on "customer" ( "id_address" );

create index "customer_fk_password__idx" on "customer" ( "id_password" );

alter table "customer" add constraint "customer_pk" primary key ( "id_customer" );

alter table "customer" add constraint "customer_email__un" unique ( "email" );

create table "employee" (
    "id_employee"    serial not null,
    "name"           character varying(20) not null,
    "surname"        character varying(20) not null,
    "email"          character varying(30) not null,
    "id_address"     integer not null,
    "position_name"  character varying(20) not null,
    "id_password"    integer not null
)
with (
  autovacuum_enabled=true)
;

create unique index "employee_id__idx" on "employee" ( "id_employee" );

create unique index "employee_email__idx" on "employee" ( "email" );

create index "employee_fk_address__idx" on "employee" ( "id_address" );

create index "employee_fk_position__idx" on "employee" ( "position_name" );

create index "employee_fk_password__idx" on "employee" ( "id_password" );

alter table "employee" add constraint "employee_pk" primary key ( "id_employee" );

alter table "employee" add constraint "employee_email__un" unique ( "email" );

create table "maintenanceservice" (
    "id_service"   serial not null,
    "date"       date not null,
    "duration"     smallint not null,
    "id_scooter"   integer not null,
    "id_status"    integer not null,
    "id_employee"  integer not null
)
with (
  autovacuum_enabled=true)
;

create unique index "maintenanceservice_id__idx" on "maintenanceservice" ( "id_service" );

create index "maintenancesrvc_date__idx" on "maintenanceservice" ( "date" );

create index "maintenancesrvc_fk_scooter_idx" on "maintenanceservice" ( "id_scooter" );

create index "maintenancesrvc_fk_status_idx" on "maintenanceservice" ( "id_status" );

create index "maintenancesrvc_fk_employee_idx" on "maintenanceservice" ( "id_employee" );

alter table "maintenanceservice" add constraint "maintenanceservice_pk" primary key ( "id_service" );

create table "password" (
    "id_password"  serial not null,
    "password"     character varying(45) not null
)
with (
  autovacuum_enabled=true)
;

create unique index "password_id__idx" on "password" ( "id_password" );

alter table "password" add constraint "password_pk" primary key ( "id_password" );

create table "paymentstatus" (
    "id_status"  serial not null,
    "type"       character varying(15) not null
)
with (
  autovacuum_enabled=true)
;

create unique index "paymentstatus_id__idx" on "paymentstatus" ( "id_status" );

alter table "paymentstatus" add constraint "paymentstatus_pk" primary key ( "id_status" );

create table "position" (
    "position_name"  character varying(20) not null,
    "salary"         numeric(10, 2) not null
)
with (
  autovacuum_enabled=true)
;

create unique index "position_name__idx" on "position" ( "position_name" );

alter table "position" add constraint "position_pk" primary key ( "position_name" );

create table "relocation" (
    "id_relocation"  serial not null,
    "date"           date not null,
    "id_scooter"     integer not null,
    "id_status"      integer not null,
    "id_employee"    integer not null
)
with (
  autovacuum_enabled=true)
;

create unique index "relocation_id__idx" on "relocation" ( "id_relocation" );

create index "relocation_date__idx" on "relocation" ( "date" );

create index "relocation_fk_scooter__idx" on "relocation" ( "id_scooter" );

create index "relocation_fk_status__idx" on "relocation" ( "id_status" );

create index "relocation_fk_employee__idx" on "relocation" ( "id_employee" );

alter table "relocation" add constraint "relocation_pk" primary key ( "id_relocation" );

create table "relocationstatus" (
    "id_status"  serial not null,
    "type"       character varying(15) not null
)
with (
  autovacuum_enabled=true)
;

create unique index "relocationstatus_id__idx" on "relocationstatus" ( "id_status" );

alter table "relocationstatus" add constraint "relocationstatus_pk" primary key ( "id_status" );

create table "rental" (
    "id_rental"         serial not null,
    "fee"               numeric(10, 2),
    "id_scooter"        integer not null,
    "id_customer"       integer not null,
    "id_paymentstatus"  integer not null
)
with (
  autovacuum_enabled=true)
;

create unique index "rental_id__idx" on "rental" ( "id_rental" );

create index "rental_fee__idx" on "rental" ( "fee" );

create index "rental_fk_scooter__idx" on "rental" ( "id_scooter" );

create index "rental_fk_customer__idx" on "rental" ( "id_customer" );

create index "rental_fk_payment__idx" on "rental" ( "id_paymentstatus" );

alter table "rental" add constraint "rental_pk" primary key ( "id_rental" );

create table "scooter" (
    "id_scooter"      serial not null,
    "serial_numeric"  character varying(15) not null,
    "age"             smallint not null,
    "comment"         character varying(30),
    "latitude"        character varying(10) not null,
    "longitude"       character varying(10) not null,
    "qr_code"         character varying(30) not null,
    "id_status"       integer not null
)
with (
  autovacuum_enabled=true)
;

create unique index "scooter_id__idx" on "scooter" ( "id_scooter" );

create index "scooter_location__idx" on "scooter" ( "latitude", "longitude" );

create unique index "scooter_qr__idx" on "scooter" ( "qr_code" );

create index "scooter_fk_status__idx" on "scooter" ( "id_status" );

alter table "scooter" add constraint "scooter_pk" primary key ( "id_scooter" );

create table "scooterstatus" (
    "id_status"      serial not null,
    "conditiontype"  character varying(15) not null
)
with (
  autovacuum_enabled=true)
;

create unique index "scooterstatus_id__idx" on "scooterstatus" ( "id_status" );

alter table "scooterstatus" add constraint "scooterstatus_pk" primary key ( "id_status" );

create table "servicestatus" (
    "id_status"  serial not null,
    "type"       character varying(15) not null
)
with (
  autovacuum_enabled=true)
;

create unique index "servicestatus_id__idx" on "servicestatus" ( "id_status" );

alter table "servicestatus" add constraint "servicestatus_pk" primary key ( "id_status" );

alter table "booking"
    add constraint "booking_bookingstatus_fk" foreign key ( "id_status" )
        references "bookingstatus" ( "id_status" );

alter table "booking"
    add constraint "booking_customer_fk" foreign key ( "id_customer" )
        references "customer" ( "id_customer" );

alter table "booking"
    add constraint "booking_scooter_fk" foreign key ( "id_scooter" )
        references "scooter" ( "id_scooter" );

alter table "customer"
    add constraint "customer_address_fk" foreign key ( "id_address" )
        references "address" ( "id_address" );

alter table "customer"
    add constraint "customer_password_fk" foreign key ( "id_password" )
        references "password" ( "id_password" );

alter table "employee"
    add constraint "employee_address_fk" foreign key ( "id_address" )
        references "address" ( "id_address" );

alter table "employee"
    add constraint "employee_password_fk" foreign key ( "id_password" )
        references "password" ( "id_password" );

alter table "employee"
    add constraint "employee_position_fk" foreign key ( "position_name" )
        references "position" ( "position_name" );

alter table "maintenanceservice"
    add constraint "maintenanceservice_employee_fk" foreign key ( "id_employee" )
        references "employee" ( "id_employee" );

alter table "maintenanceservice"
    add constraint "maintenanceservice_scooter_fk" foreign key ( "id_scooter" )
        references "scooter" ( "id_scooter" );

alter table "maintenanceservice"
    add constraint "maintenanceservice_status_fk" foreign key ( "id_status" )
        references "servicestatus" ( "id_status" );

alter table "relocation"
    add constraint "relocation_employee_fk" foreign key ( "id_employee" )
        references "employee" ( "id_employee" );

alter table "relocation"
    add constraint "relocation_relocationstatus_fk" foreign key ( "id_status" )
        references "relocationstatus" ( "id_status" );

alter table "relocation"
    add constraint "relocation_scooter_fk" foreign key ( "id_scooter" )
        references "scooter" ( "id_scooter" );

alter table "rental"
    add constraint "rental_customer_fk" foreign key ( "id_customer" )
        references "customer" ( "id_customer" );

alter table "rental"
    add constraint "rental_paymentstatus_fk" foreign key ( "id_paymentstatus" )
        references "paymentstatus" ( "id_status" );

alter table "rental"
    add constraint "rental_scooter_fk" foreign key ( "id_scooter" )
        references "scooter" ( "id_scooter" );

alter table "scooter"
    add constraint "scooter_scooterstatus_fk" foreign key ( "id_status" )
        references "scooterstatus" ( "id_status" );