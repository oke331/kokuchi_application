class ShareCalc {
  static double pointFiveCalc(double value) {
    if (value > 0 && value < 0.25) {
      return 0;
    } else if (value >= 0.25 && value < 0.75) {
      return 0.5;
    } else if (value >= 0.75 && value < 1.25) {
      return 1;
    } else if (value >= 1.25 && value < 1.75) {
      return 1.5;
    } else if (value >= 1.75 && value < 2.25) {
      return 2;
    } else if (value >= 2.25 && value < 2.75) {
      return 2.5;
    } else if (value >= 2.75 && value < 3.25) {
      return 3;
    } else if (value >= 3.25 && value < 3.75) {
      return 3.5;
    } else if (value >= 3.75 && value < 4.25) {
      return 4;
    } else if (value >= 4.25 && value < 4.75) {
      return 4.5;
    } else if (value >= 4.75) {
      return 4.5;
    } else {
      return 0;
    }
  }
}
