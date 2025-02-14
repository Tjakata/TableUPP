import 'package:flutter/material.dart';
import 'chatscreen.dart'; 

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 1;
  
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
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index != _currentIndex) {
            switch (index) {
              case 0:
                Navigator.pushReplacementNamed(context, '/available-tables');
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/request-join-table');
                break;
              case 3:
                Navigator.pushReplacementNamed(context, '/profile');
                break;
            }
          }
        },
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
}