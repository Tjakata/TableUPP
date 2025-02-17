import 'package:flutter/material.dart';
import 'package:tableupp/tables/available_tables.dart';
import 'bottom_nav.dart';
import 'chats.dart';
import 'package:http/http.dart' as http;

/*class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  // final List<Widget> _pages = [];

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        title: const Text(
          'Activity',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            margin: const EdgeInsets.all(16),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.green,
              tabs: const [
                Tab(text: 'Requests'),
                Tab(text: 'Notifications'),
                Tab(text: 'Messages'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildRequestsTab(),
                _buildNotificationsTab(),
                _buildMessagesTab(),
                // _pages[_selectedIndex],
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onIndexChanged: _onIndexChanged,
        selectedIndex: _selectedIndex, context: context,
      ),
    );
  }

  Widget _buildRequestsTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text('User ${index + 1}'),
          subtitle: const Text(
            'Wants to join your open table\nFor 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024 at 7:30PM',
          ),
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Open',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationsTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 2,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final bool isAccepted = index == 0;
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text('User ${index + 1}'),
          subtitle: Text(
            isAccepted ? 'Request Accepted' : 'Request Declined',
            style: TextStyle(
              color: isAccepted ? Colors.green : Colors.red,
            ),
          ),
          trailing: Icon(
            isAccepted ? Icons.check_circle : Icons.cancel,
            color: isAccepted ? Colors.green : Colors.red,
          ),
        );
      },
    );
  }

  Widget _buildMessagesTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 2,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('User ${index + 1} (Host)'),
            subtitle: const Text('Group messaging'),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.green,
            ),
          ),
        );
      },
    );
  }
}*/



class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  // final List<Widget> _pages = [];

  void _onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> requests = [
    {
      'name': 'Jack Morrison',
      'image': 'assets/images/profiles/Jack Morrison.jpg',
      'status': 'Wants to join your open table',
      'event':
      'For 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024 at 7:30PM',
    },
    {
      'name': 'Ketty Solov',
      'image': 'assets/images/profiles/Ketty Solov.jpg',
      'status': 'Wants to join your open table',
      'event':
      'For 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024 at 7:30PM',
    },
    {
      'name': 'Kelvin Bolt',
      'image': 'assets/images/profiles/Kelvin Bolt.jpg',
      'status': 'Wants to join your open table',
      'event':
      'For 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024 at 7:30PM',
    },
    {
      'name': 'Asante Ngwenya',
      'image': 'assets/images/profiles/Asante Ngwenya.jpg',
      'status': 'Wants to join your open table',
      'event':
      'For 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024 at 7:30PM',
    },
    {
      'name': 'Ashley Ford',
      'image': 'assets/images/profiles/Ashley Ford.jpg',
      'status': 'Will join your open table',
      'event':
      'For 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024 at 7:30PM',
    },
  ];

  final List<Map<String, dynamic>> notifications = [
    {
      'name': 'Ashley Ford',
      'image': 'assets/images/profiles/Ashley Ford.jpg',
      'status': 'Request Accepted',
      'event':
      'You can join the open table for 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024, at 7:30PM',
      'isAccepted': true,
    },
    {
      'name': 'John Snow',
      'image': 'assets/images/profiles/John Snow.jpg',
      'status': 'Request Declined',
      'event':
      'Will not be joining the table for 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024 at 7:30PM',
      'isAccepted': false,
    },
  ];

  final List<Map<String, dynamic>> messages = [
    {
      'name': 'Emma Smith',
      'image': 'assets/images/profiles/Emma Smith.jpg',
      'isHost': true,
      'status': 'Group messaging',
      'event':
      'Open table scheduled for 6 at The Deli Woodstock - Cape Town, SA. 25 April 2024 at 7:30PM',
      'participants': [
        'assets/images/profiles/Jack Morrison.jpg',
        'assets/images/profiles/Ketty Solov.jpg',
        'assets/images/profiles/Kelvin Bolt.jpg',
        'assets/images/profiles/Asante Ngwenya.jpg',
      ],
    },
    {
      'name': 'Ketty Solo',
      'image': 'assets/images/profiles/Ketty Solov.jpg',
      'isHost': true,
      'status': 'Group messaging',
      'event':
      'Open table scheduled for 5 at Azure Restaurant - Cape Town, SA. 14 August 2024, at 7:00PM',
      'participants': ['assets/images/profiles/Ketty Solov.jpg', 'assets/images/profiles/Millen Ford.jpg'],
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
        title: const Text(
          'Activity',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            margin: const EdgeInsets.all(16),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.green,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.green,
              tabs: const [
                Tab(text: 'Requests'),
                Tab(text: 'Notifications'),
                Tab(text: 'Messages'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildRequestsTab(),
                _buildNotificationsTab(),
                _buildMessagesTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onIndexChanged: _onIndexChanged,
        selectedIndex: _selectedIndex, context: context,
      ),
    );
  }

  Widget _buildRequestsTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: requests.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final request = requests[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(request['image']),
          ),
          title: Text(
            request['name'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                request['status'],
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
              Text(
                request['event'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          trailing: request['status'].contains('Will join')
              ? Icon(Icons.check_circle, color: Colors.green)
              : ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Open',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationsTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(notification['image']),
          ),
          title: Text(
            notification['name'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification['status'],
                style: TextStyle(
                  color: notification['isAccepted']
                      ? Colors.green
                      : Colors.red,
                  fontSize: 16,
                ),
              ),
              Text(
                notification['event'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessagesTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(message['image']),
          ),
          title: Text(
            '${message['name']} (Host)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message['status'],
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
              Text(
                message['event'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  ...message['participants']
                      .map((participant) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(participant),
                    ),
                  ))
                      .toList(),
                  if (message['participants'].length < 6)
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey[300],
                      child: Text(
                        '?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                ],
              ),
            ],
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.green,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
          },
        );
      },
    );
  }
}