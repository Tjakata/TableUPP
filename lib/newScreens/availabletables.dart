import 'package:flutter/material.dart';

class AvailableTablesPage extends StatelessWidget {
  const AvailableTablesPage({super.key});

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
          ],
        ),
      ),
         bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Available Tables',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

  Widget _buildHeader() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/restaurant_dine.jpg'),
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
                      onPressed: () {},
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
              'images/restaurant_dine.jpg'
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _buildCategoryCard(
                  'Lunch Tables',
                  Icons.lunch_dining,
                  'images/restaurant_dine.jpg',
                  smallCard: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildCategoryCard(
                  'Drinks Only',
                  Icons.local_bar,
                  'images/restaurant_dine.jpg',
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
              'images/restaurant_dine.jpg',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _buildCategoryCard(
                  'Women Only',
                  Icons.female,
                  'images/restaurant_dine.jpg',
                  smallCard: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildCategoryCard(
                  'Men Only',
                  Icons.male,
                  'images/restaurant_dine.jpg',
                  smallCard: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  

Widget _buildCategoryCard(String title, IconData icon, String imagePath, {bool smallCard = false}) {
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
