import 'package:flutter/material.dart';

class VacancyCard extends StatelessWidget {
  final String title;
  final String company;
  final String description;
  final String date;
  final String imageUrl;
  final Map<String, dynamic> vacancy;
  final Function onTap;

  VacancyCard({
    required this.title,
    required this.company,
    required this.description,
    required this.date,
    required this.imageUrl,
    required this.vacancy,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    print(
        'Title: $title, Company: $company, Description: $description, Date: $date, ImageURL: $imageUrl');

    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(12.0),
      child: Card(
        color: Color(0xFF80EFDE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl.isNotEmpty
                      ? imageUrl
                      : 'https://via.placeholder.com/100',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.isNotEmpty ? title : 'No Title',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      company.isNotEmpty ? company : 'No Company',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      date.isNotEmpty ? date : 'No Date',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      description.isNotEmpty ? description : 'No Description',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
