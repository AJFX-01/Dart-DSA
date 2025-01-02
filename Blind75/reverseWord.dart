class ReserveWord {
  String reverseWords(String s) {

    // Remove excess white psaces
    List<String> newWords = s.trim().split(RegExp(r'\s+'));

    // reserve the string
    for (int i = 0; j = newWords.length - 1; i < j; i++, j--) {
      String temp = newwords[i]
      newWords[i] = newWords[j]
      newWords[j] = temp; 
    }

    return newWords.join(" ")
  }
}

class ReverseWords {
  String reverseWords(String s) {
    s = s.trim();
    final strBuffer = StringBuffer();
    int l = s.length - 1, r = s.length - 1;
    while (l >= 0 && r >= 0) {
        while (r >= 0 && s[r] == ' ') {
            r--;
            l--;
        }
        while (l >= 0 && s[l] != ' ') {
            l--;
        }
        strBuffer.write(s.substring(l + 1, r + 1));
        if (l > 0 && s[l] == ' ') {
            strBuffer.write(' ');
        }
        r = l;
    }
    return strBuffer.toString();
  }
}