
USE PhoneMarketDB;

CREATE TABLE IF NOT EXISTS phone(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	p_price  INTEGER,
	p_color VARCHAR(20),
	p_category VARCHAR(20),
   	p_modelName VARCHAR(20),
   	p_company VARCHAR(20),
	p_stock LONG,
	p_releaseDate   VARCHAR(20),
	p_fileName  VARCHAR(20),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;

desc phone;

select * from phone;