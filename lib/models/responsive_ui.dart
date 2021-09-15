import 'package:flutter/cupertino.dart';

class ResponsiveUI {
  static double getFontSize(BuildContext context, double fontSize) {
    // 800 is avg height of a device
    return (fontSize / 820) * MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context, double padding) {
    return MediaQuery.of(context).size.width - padding;
  }

  static double getHeight(BuildContext context, double percent) {
    return (percent) * MediaQuery.of(context).size.height;
  }

  static double getBoxWidth(double width, double padding) {
    return (width / 3) - (2 * padding);
  }
}
