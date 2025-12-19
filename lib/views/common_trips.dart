import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel/views/home_screen.dart';

import 'book_now_screen.dart';

class CommonTrips extends StatelessWidget {
  const CommonTrips({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final tripImages = [
      'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w-800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1439066615861-d1af74d74000?w=800&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?w=800&auto=format&fit=crop',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Trip Name', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color:  seconderyColor
        ),
        child: Column(
          children: [

            Expanded(
              child: ListView(
                children: [
                  _buildImageCarousel(tripImages),
                  const SizedBox(height: 20),
                  // Trip Name and Rating
                  _buildTripNameAndRating(),
                  const SizedBox(height: 12),
                  // Description
                  _buildDescription(),
                  // Dates Section
                  _buildDatesSection(),
                ],
              ),
            ),
            _buildButtonsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel(List<String> images) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CarouselSlider(
        options: CarouselOptions(autoPlay: true, height:350,),
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 450,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,

                ),
                child: Image(fit: BoxFit.fill, image: NetworkImage('$i')),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTripNameAndRating() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Mountain Adventure in Swiss Alps',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(width: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(
                  '4.8',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
      child: Text(
        'Experience the breathtaking beauty of the Swiss Alps with this unforgettable mountain adventure. Enjoy scenic hikes, cozy mountain lodges, and stunning views that will leave you in awe.',
        style: TextStyle(fontSize: 16, color: primaryColor, height: 1.5),
      ),
    );
  }

  Widget _buildDatesSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildDateItem(
              icon: Icons.calendar_today,
              title: 'Start Date',
              date: 'June 15, 2024',
              color: Colors.blue,
            ),
            Container(
              width: 1,
              height: 40,
              color: Colors.blue.withOpacity(0.3),
            ),
            _buildDateItem(
              icon: Icons.calendar_today,
              title: 'End Date',
              date: 'June 22, 2024',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateItem({
    required IconData icon,
    required String title,
    required String date,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Booking Button
          Expanded(
            child: ElevatedButton(
              onPressed: () {
Navigator.push(context, MaterialPageRoute(builder:(context) => BookNowScreen(),));              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.confirmation_number, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Book Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Reviews Button
          Container(
            width: 60,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                // Handle reviews
              },
              style: IconButton.styleFrom(padding: const EdgeInsets.all(16)),
              icon: const Icon(Icons.reviews, color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
