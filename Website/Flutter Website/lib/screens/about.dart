import 'package:flutter/material.dart';
import 'package:raasta_google_maps/widgets/indicator.dart';
import 'package:raasta_google_maps/widgets/map_with_components.dart';
import 'package:raasta_google_maps/classes/api.dart';
import '../../screens/about.dart';
import '../../screens/docs.dart';
import '../../screens/home.dart';


class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

// inspiration from
// https://smartroadsense.it/project/about/
class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text('ABOUT',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 125,
                                                        letterSpacing: 6,
                                                        fontWeight:
                                                            FontWeight.w800)),
                                                Text('RAASTA',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 124,
                                                        fontWeight:
                                                            FontWeight.w800)),
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(18, 5, 10, 0),
                                                child: Text(
                                                    'Raasta is an undergraduate final-year project developed at Habib University to address the issue of rapidly deteriorating road quality in Karachi, Pakistan. We have developed a road surface classification system that uses mobile sensor data to detect potholes and other road surface anomalies, providing their location information through a geographical map.',
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      fontSize: 34,
                                                      height: 1.3,
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 80),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                  'The system utilizes a custom CNN-BiLSTM architecture for multi-class classification,\n leveraging a tri-axial accelerometer, gyroscope, and GPS receiver.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800)),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0.15),
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Text(
                                                        'OUR APPROACH',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 55,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w800),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: Text(
                                                      'Project Raasta caters to the problem of the unpredictability of Karachi’s road conditions that can severely impact the commuters and drivers of the city. This mainly includes potholes since they make the commuters’ journey unpleasant and can even cause damage to vehicles’ tires, suspensions, and wheels. Whether road damage is due to rainfall or construction in the area, it can be of great inconvenience. Raasta hopes to help you in making route planning more efficient.Our approach for project Raasta is a real-time pothole identification and detection system using mobile sensing technology. Leveraging sensors like the accelerometer, gyroscope, and GPS found in smartphones, road data is collected and used to construct a pothole-detection system. The model used in this project employs a deep-learning strategy to perform multi-class classification to detect the presence of potholes, long segments of roads with bad surfaces, and speedbreakers and provide the corresponding location information of said anomalies to users displayed on the map using APIs.',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Image.asset(
                                        'assets/visualization.png',
                                        width: 300,
                                        height: 300,
                                        fit: BoxFit.contain,  
                                        //fit: BoxFit.fill,                                      
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/clustering.jpg',
                                      width: 300,
                                      height: 300,
                                      //fit: BoxFit.cover,
                                    
                                      fit: BoxFit.contain,                                      
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                              child: Text('DATA AVAILABILITY',
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 55,
                                      fontWeight: FontWeight.w800)),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 520.1,
                              height: 149,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Collected more than',
                                        ),
                                        Text(
                                          '55,000 samples of road data',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Achieved an accuracy of',
                                        ),
                                        Text(
                                          'approximately 85%',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "Have you ever driven on the roads in Karachi and hit a pothole or unexpected speed bump? It can be frustrating and dangerous for drivers and passengers alike. Unfortunately, there is currently no reliable way to locate these road hazards using smartphone sensor technology. This prompted us to construct our own set of data which as of now contains more than 55,000 samples of road data by utilizing an Android application that enlists users' driving-related information. This information is kept in a database where it is simple to access and examine. The smartphone's accelerometer is used to track orientation changes and identify phone motion. The gathered information is arranged in a hierarchical JSON tree structure, with each collection representing a separate tree and each tree being identified by a different session ID. This data may be easily retrieved and analyzed as a result. With this information, we strive to make everyone's travel on Karachi's roadways safer and more convenient.",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 80),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('COLLECT, PROCESS, AND DISPLAY.',
                                style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text('THE TEAM',
                                    style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontSize: 55,
                                        fontWeight: FontWeight.w800)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 10),
                                  child: Container(
                                    width: 250,
                                    height: 250,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/akeel.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text('Akeel Ather Medina',
                                      style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  'Bsc. in Computer Science',
                                ),
                                Text(
                                  'Habib University',
                                ),
                                Text(
                                  'am05427@st.habib.edu.pk',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 10),
                                  child: Container(
                                    width: 250,
                                    height: 250,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/abeer.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text('Abeer Khan',
                                      style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  'Bsc. in Computer Science',
                                ),
                                Text(
                                  'Habib University',
                                ),
                                Text(
                                  'ak05419@st.habib.edu.pk',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 10),
                                  child: Container(
                                    width: 250,
                                    height: 250,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/zoha.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text('Zoha Ovais Karim',
                                      style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  'Bsc. in Computer Science',
                                ),
                                Text(
                                  'Habib University',
                                ),
                                Text(
                                  'zk05617@st.habib.edu.pk',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child: Container(
                                    width: 250,
                                    height: 250,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/samra.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text('Samarah Asghar Sahto',
                                      style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  'Bsc. in Computer Science',
                                ),
                                Text(
                                  'Habib University',
                                ),
                                Text(
                                  'ss05563@st.habib.edu.pk',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
              child: ListView(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      );
  }
}
