class Mergealternative {
  String mergeAlternative(String word1, String word2) {
    StringBuffer merged = StringBuffer();

    int i = 0, j = 0;

    while (i < word1.length && j < word2.length) {
      merged.write(word1[i]);
      merged.write(word2[j]);

      i++;
      j++;
    }

    // check the lenght of remaining word1
    if (i < word1.length) {
      merged.write(word1.substring(i));
    }

    // check the lenght of remaining word1
    if (j < word2.length) {
      merged.write(word2.substring(j));
    }

    return merged.toString();
  }
}
