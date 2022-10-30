import 'package:http/http.dart' as http;

mixin HttpUtils {
  Future<http.Response> makePost(String address, String path, [Object? body]) async {
    Uri uri = getUri(address, path);
    print('Making request to $uri');
    return http.post(uri, body: body, headers: {
      'content-type': 'application/json'
    });
  }

  Future<http.Response> get(String address, String path) async {
    final res = http.get(getUri(address, path));
    return res;
  }

  Uri getUri(String address, String path) {
    if ( address.startsWith("https://") ) {
      return Uri.https(address.substring(8), path);
    } else {
      if ( address.startsWith("http://") ) {
        return Uri.http(address.substring(7), path);
      }
    }
    return Uri.http(address, path);
  }

  http.Response process(http.Response response) {
    if ( response.statusCode != 200 ) throw 'Error in request';
    return response;
  }
}