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

### Business Goals:
1.	**Answering Pertinent Business Questions Quickly**
In this project, we aim to create a technological architecture that will make it easier for us to know what’s what in our organization. We want to pose questions regarding our logistics, and receive answers that are reliably backed up in a single repository of information. We want a repository that is updated in real-time, and allows for queries at a moment’s notice. 

2.	**Provide Value-Driven Analytics**
We want data visualization tools to be a core aspect of our system architecture. We want these tools to be able to provide easily digestible reporting in order to provide insights into the current state of our organization. Furthermore, we want to utilize our vast swaths of legacy data in order to craft forecasts that will allow us to easily discard outdated business practices while adopting new ones. 

3.	**Public-Private Partnerships**
We strive to utilize the best practices that technology has to offer. We believe we can work directly alongside partners in the private sector to make this transformation possible. Experts in the private sector can bring innovative solutions for public use.

4.	**Bringing Legacy Systems to the 21st Century**
We want a consolidation of our vast swaths of historical records. We aim to bring our legacy data into our new and improved architecture. This will serve as a vital part of our historical analysis.

5.	**Improving Things for ALL our Stakeholders**
It won’t matter if you are an employee of the Port, a logistics company, or any of the parties involved. When the ‘who’, ‘what’, ‘where’, and ‘why’ are reliably outlined in a Data Warehouse, every party involved will benefit financially from an easily accessible repository of information.

6.	**Lay the Groundwork for Semi-Autonomous Operations**
The core goal of this digital transformation is to add components of Data Warehousing and visual analytics tools into our outdated system architecture. But make no mistake, once achieved, these initiatives will serve as the basis of a true Automation Transformation; one where robotics and IoT can utilize our newly improved data repositories to perform tasks with minimal oversight.

                                                                                
Better Analytics
<img src="https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Report/Picture1.png">

Saves Money
<img src="https://github.com/mohitcpatil/Ports-and-Shipment-Adminstration-/blob/master/Report/Picture2.png">


### Data Modeling:
Our proposed schema for our Data Warehouse is illustrated below through our design dictionary, as well as the diagrams for Data Warehouse and the classical ER model in the following pages:

## Database Star Schema Design 

- 	**Fact Table**

■	Shipment_Fact - This table contains the fact and measures in the form of quantity, date and time

- 	**Dimension Tables**

■	Vendor_Dimension - This table contains all the details of the vendor which are associated with shipment fact 

■	Date_Dimension - This table contains a date measure which is an important dimension to know details about shipment.

■	Product_Dimension - This table contains the information about product shipping across the ports.

■	Port_Dimension - This table contains port details with their latitude and longitude.

■	Time_Dimension - Time dimension contains information about the time arrived and departed in the form of hour and minute.

■	Timezone_Dimension - Timezone dimension contains information about the UTC offset to identify the region.













ER Schema
 
DW Schema 










ETL  Implementation:
For the ETL of this project we used Pentaho. We had the source data for this project mocked up through different online tools and Excel beforehand, and then loaded into an ER model. The DW model loaded mostly from the ER model.

The ER Model Load:
 
The Data Warehouse Model Load:
 





Takeaways from Implementation:
During the implementation of this ETL I encountered many issues regarding missing data. And it was only later in the project that I realized Pentaho allowed me to catch errors and divert them to another step, this made debugging the final stages of the transformation much easier.

Another takeaway from this ETL implementation was how working with the highly normalized tables from the ER model for the DW model import resulted in multiple levels of lookup when it came to denormalizing it. To the point that in a larger model using SQL joins would have been much quicker to implement. Another feature that Pentaho lucky supports. 

Feedback from Presentation:
During the presentation one of the relevant things to ETL that was pointed out was that our system was not real time and wasn’t thought out to interact with data flows from Google Analytics or any other ERP system. That is something that we could implement, even in Pentaho still using triggered jobs, but also through other systems.

Another point on ETL that was raised during the presentation was regarding whether it would be hard, or if it would even be possible, to connect new fact tables to the model and change the granularity of the data. While we currently think that wouldn’t be much of a challenge, it is not something we planned extensively for, and in the future we will aim to have our solutions be more modular and expandable in both schema design and Pentaho Job sequences.























Tableau Implementation:

After brainstorming and filtering which charts we would like to include, we decided to split our dashboards into 4 parts. 2 filled with descriptive data, and two filled with prescriptive data, each with their own theme.




































Descriptive Part 1
This first dashboard was about shipping by geographic location. It was filterable by year and either state or country. There were no complaints on this dashboard in specific during the presentation nor any particular issue with it.
 


















Descriptive Part 2
This dashboard was about shipment volume (our fact) as related to dimensions other than purely their location, that included ports, product type, route length(in hours), vendors, shipment amount over time within a given month, and countries over years. For this one our main takeaway ended up being the fact we should have integrated more forecasts into this section. But due to the way we didn’t precalculate fields, Tableau couldn’t generate a forecast.
 


















Predictive Part 1
This dashboard we made about a very relevant lag measure for shipment amounts: trade balance forecast. Assuming there should be a return to the mean in trade, this chart generated making use of Tableau’s trend function is useful to anticipate an upcoming bounceback in trade in 2021.
 



















Predictive Part 2
This dashboard was made to explore an additional scenario with 2021, concerning what the market would look like with different degrees of consolidation. Considering WWIB and Maersk are almost half of our trade volume, it was interesting to see how their growth at the cost of smaller shippers might impact our trade to other ports. This dashboard also received no criticism nor warranted comments from our team.
 

















General Tableau Takeaways
While creating graphs in Tableau three things that quickly became apparent were that: datetime fields would work much better than custom integer fields in time dimensions, patchy data makes generating forecasts much more difficult, and finally it was the point in the project that gave us the clearest vision of what data we would want most for our reports. It never occurred to us to have price data until we got to Tableau, but once we were putting together the dashboards it became painfully clear how helpful it would have been.

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
