import 'package:flutter/material.dart';

class VacancyDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> vacancyDetails;

  VacancyDetailsScreen({required this.vacancyDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          forceMaterialTransparency: true,
          title: Text('Job Details'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Image.network(
              vacancyDetails['image_url'] ?? 'https://via.placeholder.com/400',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vacancyDetails['title'] ?? 'No Title',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  vacancyDetails['location'] ?? 'No Location',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  vacancyDetails['date_posted'] ?? 'No Date',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Color(0xFF80EFDE),
                    tabs: [
                      Tab(text: 'Description'),
                      Tab(text: 'Company'),
                      Tab(text: 'Salary'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Text(
                              vacancyDetails['long_description'] ??
                                  vacancyDetails['description'] ??
                                  'No Description Available',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            vacancyDetails['company'] ??
                                'No Company Information Available',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            vacancyDetails['salary'] ??
                                'Salary Information Not Available',
                            style: TextStyle(fontSize: 16.0),
                          ),
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
    );
  }
}
