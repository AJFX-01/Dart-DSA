class Largestbumber {
  String largestNumber(List<int> nums) {
    List<String> newStr = nums.map((e) => e.toString()).toList();

    newStr.sort((a, b) => (b + a).compareTo(a + b));

    if (newStr[0] == '0') return '0';

    return newStr.join('');
  }
}
