create table persons (
    id serial not null,
    first_name character varying(50),
    last_name character varying(50),
    dob date,
    email character varying(255),
    constraint persons_pkey primary key (id)
);


--Import CSV file into a table using COPY statement
copy persons (first_name, last_name, dob, email)
    from 'C:\tmp\Book1.csv' delimiter ',' csv header;