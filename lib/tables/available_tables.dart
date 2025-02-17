import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../profile_screens/create_profile.dart';
import '../utils/bottom_nav.dart';
import '../utils/pick_date.dart';


class AvailableTablesScreen extends StatefulWidget {
  const AvailableTablesScreen({Key? key}) : super(key: key);

  @override
  State<AvailableTablesScreen> createState() => _AvailableTablesScreenState();
}

class _AvailableTablesScreenState extends State<AvailableTablesScreen> {

  Timer? _timer;
  int _selectedIndex = 0;

  // final List<Widget> _pages = [];

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of widgets for the different screens


  @override
  void initState() {
    super.initState();
    // Start a timer for 1 minute (60 seconds)
    _timer = Timer(Duration(seconds: 10), _showProfileCreationDialog);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _showProfileCreationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Rounded corners for the dialog
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ensure the dialog doesn't take up too much space
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 50,
                  // backgroundImage: AssetImage('assets/images/profiles/person.png') // Add your profile avatar image
                ),
                SizedBox(height: 16),
                Text(
                  'Create Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Later',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileCreationScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildCategorySection(),
            _buildTrendingTopicsSection(),
            // _pages[_selectedIndex],
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        onIndexChanged: _onIndexChanged,
        selectedIndex: _selectedIndex, context: context,
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    height: 200,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/tables/Mixed table.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Tables',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by location...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => DatePickerScreen()),
                      // );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCategorySection() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          child: _buildCategoryCard(
              'Dinner Tables',
              Icons.restaurant_menu,
              'assets/images/tables/Dinner table image 1.jpg'
          ),
        ),
        Row(
          children: [
            Expanded(
              child: _buildCategoryCard(
                'Lunch Tables',
                Icons.lunch_dining,
                'assets/images/tables/Lunch table image.jpg',
                smallCard: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildCategoryCard(
                'Drinks Only',
                Icons.local_bar,
                'assets/images/tables/Drinks only image.jpg',
                smallCard: true,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: _buildCategoryCard(
            'Mixed Tables',
            Icons.people,
            'assets/images/tables/Mixed table.jpg',
          ),
        ),
        Row(
          children: [
            Expanded(
              child: _buildCategoryCard(
                'Women Only',
                Icons.female,
                'assets/images/tables/Women only image.jpg',
                smallCard: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildCategoryCard(
                'Men Only',
                Icons.male,
                'assets/images/tables/Men only image.jpg',
                smallCard: true,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget _buildCategoryCard(String title, IconData icon, String imagePath,
    {bool smallCard = false}) {
  return Container(
    height: smallCard ? 120 : 180,
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.7),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: TextButton(
          onPressed: () {
            // Add navigation logic here
            print('Navigating to $title tables');
            // Example navigation:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => TableListPage(category: title),
            //   ),
            // );
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(4),
            backgroundColor: const Color.fromARGB(0, 13, 182, 21),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildTrendingTopicsSection() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Trending Table Topics',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            _buildTopicChip('Fashion & Beauty', Icons.face),
            _buildTopicChip('Sports', Icons.sports_basketball),
            _buildTopicChip('Arts & Culture', Icons.palette),
            _buildTopicChip('Politics', Icons.gavel),
            _buildTopicChip('Business & Finance', Icons.business),
            _buildTopicChip('Food', Icons.restaurant),
          ],
        ),
      ],
    ),
  );
}

Widget _buildTopicChip(String label, IconData icon) {
  return Chip(
    backgroundColor: Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}
