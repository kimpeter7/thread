import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivateProfile = false;

  Widget _buildPrivacyItem({
    required IconData icon,
    required String title,
    String? trailing,
    bool showArrow = true,
    bool showDivider = true,
    bool useExternalIcon = false,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 24),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailing != null)
                Text(
                  trailing,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
              if (showArrow && !useExternalIcon)
                const Icon(Icons.chevron_right, color: Colors.grey),
              if (useExternalIcon)
                Icon(Icons.open_in_new, color: Colors.grey[400], size: 20),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey[300],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Privacy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text(
              'Private profile',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Switch(
              value: _isPrivateProfile,
              onChanged: (value) {
                setState(() {
                  _isPrivateProfile = value;
                });
              },
              activeColor: Colors.black,
            ),
          ),
          Divider(height: 1, thickness: 0.5, color: Colors.grey[300]),
          _buildPrivacyItem(
            icon: Icons.alternate_email,
            title: 'Mentions',
            trailing: 'Everyone',
          ),
          _buildPrivacyItem(
            icon: Icons.notifications_off_outlined,
            title: 'Muted',
          ),
          _buildPrivacyItem(
            icon: Icons.visibility_off_outlined,
            title: 'Hidden Words',
          ),
          _buildPrivacyItem(
            icon: Icons.people_outline,
            title: 'Profiles you follow',
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Other privacy settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildPrivacyItem(
            icon: Icons.block_outlined,
            title: 'Blocked profiles',
            useExternalIcon: true,
          ),
          _buildPrivacyItem(
            icon: Icons.favorite_border,
            title: 'Hide likes',
            useExternalIcon: true,
            showDivider: false,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}