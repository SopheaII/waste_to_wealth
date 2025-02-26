import 'package:flutter/material.dart';
import 'package:waste_to_wealth/screens/post_detail_screen.dart';
import 'package:waste_to_wealth/theme/theme_app.dart';
import 'package:waste_to_wealth/widgets/post_cart.dart';
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
      'images': [
        'https://picsum.photos/seed/1/800/600',
        'https://picsum.photos/seed/2/800/600',
        'https://picsum.photos/seed/3/800/600',
      ],
      'isFundraising': true,
      'likes': 124,
      'comments': 45,
      'timeAgo': '2h ago',
    },
    {
      'id': '2',
      'user': {
        'name': 'Jane Smith',
        'avatar': 'https://i.pravatar.cc/150?img=2',
      },
      'title': 'Tree Planting Day',
      'description': 'We planted 100 trees today! Every small action counts towards a greener future.',
      'images': [
        'https://picsum.photos/seed/4/800/600',
        'https://picsum.photos/seed/5/800/600',
      ],
      'isFundraising': false,
      'likes': 89,
      'comments': 23,
      'timeAgo': '5h ago',
    },
    {
      'id': '3',
      'user': {
        'name': 'Mike Wilson',
        'avatar': 'https://i.pravatar.cc/150?img=3',
      },
      'title': 'Recycling Workshop',
      'description': 'Learn how to properly sort and recycle different types of waste. Workshop starts at 2 PM.',
      'images': [
        'https://picsum.photos/seed/6/800/600',
        'https://picsum.photos/seed/7/800/600',
        'https://picsum.photos/seed/8/800/600',
        'https://picsum.photos/seed/9/800/600',
      ],
      'isFundraising': true,
      'likes': 56,
      'comments': 12,
      'timeAgo': '1d ago',
    },
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
                // return _buildPostCard(context, post);
                return PostCard(post: post);
              },
              childCount: _posts.length,
            ),
          ),
        ],
      ),
    );
  }
}