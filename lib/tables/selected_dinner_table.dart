import 'package:flutter/material.dart';

class SelectedDinnerTableScreen extends StatefulWidget {
  @override
  _SelectedDinnerTableScreenState createState() =>
      _SelectedDinnerTableScreenState();
}

class _SelectedDinnerTableScreenState extends State<SelectedDinnerTableScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/tables/Dinner table image 3.jpg',
                      // Replace with your image path
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 10,
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.white),
                        SizedBox(width: 10),
                        Icon(Icons.location_on_outlined, color: Colors.white),
                        SizedBox(width: 10),
                        Icon(Icons.save_outlined, color: Colors.white),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Dell Woodstock',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cape Town',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '25 June',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Dinner 7:30 PM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 10,
                    child: Text(
                      '5/6',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Table Host',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profiles/Emma Smith.jpg'),
                      ),
                      title: Text('Emma Smith'),
                      subtitle: Text('Cape Town, South Africa'),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Table Guests',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ..._buildGuestList(),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child:
                            const Text('Send Request', style: TextStyle(fontSize: 18)),
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
  }
}

List<Widget> _buildGuestList() {
  List<Map<String, String>> guests = [
    {
      'name': 'Asante Ngwenya',
      'location': 'Johannesburg, SA',
      'image': 'assets/images/profiles/Asante Ngwenya.jpg'
    },
    {
      'name': 'Ketty Solov',
      'location': 'Kyiv, Ukraine',
      'image': 'assets/images/profiles/Ketty Solov.jpg'
    },
    {
      'name': 'Ashley Ford',
      'location': 'San Francisco, USA',
      'image': 'assets/images/profiles/Ashley Ford.jpg'
    },
    {
      'name': 'Kelvin Bolt',
      'location': 'San Francisco, USA',
      'image': 'assets/images/profiles/Kelvin Bolt.jpg'
    },
  ];

  return guests
      .map((guest) => ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(guest['image']!),
            ),
            title: Text(guest['name']!),
            subtitle: Text(guest['location']!),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ))
      .toList();
}
