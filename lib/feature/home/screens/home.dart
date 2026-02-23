import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// Import your theme

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // Tracks which tab is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Top App Bar
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back,",
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
            const Text(
              "Alex Johnson", // We will make this dynamic later
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 2. The Body (Just a placeholder for now)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bolt, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              "Dashboard Content Goes Here",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),

      // 3. Bottom Navigation Bar (Matches your PDF Design)
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.all(20),
        itemPadding: EdgeInsets.all(18),
        curve: Curves.easeInOut,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.bar_chart),
            title: const Text("Analytics"),
            selectedColor: Colors.green,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.energy_savings_leaf),
            title: const Text("Energy Tips"),
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text("Settings"),
            selectedColor: Colors.orange,
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
