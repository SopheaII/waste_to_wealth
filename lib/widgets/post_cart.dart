import 'package:flutter/material.dart';
import 'package:waste_to_wealth/theme/theme_app.dart';
import '../screens/post_detail_screen.dart';

class PostCard extends StatefulWidget {
  final Map<String, dynamic> post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<String> images = widget.post['images'] ?? [widget.post['image']];

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
              backgroundImage: NetworkImage(widget.post['user']['avatar']),
            ),
            title: Text(
              widget.post['user']['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.post['timeAgo']),
            trailing: widget.post['isFundraising']
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
                  widget.post['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  widget.post['description'],
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(post: widget.post),
                ),
              );
            },
            child: Container(
              height: 300,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  if (images.length > 1) ...[
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                          (index) => Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentImageIndex == index
                                  ? AppTheme.primaryColor
                                  : Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Navigation arrows
                    if (_currentImageIndex > 0)
                      Positioned(
                        left: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: IconButton(
                            icon: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ),
                    if (_currentImageIndex < images.length - 1)
                      Positioned(
                        right: 8,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: IconButton(
                            icon: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            ),
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
                    Text('${widget.post['likes']}'),
                    SizedBox(width: 16),
                    IconButton(
                      icon: Icon(Icons.comment_outlined),
                      onPressed: () {},
                    ),
                    Text('${widget.post['comments']}'),
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}