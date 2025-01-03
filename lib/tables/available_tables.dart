import 'package:flutter/material.dart';

class AvailableTableScreen extends StatefulWidget {
  const AvailableTableScreen({super.key});

  @override
  State<AvailableTableScreen> createState() => _AvailableTablesScreen();
}

class _AvailableTablesScreen extends State<AvailableTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Available Tables'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      child: SizedBox(
                        height: 200, // Adjust height as needed
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'images/restaurant_dine.jpg',
                              // Path to the image in assets folder
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              bottom: 40,
                              left: 16,
                              right: 16,
                              child: Column(
                                children: [
                                  Text(
                                    'Choose your table topics',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Step 1',
                                        style: TextStyle(
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      Text(
                                        'Step 2',
                                        style: TextStyle(
                                          color: Colors.greenAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Step 3',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.greenAccent,
                                    thickness: 2,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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

class CategoryCard extends StatelessWidget {
  final TableCategory category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            category.imagePath,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  category.icon,
                  color: Colors.white,
                  size: 32,
                ),
                SizedBox(height: 10),
                Text(
                  category.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Mock Data
class TableCategory {
  final String name;
  final IconData icon;
  final String imagePath;

  TableCategory(
      {required this.name, required this.icon, required this.imagePath});
}

final List<TableCategory> tableCategories = [
  TableCategory(
      name: 'Dinner Tables',
      icon: Icons.restaurant,
      imagePath: 'assets/dinner.jpg'),
  TableCategory(
      name: 'Lunch Tables',
      icon: Icons.lunch_dining,
      imagePath: 'assets/lunch.jpg'),
  TableCategory(
      name: 'Drinks Only',
      icon: Icons.local_bar,
      imagePath: 'assets/drinks.jpg'),
  TableCategory(
      name: 'Mixed Tables',
      icon: Icons.restaurant_menu,
      imagePath: 'assets/mixed.jpg'),
  TableCategory(
      name: 'Women Only', icon: Icons.woman, imagePath: 'assets/women.jpg'),
  TableCategory(name: 'Men Only', icon: Icons.man, imagePath: 'assets/men.jpg'),
];

final List<String> tableTopics = [
  'Fashion & Beauty',
  'Sports',
  'Arts & Culture',
  'Politics',
  'Business & Finance',
  'Food',
];
