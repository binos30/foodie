import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/post.dart';
import 'friend_post_tile.dart';

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({
    super.key,
    required this.friendPosts,
  });

  final List<Post> friendPosts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 0,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppLocalizations.of(context)!.socialChefs} 👩‍🍳',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          ListView.separated(
            // Since you're nesting two list views, it's a good idea to set
            // primary to false. That lets Flutter know that this isn't the
            // primary scroll view.
            primary: false,
            // Even though you set primary to false, it's also a good idea to
            // disable the scrolling for this list view. That will propagate
            // up to the parent list view.
            physics: const NeverScrollableScrollPhysics(),
            // Set shrinkWrap to true to create a fixed-length scrollable list
            // of items. This gives it a fixed height. If this was false,
            // you'd get an unbounded height error.
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemCount: friendPosts.length,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
