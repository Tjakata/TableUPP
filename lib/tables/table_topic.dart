import 'package:flutter/material.dart';
import '../profile_screens/create_profile.dart';

class TableTopicsScreen extends StatefulWidget
{
  const TableTopicsScreen({super.key});

  @override
  State<TableTopicsScreen> createState() => _TableTopicsScreen();
}

class _TableTopicsScreen extends State<TableTopicsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 40.0),
          onPressed: () {
            // Back navigation
            Navigator.push(context, MaterialPageRoute(builder: (c)=> const ProfileCreationScreen()));
          },
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image and Stepper with boarders
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
                              'images/restaurant_dine.jpg', // Path to the image in assets folder
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Search bar
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                const Icon(Icons.search_rounded, color: Colors.black54),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search for topics',
                                      hintStyle: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.cancel_rounded, color: Colors.black54),
                                  onPressed: () {
                                    // Clear the search
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Topics Section
                          const Row(
                            children: [
                              Icon(Icons.wine_bar_outlined),
                              SizedBox(width: 8),
                              Text(
                                'Your table topics',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // List of topics with removable buttons
                          Wrap(
                            spacing: 10,
                            children: [
                              Chip(
                                label: const Text('Travel'),
                                onDeleted: () {
                                  // Remove travel topic
                                },
                                
                              ),

                              Chip(
                                label: const Text('Music'),
                                onDeleted: () {
                                  // Remove music topic
                                },
                              ),

                              Chip(
                                label: const Text('Technology'),
                                onDeleted: () {
                                  // Remove technology topic
                                },
                              ),

                              Chip(
                                label: const Text('Graphic design'),
                                onDeleted: () {
                                  // Remove graphic design topic
                                },
                              ),

                              Chip(
                                label: const Text('Italian food'),
                                onDeleted: () {
                                  // Remove Italian food topic
                                },
                              ),
                
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // Back and Next Buttons
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
                          OutlinedButton(
                            onPressed: () {
                              // Handle back action
                              Navigator.push(context, MaterialPageRoute(builder: (c)=> const ProfileCreationScreen()));
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 32,
                              ),
                              side: const BorderSide(color: Colors.grey),
                            ),
                            child: const Text(
                              'Back',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                          // Next Button
                          ElevatedButton(
                            onPressed: () {
                              // Handle next action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 32,
                              ),
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
