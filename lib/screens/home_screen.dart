import 'package:flutter/material.dart';
import 'package:job_explorer/api/api.dart';
import 'package:job_explorer/components/vacancy_card.dart';
import 'vacancy_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, dynamic>>> _vacancies;

  @override
  void initState() {
    super.initState();
    _vacancies = ApiService().fetchVacancies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF80EFDE),
        actions: [
          IconButton(
            visualDensity: VisualDensity(horizontal: -4.0, vertical: 0),
            icon: Icon(Icons.notifications),
            onPressed: () {},
            padding: EdgeInsets.zero,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: IconButton(
              visualDensity: VisualDensity(horizontal: -3.0, vertical: 0),
              icon: Icon(Icons.settings),
              onPressed: () {},
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xFF80EFDE),
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 16.0, 16.0),
                width: double.infinity,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Mazen AlAli',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Expanded(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _vacancies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No vacancies available.'));
                    } else {
                      final vacancies = snapshot.data!;
                      return ListView.builder(
                        itemCount: vacancies.length,
                        itemBuilder: (context, index) {
                          final vacancy = vacancies[index];
                          return VacancyCard(
                            title: vacancy['title'] ?? '',
                            company: vacancy['company'] ?? '',
                            description: vacancy['description'] ?? '',
                            date: vacancy['date_posted'] ?? '',
                            imageUrl: vacancy['image_url'] ?? '',
                            vacancy: vacancy,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VacancyDetailsScreen(
                                      vacancyDetails: vacancy),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 80,
            left: 16.0,
            right: 16.0,
            child: Container(
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search vacancies, companies ... etc',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
