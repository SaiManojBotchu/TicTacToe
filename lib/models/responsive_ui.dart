import 'package:flutter/cupertino.dart';

class ResponsiveUI {
  static double deviceHeight = 0.0;
  static double deviceWidth = 0.0;

  static getDeviceHeight(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
  }

  static getDeviceWidth(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
  }

  static double getFontSize(double fontSize) {
    // 820 is avg height of a device
    return (fontSize / 820) * deviceHeight;
  }

  static double getWidth(BuildContext context, double padding) {
    return deviceWidth - padding;
  }

  static double getHeight(double percent) {
    return (percent) * deviceHeight;
  }

  static double getBoxWidth(double width, double padding) {
    return (width / 3) - (2 * padding);
  }
}
