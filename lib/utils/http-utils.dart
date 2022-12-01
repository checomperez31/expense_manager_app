import 'package:http/http.dart' as http;

mixin HttpUtils {
  Future<http.Response> makePost(String address, String path, [Object? body]) async {
    Uri uri = getUri(address, path);
    print('Making post to $uri with body: $body');
    return http.post(uri, body: body, headers: {
      'content-type': 'application/json'
    });
  }

  Future<http.Response> makePut(String address, String path, [Object? body]) async {
    Uri uri = getUri(address, path);
    print('Making put to $uri with body: $body');
    return http.put(uri, body: body, headers: {
      'content-type': 'application/json'
    });
  }

  Future<http.Response> get(Uri uri) async {
    print('Making get to $uri');
    final res = http.get(uri);
    return res;
  }

  Uri getUri(String address, String path, {Map<String, dynamic>? params}) {
    if ( address.startsWith("https://") ) {
      return Uri.https(address.substring(8), path, params);
    } else {
      if ( address.startsWith("http://") ) {
        return Uri.http(address.substring(7), path, params);
      }
    }
    return Uri.http(address, path);
  }

  http.Response process(http.Response response) {
    if ( response.statusCode != 200 ) throw 'Error in request, code: ${response.statusCode}';
    return response;
  }
}