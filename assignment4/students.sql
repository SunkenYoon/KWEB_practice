CREATE TABLE students (
	student_ID int not null auto_increment,
    	student_name varchar(20) not null,
	admission_year int not null,
	major varchar(20) not null,
	individual_no int not null,
	phone_no int not null,
	address varchar(100) not null,
	total_credit int not null default 0,
	avg_credit double not null default 0.0,
	is_attending tinyint(1) not null default 1,
	primary key(student_ID) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
