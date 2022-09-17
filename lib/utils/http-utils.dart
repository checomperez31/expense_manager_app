import 'package:http/http.dart' as http;

mixin HttpUtils {
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
}