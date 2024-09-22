class ShortetstPalindrome {
  List<int> computeLPS(String s) {
    int n = s.length;

    List<int> lps = new List.filled(n, 0);

    int maxLength = 0;
    int i = 1;

    while (i < n) {
      if (s[i] == s[maxLength]) {
        maxLength++;
        lps[i] = maxLength;
        i++;
      } else {
        if (maxLength != 0) {
          maxLength = lps[maxLength - 1];
        } else {
          lps[i] = 0;
          i++;
        }
      }
    }

    return lps;
  }

  String shortestPalindrome(String s) {
    if (s.isEmpty) return s;

    String rev = s.split("").reversed.join('');

    String combined = s + "#" + rev;

    List<int> lps = computeLPS(combined);

    int palLength = lps.last;
    String suffix = s.substring(palLength);
    return suffix.split('').reversed.join('');
  }
}
