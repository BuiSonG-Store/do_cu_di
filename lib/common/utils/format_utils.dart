class FormatUtils {
  static String formatKm(double? km) {
    try {
      if (km == null) {
        return '0';
      }
      if (km > 10) {
        return km.toStringAsFixed(0);
      }
      return km.toStringAsFixed(1);
    } catch (e) {
      return '0';
    }
  }
}