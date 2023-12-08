


extension WidgetsScale on num {
  
  double scaleHorizontally (double screenWidth,double designWidth) => this * (screenWidth / designWidth);

  double scaleVertically (double screenHeight,double designHeight) => this * (screenHeight / designHeight);

}