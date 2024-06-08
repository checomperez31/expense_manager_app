import 'dart:ui';

class ColorUtils {
  static Color fromHex(String hexString, String alpha) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write(alpha);
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}