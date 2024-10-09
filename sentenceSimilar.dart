class Solution {
  bool areSentencesSimilar(String sentence1, String sentence2) {
    List<String> words1 = sentence1.split(' ');
    List<String> words2 = sentence2.split(' ');

    // Ensure words1 is the shorter or equal in length to words2
    if (words1.length > words2.length) {
      List<String> temp = words1;
      words1 = words2;
      words2 = temp;
    }

    int i = 0;  // To compare the prefix
    int j = 0;  // To compare the suffix

    // Find the common prefix
    while (i < words1.length && words1[i] == words2[i]) {
      i++;
    }

    // Find the common suffix
    while (j < words1.length && words1[words1.length - 1 - j] == words2[words2.length - 1 - j]) {
      j++;
    }

    // The total matched length (prefix + suffix) must cover the entire shorter sentence
    return (i + j) >= words1.length;
  }
}