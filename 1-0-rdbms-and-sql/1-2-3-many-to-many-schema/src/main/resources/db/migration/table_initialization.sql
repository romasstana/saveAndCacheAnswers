/*

WallStreet database should store information about brokers, sales groups and its relations.

Each broker must have a unique username. First and last names are also mandatory.

A sales group is a special group that has its own restrictions. Sale groups are used to organize the work of brokers.
Each group mush have a unique name, transaction type (string), and max transaction amount (a number). All field are
mandatory.

A sales group can consists of more than one broker, while each broker can be associated with more than one sale group.


-- TODO: write SQL script to create a database tables according to the requirements
 */
CREATE TABLE broker(
    id Bigint not null,
    username varchar(255) not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    CONSTRAINT PK_broker primary key (id),
    CONSTRAINT UQ_broker_username UNIQUE (username)
);
CREATE TABLE sales_group(
    id Bigint,
    name varchar(255) not null,
    transaction_type varchar(255) not null,
    max_transaction_amount Bigint not null,
    CONSTRAINT PK_sales_group PRIMARY KEY (id),
    CONSTRAINT UQ_sales_group_name UNIQUE (name)
);
CREATE TABLE broker_sales_group(
    broker_id Bigint NOT NULL,
    sales_group_id Bigint NOT NULL,
    CONSTRAINT PK_broker_sales_group PRIMARY KEY (broker_id, sales_group_id),
    CONSTRAINT FK_broker_sales_group_broker FOREIGN KEY (broker_id) REFERENCES broker(id),
    CONSTRAINT FK_broker_sales_group_sales_group FOREIGN KEY (sales_group_id) REFERENCES sales_group(id)
);