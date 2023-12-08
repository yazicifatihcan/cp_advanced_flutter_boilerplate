


import 'package:flutter_base_project/product/utility/values/app_constants.dart';
import 'package:resources/resources.dart';

extension NumExtension on num {
  
  double get horizontalScale  => scaleHorizontally(designHeight, designWidth);

  double get verticalScale  => scaleVertically(designHeight, designWidth);

}