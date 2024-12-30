class Gcdofstrings {
  String gcdOfStrings(String str1, String str2) {
    // Helper function to calculate the greatest divisor between two numbers
    int gcd(int a, int b) {
      while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
      }

      return a;
    }

    // check if one string is the concatenation of the other
    if ((str2 + str1) != (str1 + str2)) {
      return "";
    }

    // find the GCD of the length of str1 ND str2
    int gcdLength = gcd(str1.length, str2.length);

    return str1.substring(0, gcdLength);
  }
}
