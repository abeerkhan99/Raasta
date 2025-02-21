# Raasta

Raasta is an undergraduate final-year project developed at Habib University to address the issue of rapidly deteriorating road quality in Karachi, Pakistan. We have developed a road surface classification system that uses mobile sensor data to detect potholes and other road surface anomalies, providing their location information through a Flutter web application. The system utilizes a custom CNN-BiLSTM architecture for multi-class classification, leveraging the tri-axial accelerometer, gyroscope, and GPS receiver. The results along with use cases and added functionality are provided through an API hosted on Vercel.

Our website showcasing this work is available at [Raasta](https://raasta-web.web.app/#/), and the code can be found in this GitHub repository. The API is showcased at [API](https://rapidapi.com/AbeerKhan/api/raastaapi) with a tutorial.

_Note: This is a personal repository meant to showcase our project for potential scaling, and it is not meant for reproduction._

## Why Raasta?

Karachi's roads have been continuously neglected due to insufficient funding and mismanagement by local government officials, making it an increasingly challenging and dangerous experience for commuters and transporters alike. This system hopes to significantly improve driver safety and route planning in Karachi and other cities facing inadequate road maintenance. By using this system, officials can effectively allocate resources towards road maintenance and management, reducing the number of accidents and improving road conditions for everyone.

## System Breakdown

Raasta is composed of several components, each designed and implemented by different team members:

1. **Data Collection Application** - Abeer Khan, Akeel Ather Medina 
    - The folder titled [Sensor Application](https://github.com/AkeelMedina22/Raasta/tree/main/Sensor%20Application) contains an Android-based data collection application, developed using Kotlin. This application enables individuals to collect data on their daily commutes, which can provide valuable insights into the current state of road conditions in Karachi. The collected sensor data is transmitted and stored in a non-relational database hosted on Firebase, which serves as a central repository for all the collected sensor data, facilitating easy access and analysis of the data.
    - The sensor data collected includes various road conditions such as potholes, speed breakers, traffic, and poor road quality. The application features a tri-axial accelerometer and gyroscope integration, along with GPS receiver usage to determine the smartphone's location during the commute at specified intervals. These features allow the application to accurately detect the conditions a vehicle is traveling through and its position. API's like SensorManager and FusedLocationProviderClient are utilized in the application.

2. **API** - Akeel Ather Medina, Abeer Khan
   - To access relevant information from the cloud-hosted database, a Flask API is developed and deployed, located at [API](https://github.com/AkeelMedina22/Raasta/tree/main/Website/API). The showcase, along with a tutorial, is available at [RapidAPI](https://rapidapi.com/AbeerKhan/api/raastaapi). Functionality includes a Kd-Tree for nearest neighbor queries, and a configured algorithm for pothole-on-route intersections. Use it to aid in your route-planning!

3. **Website** - Zoha Ovais Karim, Samarah Asghar Sahto, and Abeer Khan
    - In order to facilitate the visualization of the results obtained from the data collected on road anomalies in Karachi, a Flutter-based website has been designed, located at [Website](https://github.com/AkeelMedina22/Raasta/tree/main/Website/Flutter%20Website). This website enables users to view and interact with a map of the city, which displays the results in the form of color-coded markers. The Flask API is responsible for providing the necessary data for the visualization. Through this website, users can generate routes and inspect them by observing the placement of the markers on the map. The markers serve as an indication of the road conditions along the given route, allowing users to make informed decisions regarding their travel plans. 

4. **ML Models** - Akeel Ather Medina
    - To process mobile sensor data into useful road-surface information, a variety of Machine Learning models were applied for multi-class classification. As accelerometer data is a function of time, it can be processed as a signal. A variety of preprocessing techniques were applied to filter and reorient the data, followed by synthetic augmentation using functional principal component analysis. Many ML techniques such as Random Forest, SVM, CNN's were applied, but the best performing model was a residual CNN-BiLSTM. The final results were approximately 86% accuracy on the Deep Learning model, compared to a 68% and 65% for Random Forest and SVM. A research paper based on this model was written and is in the process of being published, and the model is located at [ML Model](https://github.com/AkeelMedina22/Raasta/tree/main/ML%20Model). Post-processing was done using the DBSCAN algorithm.

# Team activity 


## [![Repography logo](https://images.repography.com/logo.svg)](https://repography.com) / Top contributors
[![Top contributors](https://images.repography.com/33913467/AkeelMedina22/Raasta/top-contributors/p8eC7j5-wE7YRiMSMuNr4k0V-HW6zf4A36EYvOBYvjQ/w4jWUd4jQ3hJUFVUIQEXYqrzKXrL--Z7S0h3hbKHQ44_table.svg)](https://github.com/AkeelMedina22/Raasta/graphs/contributors)
