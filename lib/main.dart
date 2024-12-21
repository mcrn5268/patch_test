import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/product_provider.dart';
import './screens/discover_screen.dart';
import './screens/cart_screen.dart';
import './screens/sell_screen.dart';
import './screens/inbox_screen.dart';
import './screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF806cac),
          appBarTheme: AppBarTheme(
            color: Color(0xFF806cac),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Color(0xFF806cac),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    DiscoverScreen(),
    CartScreen(),
    SellScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color(0xFF806cac),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(), 
              spreadRadius: 1, 
              blurRadius: 5, 
              offset: Offset(0, -2), 
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Sell',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox_outlined),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF806cac),
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
