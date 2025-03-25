import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const InstagramSearchScreen(),
    );
  }
}

class InstagramSearchScreen extends StatelessWidget {
  const InstagramSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          // Profile List
          Expanded(
            child: ListView(
              children: const [
                ProfileListItem(
                  username: 'rjmithun',
                  displayName: 'Mithun',
                  followers: '26.6K',
                  imageUrl: 'assets/mithun.jpg',
                  isVerified: true,
                ),
                ProfileListItem(
                  username: 'vicenews',
                  displayName: 'VICE News',
                  followers: '301K',
                  imageUrl: 'assets/vice.jpg',
                  isVerified: true,
                ),
                ProfileListItem(
                  username: 'trevornoah',
                  displayName: 'Trevor Noah',
                  followers: '789K',
                  imageUrl: 'assets/trevor.jpg',
                  isVerified: true,
                ),
                ProfileListItem(
                  username: 'condenasttraveller',
                  displayName: 'Condé Nast Traveller',
                  followers: '130K',
                  imageUrl: 'assets/traveller.jpg',
                  isVerified: true,
                ),
                ProfileListItem(
                  username: 'chef_pillai',
                  displayName: 'Suresh Pillai',
                  followers: '69.2K',
                  imageUrl: 'assets/chef.jpg',
                  isVerified: true,
                ),
                ProfileListItem(
                  username: 'malala',
                  displayName: 'Malala Yousafzai',
                  followers: '237K',
                  imageUrl: 'assets/malala.jpg',
                  isVerified: true,
                ),
                ProfileListItem(
                  username: 'sebin_cyriac',
                  displayName: 'Fishing_freaks',
                  followers: '53.2K',
                  imageUrl: 'assets/fishing.jpg',
                  isVerified: true,
                ),
              ],
            ),
          ),
          // Bottom Navigation Bar
        ],
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final String username;
  final String displayName;
  final String followers;
  final String imageUrl;
  final bool isVerified;

  const ProfileListItem({
    Key? key,
    required this.username,
    required this.displayName,
    required this.followers,
    required this.imageUrl,
    required this.isVerified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Profile Image
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(width: 12),
          // Profile Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    if (isVerified)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.verified,
                          size: 14,
                          color: Colors.blue[400],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  displayName,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$followers followers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Follow Button
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(80, 32),
            ),
            child: const Text(
              'Follow',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}