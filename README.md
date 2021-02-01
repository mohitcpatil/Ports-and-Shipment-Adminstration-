### Project Abstract - Ports-and-Shipment-Adminstration-

The Port of Baltimore, overseen by the Maryland Port Administration, is one of the biggest commercial shipping hubs in the United States. In 2019, they represented a total of $58 billion in total revenue from imports and exports. Last year, the Port of Baltimore recorded 8.2 billion tons in container cargo going through. This is a good port to study, because our main task involves optimizing the process of container shipping. 

Our Goal: Bring the Port of Baltimore into the 21st century through a digital transformation. We aim for this task to serve as a stepping stone to get the entire United States’ shipping systems to utilize the most up-to-date practices. 

### Project Overview

In this project, you'll apply what you've learned on data modeling with Apache Cassandra and complete an ETL pipeline using Python. To complete the project, you will need to model your data by creating tables in Apache Cassandra to run queries. You are provided with part of the ETL pipeline that transfers data from a set of CSV files within a directory to create a streamlined CSV file to model and insert data into Apache Cassandra tables.

### Datasets

For this project, you'll be working with below dataset:  
- [Approved Ports](https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Data%20Repositories/Approved_Ports.xlsx)
   
   This dataset contains the list of ports approved to receive and ship the products. i.e. port_code, port_code, city, state. 
- [Approved Vendors](https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Data%20Repositories/Approved_Vendors.xlsx)
   
   This dataset contains the list of vendors which are verified and approved to ship the products. i.e.Vendor_name, email. 
- [Vendors](https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Data%20Repositories/Vendors.xlsx)

   This dataset contains the vendors associated with the ports shipping the products. i.e. vendor_name, email, phone, ports.  
- [Ports Domestic](https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Data%20Repositories/Ports_Domestic.xlsx)

   This dataset contains the ports based in the domestic country. i.e. port_code, state, region, timezone. 
- [Port Foreign](https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Data%20Repositories/Ports_Foreign.xlsx)
   
   This dataset contains the ports based in foreign countries. i.e. port_code, state, region, timezone. 
- [Shipment Data](https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Data%20Repositories/Shipment%20Data.xlsx)
   
   This dataset contains all the shipping details of the products. i.e. Date, Time, Origin, Destination.
- [Time Zone UTC Offset](https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Data%20Repositories/country_data.csv)
   
   This dataset contains the timezone of each of the countries/zones listed for ports and shipment. I.e. Timezone, UTC Offset. 

# Project Steps

## Below are steps you can follow to complete each component of this project.

- Modeling your NoSQL database or Apache Cassandra database
- Design tables to answer the queries outlined in the project template
- Write Apache Cassandra CREATE KEYSPACE and SET KEYSPACE statements
- Develop your CREATE statement for each of the tables to address each question
- Load the data with INSERT statement for each of the tables
- Include IF NOT EXISTS clauses in your CREATE statements to create tables only if the tables do not already exist. We recommend you also include DROP TABLE statement for each table, this way you can run drop and create tables whenever you want to reset your database and test your ETL pipeline
- Test by running the proper select statements with the correct WHERE clause

## Build ETL Pipeline

- Implement the logic in section Part I of the notebook template to iterate through each event file in event_data to process and create a new CSV file in Python
- Make necessary edits to Part II of the notebook template to include Apache Cassandra CREATE and INSERT statements to load processed records into relevant tables in your data model
- Test by running SELECT statements after running the queries on your database
