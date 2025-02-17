import 'package:flutter/material.dart';

void main() {
  runApp(RequestToJoinTableApp());
}

class RequestToJoinTableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RequestToJoinTableScreen(),
    );
  }
}

class RequestToJoinTableScreen extends StatefulWidget {
  @override
  _RequestToJoinTableScreenState createState() => _RequestToJoinTableScreenState();
}

class _RequestToJoinTableScreenState extends State<RequestToJoinTableScreen> {
  bool showDetails = true;
  bool showPictures = true;
  final PageController _pageController = PageController(initialPage: 0); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF00D778),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          "TableUPP",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart, color: Color(0xFF00D778)),
            label: "Available Tables",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail, color: Colors.grey),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40, color: Color(0xFF00D778)),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.grey),
            label: "Settings",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF00D778),
        unselectedItemColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Image and Profile
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/restaurant_dine.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 60), // Space for overlapping avatar
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("images/Ashley Ford.jpg"),
                    ),
                  ),
                ),
              ],
            ),

            // Profile Info
            Text(
              "Ashley Ford",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.work, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text("Accountant", style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text("Cape Town, SA", style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.table_chart, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text("2 Tables Created", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Icon(Icons.group, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text("5 Tables Joined", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // Toggle Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showDetails = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: showDetails ? Color(0xFF00D778) : Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: Text("Details", 
                    style: TextStyle(color: showDetails ? Colors.white : Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showDetails = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !showDetails ? Color(0xFF00D778) : Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: Text("Gallery",
                    style: TextStyle(color: !showDetails ? Colors.white : Colors.black),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            if (showDetails) ...[
              
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF00D778),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "Places",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: (_pageController.hasClients && _pageController.page == 0) ? Colors.white : Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "Topics",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: (_pageController.hasClients && _pageController.page == 1) ? Colors.white : Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // PageView for Places and Topics
                    Container(
                      height: 200, // Adjust height as needed
                      child: PageView(
                        controller: _pageController,
                        children: [
                          // Places Section
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              PlaceChip("Kariba Restaurant, Cape Town"),
                              PlaceChip("Mantra Cafe, Cape Town"),
                              PlaceChip("Four season Hotel Inn, Milan"),
                              PlaceChip("Zappa Cafe, Kiev"),
                              PlaceChip("Bistro 1682, Cape Town"),
                            ],
                          ),

                          // Topics Section
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              TopicChip("Wine"),
                              TopicChip("Jazz"),
                              TopicChip("Swimming"),
                              TopicChip("Artists"),
                              TopicChip("Italian food"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              // Gallery Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showPictures = true;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.photo_library,
                          color: showPictures ? Color(0xFF00D778) : Colors.grey,
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 2,
                          width: 40,
                          color: showPictures ? Color(0xFF00D778) : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showPictures = false;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(Icons.videocam,
                          color: !showPictures ? Color(0xFF00D778) : Colors.grey,
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 2,
                          width: 40,
                          color: !showPictures ? Color(0xFF00D778) : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Gallery Grid
              if (showPictures)
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: List.generate(4, (index) => 
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/food_1${index + 1}.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              else
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: List.generate(2, (index) => 
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/food_1${index + 1}.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Icon(Icons.play_circle_fill, 
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class PlaceChip extends StatelessWidget {
  final String label;
  PlaceChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class TopicChip extends StatelessWidget {
  final String label;
  TopicChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}