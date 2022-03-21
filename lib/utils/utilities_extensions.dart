
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String capitalizeFirstCharacters() {
    List<String> words = this.split(' ');
    String newString = '';
    for (var i = 0; i < words.length; i++) {
      newString += '${i == 0 ? '' : ' '}${words[i][0].toUpperCase()}${words[i].substring(1)}';
    }
    return newString;
  }
}

extension IsBetweenExtension on num {
  /// • Checks whether the given number is between lower & upper bounds.
  ///
  /// • Notice that this function assumes that boundaries will be included by default.
  bool isBetween(num lowerBound, num upperBound, {bool includeBounds = true}) {
    if (includeBounds) {
      if (lowerBound <= this && this <= upperBound) {
        return true;
      } else
        return false;
    } else if (!includeBounds) {
      if (lowerBound < this && this < upperBound) {
        return true;
      } else
        return false;
    } else
      return false;
  }
}
