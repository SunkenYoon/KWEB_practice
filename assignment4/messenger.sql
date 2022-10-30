CREATE TABLE users (
	user_id int not null auto_increment,
	user_name varchar(20) not null,
	password varchar(20) not null,
	profile_imgurl varchar(100) not null,
	profile_msg varchar(100) not null,
	is_left tinyint(1) not null default 0,
	date_joined datetime not null,
	primary key (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
	channel_id int not null auto_increment,
	channel_name varchar(50) not null,
	host int not null,
	channel_url varchar(100) not null,
	capacity int not null,
	is_left tinyint(1) not null default 0,
	date_created datetime not null,
	primary key(channel_id),
	foreign key(host) references users(user_id) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE chats (
	chat_id int not null auto_increment,
	message varchar(100) not null,
	writer int not null,
	channel int not null,	
	date_created datetime not null,
	primary key(chat_id),
	foreign key(writer) references users(user_id) on delete cascade,
	foreign key(channel) references channels(channel_id) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
	block_id int not null auto_increment,
	blocked_by int not null,
	blocked_user int not null,	
	date_created datetime not null,
	primary key(block_id),
	foreign key(blocked_by) references users(user_id) on delete cascade,
	foreign key(blocked_user) references users(user_id) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
