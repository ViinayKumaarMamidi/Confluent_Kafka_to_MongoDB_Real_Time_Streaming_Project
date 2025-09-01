# Confluent_Kafka_MongoDB_End_to_End_Real_Time_Streaming_Project

This repo contains details about real time streaming implementation using Confluent Cloud Kafka as Source and MongoDB as Sink. Thanks

**Data Flow Details: **

Using Mock Python script to generate Orders and Payments data and ingesting in the Confluent Kafka Topic --> Joining the both datasets using Kafka Streams --> Using the Joined Stream now as Source Kafka Topic --> Set up MongoDB sink connector --> Ingesting the Payments_Orders_Joined Data to MongoDB Collections --> Building Real Time Dashboard using MangoDB Atlas

Total Data from Source: 200 records
Total Data ingested in the MongoDB Collection: 200


**Project Details:** 

1. Set up Confluent Kafka Cluster on the Confluent Cloud
2. Set up required API keys
3. Set up Schema Registry and create topics for orders and payments
4. Spin up ksqlDB and create payments, orders and payments_orders_joined streams as needed
5. Created Producer Code and generate mock data for orders and payments and trigger the code to generate 100 records and compare the data using ksqldb streams
6. Once data is flowing as expected, validate to see for any outstanding issues or error messages
7. Set up MongoDB in the Confluent Cloud Connectors, leverage the required permissions
8. In MongoDB, create new database and new collection and include the details in the Sink Connection details
9. Once Sink is set up, Run your producer code to perform data load and compare the data in the ksqldb streams and in MongoDB collections
10. Once data is flowing real time as expected, in MongoDB please check for the option VISUALIZE YOUR DATA
11. Once the Visualize is selected, pick the collection you have loaded the data and start building the reports
12. Once multiple reports are created, create a new dashboard and include all the reports in the Dashboard
13. Once again, run your producer code to generate 100 more records and validate the total counts in the ksqldb payments_orders_joined stream
14. Validate the total record counts in the MongoDB collection table orders_payments_joined. Counts should match from the ksqldb payments_orders_joined stream with the mcdonalds.orders_payments_joined
15. Validate the total counts in the Dashboard built on the top the table, record counts should match across all layers i.e. 200 records
    

Kafka Streams Data Flow Details: https://github.com/ViinayKumaarMamidi/Confluent_Kafka_to_MongoDB_Real_Time_Streaming_Project/blob/main/Confluent_Streams_Flow_Diagram.PNG

Kafka joined stream topic details: https://github.com/ViinayKumaarMamidi/Confluent_Kafka_to_MongoDB_Real_Time_Streaming_Project/blob/main/Confluent_Producer_MacD_Orders_Payments_Joined_Stream_Topic_Details.PNG


Kafka-to-MongoDB Sink Data validations: https://github.com/ViinayKumaarMamidi/Confluent_Kafka_to_MongoDB_Real_Time_Streaming_Project/blob/main/Confluent_Kafka_to_MongoDB_Sink_Data_Flow_Details.PNG

MongoDB final record counts validations: https://github.com/ViinayKumaarMamidi/Confluent_Kafka_to_MongoDB_Real_Time_Streaming_Project/blob/main/MongoDB_Final_Dataset_Counts.PNG


Project Dashboard using MongoDB: https://github.com/ViinayKumaarMamidi/Confluent_Kafka_to_MongoDB_Real_Time_Streaming_Project/blob/main/McDonalds_Dashboard.pdf

