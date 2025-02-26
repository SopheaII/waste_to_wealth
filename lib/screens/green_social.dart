import 'package:flutter/material.dart';
import 'package:waste_to_wealth/theme/theme_app.dart';
import 'create_post_screen.dart';

class GreenSocialScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _posts = [
    {
      'id': '1',
      'user': {
        'name': 'John Doe',
        'avatar': 'https://i.pravatar.cc/150?img=1',
      },
      'title': 'Beach Cleanup Initiative',
      'description': 'Join us this weekend for a beach cleanup! Let\'s make our oceans plastic-free.',
      'image': 'https://picsum.photos/seed/1/400/300',
      'isFundraising': true,
      'likes': 124,
      'comments': 45,
      'timeAgo': '2h ago',
    },
    // Add more posts...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 40,
            title: Text(
              'Green Social',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppTheme.textColor),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add_circle_outline, 
                  color: AppTheme.primaryColor
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreatePostScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final post = _posts[index];
                return _buildPostCard(context, post);
              },
              childCount: _posts.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, Map<String, dynamic> post) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post['user']['avatar']),
            ),
            title: Text(
              post['user']['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(post['timeAgo']),
            trailing: post['isFundraising']
              ? Chip(
                  label: Text(
                    'Fundraising',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                )
              : null,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  post['description'],
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Image.network(
            post['image'],
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                    Text('${post['likes']}'),
                    SizedBox(width: 16),
                    IconButton(
                      icon: Icon(Icons.comment_outlined),
                      onPressed: () {},
                    ),
                    Text('${post['comments']}'),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.share_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}