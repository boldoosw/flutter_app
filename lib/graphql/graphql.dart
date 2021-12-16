import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQL {
  late final HiveStore _store;
  late final GraphQLCache _cache;
  late Link _link;
  late GraphQLClient _client;

  String _getToken() {
    final tokenBox = _store.get('user_token');

    if (tokenBox == null || tokenBox['token'] == null) {
      return '';
    } else {
      return 'Bearer ' + tokenBox['token'];
    }
  }

  void _resetClientToken() {
    String token = _getToken();
    final HttpLink httpLink = HttpLink(
      'https://api.myparking.mn/graphql',
    );
    final AuthLink authLink = AuthLink(
      getToken: () => token,
    );

    _link = authLink.concat(httpLink);

    _client = GraphQLClient(
      link: _link,
      cache: _cache,
    );
  }

  void setUserToken(String? token) {
    _store.put('user_token', {'token': token});

    _resetClientToken();
  }

  Future<void> initialize() async {
    await initHiveForFlutter();

    _store = HiveStore();
    _cache = GraphQLCache(store: _store);
    _resetClientToken();
  }

  GraphQLCache getCache() => _cache;
  GraphQLClient get client => _client;

  static var shared = GraphQL();
}
