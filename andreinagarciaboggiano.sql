-- Esquema de trabajo
create schema andreina_garcia_boggiano authorization okquxbdp;

--- TABLA COMPANIES ---
create table andreina_garcia_boggiano.companies(
				id_company integer not null, -- PK
				company varchar(30) not null
				);

alter table andreina_garcia_boggiano.companies
	add constraint pk_company primary key (id_company);
	
--- TABLA BRANDS ---

create table andreina_garcia_boggiano.brands(
				id_brand integer not null, -- PK
				id_company integer not null, -- FK -> Companies-> id_company
				brand varchar(30) not null
				);

alter table andreina_garcia_boggiano.brands
	add constraint pk_brand primary key (id_brand);

alter table andreina_garcia_boggiano.brands
	add constraint brand_id_company_FK foreign key (id_company) 
	references andreina_garcia_boggiano.companies (id_company);
	
--- TABLA MODELS ---

create table andreina_garcia_boggiano.models(
				id_model integer not null, -- PK
				id_brand integer not null, -- FK -> Brands ->id_brand
				model varchar(30) not null
				);

alter table andreina_garcia_boggiano.models
	add constraint pk_model primary key (id_model);

alter table andreina_garcia_boggiano.models
add constraint models_id_brand_FK foreign key (id_brand) 
references andreina_garcia_boggiano.brands (id_brand);

 --- TABLA COLORS --- 

create table andreina_garcia_boggiano.colors(
				id_color integer not null,--PK
				color varchar(30) not null
				);
			
alter table andreina_garcia_boggiano.colors
	add constraint pk_color primary key (id_color);
	
--- TABLA INSURANCE COMPANIES ---

create table andreina_garcia_boggiano.insurancecompanies(
				id_insurance_company integer not null, -- PK
				id_car integer not null, -- PK, FK -> Cars-> id_car
				insurance_company varchar(50) not null
				);
alter  table andreina_garcia_boggiano.insurancecompanies
	add constraint pk_insurancecompanies primary key (id_insurance_company,id_car);


alter table andreina_garcia_boggiano.insurancecompanies
add constraint insurancecompanies_id_car_FK foreign key (id_car) 
references andreina_garcia_boggiano.cars (id_car);

--- TABLA INSPECTIONS ---

create table andreina_garcia_boggiano.inspections(
				km integer not null, --PK
				id_car integer not null, --PK, FK -> Cars -> id_car
				id_currency integer not null default '001', --FK -> Currency ->id_currency
				price integer not null,
				inspection_date date not null  default '4000-01-01'
				);
alter  table andreina_garcia_boggiano.inspections
	add constraint pk_inspections primary key (km,id_car);

alter table andreina_garcia_boggiano.inspections
add constraint inspections_id_car_FK foreign key (id_car) 
references andreina_garcia_boggiano.cars (id_car);

alter table andreina_garcia_boggiano.inspections
add constraint inspections_id_currency_FK foreign key (id_currency) 
references andreina_garcia_boggiano.currency (id_currency);

--- TABLA CURRENCY ---

create table andreina_garcia_boggiano.currency(
				id_currency integer not null,--PK
				currency varchar(30) not null
				);
			
alter table andreina_garcia_boggiano.currency
	add constraint pk_currency primary key (id_currency);

--- TABLA CARS ---

create table andreina_garcia_boggiano.cars(
				id_car integer not null, --PK
				id_model integer not null, --FK -> Models -> id_model
				id_color integer not null, --FK -> Colors -> id_color
				id_insurance_company integer not null, -- FK -> InsuranceCompanies -> id_insurance_company
				id_policy varchar(30) not null,
				license_plate varchar (30) not null,
				date_purchase date not null  default '4000-01-01',
				km_total integer not null
				);
alter  table andreina_garcia_boggiano.cars
	add constraint pk_cars primary key (id_car);

alter table andreina_garcia_boggiano.cars
add constraint cars_id_model_FK foreign key (id_model) 
references andreina_garcia_boggiano.models (id_model);

alter table andreina_garcia_boggiano.cars
add constraint cars_id_color_FK foreign key (id_color) 
references andreina_garcia_boggiano.colors (id_color);

alter table andreina_garcia_boggiano.cars
add constraint cars_id_insurancecompany_FK foreign key (id_insurance_company) 
references andreina_garcia_boggiano.insurancecompanies(id_insurance_company);


--- CARGA DE DATOS --
--- TABLA COMPANIES ---

insert into andreina_garcia_boggiano.companies
	(id_company, company)
	values('001', 'BMW');

insert into andreina_garcia_boggiano.companies
	(id_company, company)
	values('002', 'General Motors');

insert into andreina_garcia_boggiano.companies
	(id_company, company)
	values('003', 'Volkswagen');

--- TABLA BRANDS ---

insert into andreina_garcia_boggiano.brands
	(id_brand, id_company, brand)
	values('001', '001', 'Mini');

insert into andreina_garcia_boggiano.brands
	(id_brand, id_company, brand)
	values('002', '001', 'BMW');

insert into andreina_garcia_boggiano.brands
	(id_brand, id_company, brand)
	values('003', '002', 'Chevrolet');

insert into andreina_garcia_boggiano.brands
	(id_brand, id_company, brand)
	values('004', '002', 'GMC');
	
insert into andreina_garcia_boggiano.brands
	(id_brand, id_company, brand)
	values('005', '003', 'Audi');
	
insert into andreina_garcia_boggiano.brands
	(id_brand, id_company, brand)
	values('006', '003', 'Volkswagen');
	
--- TABLA MODELS ---

insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('001', '001', 'Mini Country Man');
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('002', '001', 'Mini Country Man Hibrido');
	
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('003', '002', 'iX M60');	
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('004', '002', 'i7');

insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('005', '003', 'Spark');	
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('006', '003', 'Malibu');
	
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('007', '004', 'Hummer');
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('008', '004', 'Acadian');

insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('009', '005', 'SQ8');
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('010', '005', 'A1');
	
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('011', '006', 'Polo');
insert into andreina_garcia_boggiano.models
	(id_model, id_brand, model)
	values('012', '006', 'Golf');

--- TABLA COLORS --- 

insert into andreina_garcia_boggiano.colors
	(id_color, color)
	values('001', 'Black');

insert into andreina_garcia_boggiano.colors
	(id_color, color)
	values('002', 'White');

insert into andreina_garcia_boggiano.colors
	(id_color, color)
	values('003', 'Red');

insert into andreina_garcia_boggiano.colors
	(id_color, color)
	values('004', 'Grey');

--- Currency --

insert into andreina_garcia_boggiano.currency
	(id_currency, currency)
	values('001', 'Euro');

insert into andreina_garcia_boggiano.currency
	(id_currency, currency)
	values('002', 'Dolar');

insert into andreina_garcia_boggiano.currency
	(id_currency, currency)
	values('003', 'Yen');

--- TABLA CARS ---

insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('001','001','001','001','79878','AAA656','2010-01-03','100000');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('002','002','002','002','77543','BBC989','2020-10-05','39920');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('003','003','003','003','65352','DDC2939','2021-12-04','80000');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('004','004','004','001','86367','GGL767','2022-02-02','60000');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('005','005','001','002','99674','HFL543','2019-06-04','87677');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('006','006','002','003','48829','DDI873','2017-02-11','643355');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('007','007','003','001','66778','DFJ876','2020-03-21','9983772');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('008','008','004','002','762661','LDF453','2021-07-31','7881819');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('009','009','001','003','877192','FNN0838','2022-01-23','997771');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('010','010','003','004','761883','GGL593','2021-04-10','828163');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('011','011','002','003','853211','LGX846','2019-04-15','90088');
insert into andreina_garcia_boggiano.cars
			(id_car,id_model,id_color,id_insurance_company,id_policy,license_plate,date_purchase,km_total)
			values('012','012','004','001','762661','FGG522','2018-03-3','88876188');
--- TABLA INSURANCE COMPANIES ---

insert into andreina_garcia_boggiano.insurancecompanies
	(id_insurance_company,id_car,insurance_company)
	values('001','001','Mutua Madrilena');

insert into andreina_garcia_boggiano.insurancecompanies
	(id_insurance_company,id_car,insurance_company)
	values('002','002','Mapfre');

insert into andreina_garcia_boggiano.insurancecompanies
	(id_insurance_company,id_car,insurance_company)
	values('003','003','Axa');

--- TABLA INSPECTIONS ---

insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('100000','001','001','150','2022-10-20');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('39920','002','002','142','2022-01-02');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('80000','003','003','14288','2022-08-20');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('60000','004','001','18','2022-12-04');
		
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('87677','005','002','176','2022-07-03');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('643355','006','001','154','2022-09-06');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('9983772','007','001','199','2022-05-08');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('7881819','008','001','268','2022-04-05');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('997771','009','003','765544','2022-12-01');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('828163','010','002','76','2022-09-01');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('90088','011','002','224','2022-09-01');
insert into andreina_garcia_boggiano.inspections
			(km, id_car,id_currency,price,inspection_date)
			values ('88876188','012','001','377','2022-10-21');

		

			
