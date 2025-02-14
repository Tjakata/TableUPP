import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        title: const Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildParticipantAvatar('images/Emma Smith.jpg'),
                        const SizedBox(width: 8),
                        _buildParticipantAvatar('images/Ketty Solov.jpg'),
                        const SizedBox(width: 8),
                        _buildParticipantAvatar('images/Kelvin Bolt.jpg'),
                        const SizedBox(width: 8),
                        _buildParticipantAvatar('images/Ashley Ford.jpg'),
                        const SizedBox(width: 8),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: const Icon(Icons.question_mark, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilesScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Profiles >',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Deli Woodstock, Cape Town',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '25 June 2024, 7:30PM',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildHostInfo(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatMessage(
                  sender: 'Emma Smith',
                  message: 'Hello to all of you! My name is John and its a pleasure to meet everyone. Maybe we can start by introducing each other.',
                  time: '09:30AM',
                  isHost: true,
                ),
                ChatMessage(
                  sender: 'Ketty Solov',
                  message: 'Hi every my name is Ketty Solov, im a Ukrainian, a mom and also a Freelance Digital content writer. Its great to be here',
                  time: '10:30AM',
                ),
                ChatMessage(
                  sender: 'Kelvin Bolt',
                  message: 'Hi, im Kelvin Bolt, from New York. Its nice to meet everyone and look forward to the meetup.',
                  time: '10:45AM',
                ),
                ChatMessage(
                  sender: 'Ashley Ford',
                  message: 'Good day everyone, im Ashley Ford from France. I just landed now and feeling a bit sleepy right now. Will respond a bit later.',
                  time: '10:52AM',
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildParticipantAvatar(String imagePath) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHostInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/Emma Smith.jpg'),
            radius: 20,
          ),
          const SizedBox(width: 12),
          const Text(
            'Emma Smith is the host of this table',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
            color: Colors.grey,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type something...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;
  final String time;
  final bool isHost;

  const ChatMessage({
    Key? key,
    required this.sender,
    required this.message,
    required this.time,
    this.isHost = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                sender,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              if (isHost) ...[
                const SizedBox(width: 8),
                const Text(
                  '- Host',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}


class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        title: const Text(
          'Profiles',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '4/6 Participants of this table',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ParticipantTile(
                  name: 'Ketty Solov',
                  location: 'Kyiv, Ukraine',
                  imagePath: 'images/Ketty Solov.jpg',
                ),
                ParticipantTile(
                  name: 'Kelvin Bolt',
                  location: 'San Francisco, USA',
                  imagePath: 'images/Kelvin Bolt.jpg',
                ),
                ParticipantTile(
                  name: 'Ashley Ford',
                  location: 'Lion, France',
                  imagePath: 'images/Ashley Ford.jpg',
                ),
                ParticipantTile(
                  name: 'Asante Ngweya',
                  location: 'Johannesburg, SA',
                  imagePath: 'images/Asante Ngwenya.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Available Tables',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
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
      ),
    );
  }
}

class ParticipantTile extends StatelessWidget {
  final String name;
  final String location;
  final String imagePath;

  const ParticipantTile({
    Key? key,
    required this.name,
    required this.location,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ProfilesScreen())
                );

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Profile >',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}