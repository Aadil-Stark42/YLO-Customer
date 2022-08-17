import 'package:flutter/material.dart';

import '../res/ResColor.dart';

class OtpFieldStyle {
  /// The background color for outlined box.
  final Color backgroundColor;

  /// The border color text field.
  final Color borderColor;

  /// The border color of text field when in focus.
  final Color focusBorderColor;

  /// The border color of text field when disabled.
  final Color disabledBorderColor;

  /// The border color of text field when in focus.
  final Color enabledBorderColor;

  /// The border color of text field when disabled.
  final Color errorBorderColor;

  OtpFieldStyle(
      {this.backgroundColor = Colors.transparent,
      this.borderColor = greyColor2,
      this.focusBorderColor = greyColor2,
      this.disabledBorderColor = greyColor2,
      this.enabledBorderColor = greyColor2,
      this.errorBorderColor = Colors.red});
}
