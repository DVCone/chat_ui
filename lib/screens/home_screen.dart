import 'package:chatui/widgets/category_selector.dart';
import 'package:chatui/widgets/favorite_contacts.dart';
import 'package:chatui/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,

      // AppBar
      appBar: AppBar(
        // Menu Icon
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
        ),

        // Center Title
        centerTitle: true,
        title: const Text(
          "Chat Ui",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,

        // Search Icon
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
          ),
        ],
      ),

      // Body
      body: Column(
        children: [

          // Categories Section
          const CategorySelector(),

          // Main Body Section
          Expanded(
            child: Container(
              height: 500.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: const [
                  // Favorites Section
                  FavoriteContacts(),

                  // chat List Section
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
