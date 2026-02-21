CREATE TABLE IF NOT EXISTS address(
	address_id serial primary key,
	street_line1 text not null,
	street_line2 text,
	postal_code text not null,
	city text not null,
	state_province text,
	country_code text not null
);

CREATE TABLE IF NOT EXISTS customer(
	customer_id serial primary key,
	address_id integer references address(address_id),
	first_name text not null,
	last_name text not null,
	date_of_birth timestamp not null,
	gender text
);

CREATE TABLE IF NOT EXISTS order_return(
	return_id serial primary key,
	customer_id integer references customer(customer_id),
	is_approved boolean not null,
	datetime timestamptz not null
);

CREATE TABLE IF NOT EXISTS department(
	department_id serial primary key,
	dep_name text not null
);

CREATE TABLE IF NOT EXISTS employee(
	employee_id serial primary key,
	department_id integer references department(department_id),
	first_name text not null,
	last_name text not null,
	date_of_birth timestamp not null
);

CREATE TABLE IF NOT EXISTS orders(
	order_id serial primary key,
	datetime timestamptz not null,
	is_successful boolean not null
);

CREATE TABLE IF NOT EXISTS payment(
	payment_id serial primary key,
	order_id integer references orders(order_id),
	amount integer not null,
	currency text not null,
	datetime timestamptz not null,
	is_successful boolean not null
);

CREATE TABLE IF NOT EXISTS product(
	product_id serial primary key,
	model text not null,
	version_code text
);

CREATE TABLE IF NOT EXISTS supplier(
	supplier_id serial primary key,
	supp_name text
);

CREATE TABLE IF NOT EXISTS supplyAgreement(
	agreement_id serial primary key,
	supplier_id integer references supplier(supplier_id),
	from_date timestamptz not null,
	to_date timestamptz not null
);

CREATE TABLE IF NOT EXISTS firmware(
	firmware_id serial primary key,
	product_id integer references product(product_id),
	version text not null
);

CREATE TABLE IF NOT EXISTS developmentParticipation(
	dp_id serial primary key,
	employee_id integer references employee(employee_id),
	firmware_id integer references firmware(firmware_id),
	status text not null,
	from_date timestamptz not null,
	to_date timestamptz not null
);

CREATE TABLE IF NOT EXISTS firmwareInstall(
	firmware_install_id serial primary key,
	employee_id integer references employee(employee_id),
	serial_id integer references deviceUnit(serial_id),
	install_date timestamptz not null,
	status text not null
);

CREATE TABLE IF NOT EXISTS deviceUnit(
	serial_id serial primary key,
	product_id integer references product(product_id),
	installed_firmware_id integer references firmwareInstall(firmware_install_id),
	order_id integer references orders(order_id),
	return_id integer references order_return(return_id),
	agreement_id integer references supplyAgreement(agreement_id),
	stock integer not null
);