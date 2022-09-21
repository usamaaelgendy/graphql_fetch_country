import 'package:graphql/client.dart';
import 'package:graphql_fetch_country/core/error/exceptions.dart' as ex;
import 'package:graphql_fetch_country/core/utils/app_constance.dart';

class GraphQlCaller {
  GraphQlCaller._();

  /// Using Dependency injection
  static final GraphQlCaller _instance = GraphQlCaller._();

  factory GraphQlCaller() {
    return _instance;
  }

  /// This class is used to fetch the query/mutation from a GraphQL endpoint and also to connect to a GraphQL server
  final GraphQLClient graphQLClient = GraphQLClient(
    /// This is used to set the endpoint or URL of the backend
    link: HttpLink(AppConstance.baseUrl),

    ///This class is used to cache our queries
    cache: GraphQLCache(),
  );

  Future<Map<String, dynamic>> requestQuery(QueryOptions options) async {
    /// query --> This widget is used to make a query to a GraphQL backend
    final QueryResult result = await graphQLClient.query(options);
    if (result.hasException) {
      throw ex.ServerException(message: result.exception!.toString());
    }
    return result.data!;
  }
}
