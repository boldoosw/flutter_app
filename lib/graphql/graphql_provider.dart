import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'graphql.dart';
class GraphqlProvider extends StatefulWidget {
  final Widget app;

  const GraphqlProvider({Key? key, required this.app}) : super(key: key);

  @override
  _GraphqlProviderStates createState() => _GraphqlProviderStates();
}

class _GraphqlProviderStates extends State<GraphqlProvider> {
  late Future<ValueNotifier<GraphQLClient>> _client;

  @override
  void initState() {
    super.initState();

    _client = _initialize();
  }

  Future<ValueNotifier<GraphQLClient>> _initialize() async {
    await GraphQL.shared.initialize();
    final GraphQLClient client = GraphQL.shared.client;

    return ValueNotifier(client);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ValueNotifier<GraphQLClient>>(
        future: _client,
        builder:
            (context, AsyncSnapshot<ValueNotifier<GraphQLClient>> snapshot) {
          if (snapshot.hasData) {
            return GraphQLProvider(
              client: snapshot.data,
              child: widget.app,
            );
          } else if (snapshot.hasError) {
            return MaterialApp(home: Text('Error: ${snapshot.error}'));
          } else {
            return const SplashScreen();
          }
        });
  }
}
