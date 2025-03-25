import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Activity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Activity Categories
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _CategoryButton(
                  label: 'All',
                  isSelected: true,
                ),
                _CategoryButton(
                  label: 'Replies',
                  isSelected: false,
                ),
                _CategoryButton(
                  label: 'Mentions',
                  isSelected: false,
                ),
                _CategoryButton(
                  label: 'Verified',
                  isSelected: false,
                ),
              ],
            ),
          ),
          // Activity List
          Expanded(
            child: ListView(
              children: [
                ActivityListItem(
                  username: 'john_mobbin',
                  content: 'Mentioned you',
                  message: "Here's a thread you should follow if you love botany @jane_mobbin",
                  timeAgo: '4h',
                  iconColor: Colors.green,
                  icon: Icons.alternate_email,
                ),
                ActivityListItem(
                  username: 'john_mobbin',
                  content: 'Starting out my gardening club with thr...',
                  message: "Count me in!",
                  timeAgo: '4h',
                  iconColor: Colors.blue,
                  icon: Icons.reply,
                ),
                ActivityListItem(
                  username: 'the.plantdads',
                  content: 'Followed you',
                  timeAgo: '5h',
                  iconColor: Colors.purple,
                  icon: Icons.person_add,
                  showFollowButton: true,
                ),
                ActivityListItem(
                  username: 'the.plantdads',
                  content: 'Definitely broken! 🧵👀🌱',
                  timeAgo: '5h',
                  iconColor: Colors.red,
                  icon: Icons.favorite,
                ),
                ActivityListItem(
                  username: 'theberryjungle',
                  content: '🌱👀🧵',
                  timeAgo: '5h',
                  iconColor: Colors.red,
                  icon: Icons.favorite,
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

class _CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _CategoryButton({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? Colors.black : Colors.grey[300]!,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ActivityListItem extends StatelessWidget {
  final String username;
  final String content;
  final String? message;
  final String timeAgo;
  final Color iconColor;
  final IconData icon;
  final bool showFollowButton;

  const ActivityListItem({
    Key? key,
    required this.username,
    required this.content,
    this.message,
    required this.timeAgo,
    required this.iconColor,
    required this.icon,
    this.showFollowButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image with Icon
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: iconColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    icon,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Content
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
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      content,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                if (message != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    message!,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  timeAgo,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Follow Button
          if (showFollowButton)
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
                'Following',
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