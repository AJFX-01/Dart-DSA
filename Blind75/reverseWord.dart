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