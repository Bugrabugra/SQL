select *
from persons;


--Export data from a table to CSV using COPY statement
copy persons
    to 'C:\tmp\persons_db.csv'
    delimiter ',' csv header;


copy persons (first_name, last_name, email)
    to 'C:\tmp\persons_partial_db.csv'
    delimiter ',' csv header;


copy persons (email)
    to 'C:\tmp\persons_email_db.csv'
    delimiter ',' csv;


--Export data from a table to CSV file using the \copy command
\copy (select * from persons) to 'C:\tmp\persons_client.csv' with csv

