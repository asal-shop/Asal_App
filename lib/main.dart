import 'package:flutter/material.dart';

void main() {
  runApp(const AsalApp());
}

class AsalApp extends StatelessWidget {
  const AsalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASAL Design / Print Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ================= STEP 1: WELCOME SCREEN =================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amber[700],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.print, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const Text(
                'ASAL Design / Print Shop',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'Soo dhowaw! Ku soo dhowaw app-ka rasmiga ah ee ASAL.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainHomeScreen()),
                    );
                  },
                  child: const Text('NEXT', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= STEP 2: MAIN NAVIGATION =================
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final String currentUserEmail = "apaazabdikarim@gmail.com"; 
  final String ownerEmail = "apaazabdikarim@gmail.com"; 

  bool get isOwner => currentUserEmail.trim().toLowerCase() == ownerEmail.trim().toLowerCase();

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreenTab(),
      const ProfileScreenTab(),
      const ChatsScreenTab(),
      if (isOwner) const AdminOrdersTab(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          const BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          if (isOwner)
            const BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'DALAB'),
        ],
      ),
    );
  }
}

// ---------- 1. HOME TAB ----------
class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Q',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['Qalin', 'Buug', 'Daawo', 'Xaradh'].map((cat) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Chip(
                      label: Text(cat),
                      backgroundColor: Colors.amber[100],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(child: Text('Sawir Shey')),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text('Magac Shey', style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('Qiimo: \$1.00', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
                          const Text('Tiro xaddidan', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- 2. PROFILE TAB ----------
class ProfileScreenTab extends StatelessWidget {
  const ProfileScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.account_circle, size: 40, color: Colors.amber),
            title: Text('Name Profile', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('apaazabdikarim@gmail.com'),
          ),
          Divider(),
          ListTile(leading: Icon(Icons.edit), title: Text('Profile Change')),
          ListTile(leading: Icon(Icons.home_outlined), title: Text('Home Change')),
          ListTile(leading: Icon(Icons.phone), title: Text('Phone Change')),
          ListTile(leading: Icon(Icons.text_fields), title: Text('Name Change')),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
        ],
      ),
    );
  }
}

// ---------- 3. CHATS TAB ----------
class ChatsScreenTab extends StatelessWidget {
  const ChatsScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qeybta Xiriirka'),
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.chat),
              label: const Text('Now Chats'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.amber[700],
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.message),
              label: const Text('WhatsApp'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.green[600],
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.blue),
                title: Text('25261xxxxxx'),
                subtitle: Text('Khadaamada Macaamiisha 1'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.blue),
                title: Text('25261xxxxxx'),
                subtitle: Text('Khadaamada Macaamiisha 2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- 4. DALAB (ADMIN ONLY TAB) ----------
class AdminOrdersTab extends StatelessWidget {
  const AdminOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qeybta DALAB (Mulkiilaha)'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.shopping_basket, color: Colors.white),
              ),
              title: Text('Dalabka #${index + 101}', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Dalabka Home/Products ka soo gudbay'),
              trailing: const Text('\$15.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green)),
            ),
          );
        },
      ),
    );
  }
}
