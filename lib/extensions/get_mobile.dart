import 'package:flutter/material.dart';
import 'package:simple_portfolio/configs/app_constants.dart';

extension MobileX on BuildContext {
  bool get isMobile {
    return MediaQuery.of(this).size.width < AppConstants.mobileWidth
        ? true
        : false;
  }
}
