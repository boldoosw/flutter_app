import 'package:auto_route/auto_route.dart';
import 'package:flutter_app/posts/posts_page.dart';
import 'package:flutter_app/posts/single_post_page.dart';
import 'package:flutter_app/settings/settings_page.dart';
import 'package:flutter_app/users/user_profile_page.dart';
import 'package:flutter_app/users/users_page.dart';
import '../home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'posts',
          name: 'PostsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: PostsPage),
            AutoRoute(path: ':postId', page: SinglePostPage),
          ],
        ),
        AutoRoute(
          path: 'users',
          name: 'UsersRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: UsersPage),
            AutoRoute(path: ':userId', page: UserProfilePage),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: SettingsPage,
        )
      ],
    )
  ],
)
class $AppRouter {}
