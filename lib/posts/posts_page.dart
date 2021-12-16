import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_app/data/app_data.dart';
import 'package:flutter_app/routes/router.gr.dart';
import 'package:flutter_app/widgets.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);
  final posts = Post.posts;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < posts.length; i++)
              PostTile(
                tileColor: posts[i].color,
                postTitle: posts[i].title,
                onTileTap: () =>
                    context.router.push(SinglePostRoute(postId: posts[i].id)),
              ),
          ],
        ),
      ),
    ));
  }
}
