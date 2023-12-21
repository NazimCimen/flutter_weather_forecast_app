import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidht(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
}

extension NumberExtension on BuildContext {
  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicHeight(0.02);
  
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
}

extension ContextExtensions on BuildContext {
  Widget verticalSizedBox(double size) {
    return SizedBox(
      height: MediaQuery.of(this).size.height * size,
    );
  }
}
