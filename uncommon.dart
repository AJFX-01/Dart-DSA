class Uncommon {

  List<String> UncommonSentences(String s1, String s2) {
    List<String> result = [];
    Map<String, int> wordCount = {};

    List<String> word1 = s1.split(" ");
    List<String> word2 = s2.split(" ");

    for (String word in word1) {
      wordCount[word] = (wordCount[word] ?? 0) + 1;
    }

    for (String word in word2) {
      wordCount[word] = (wordCount[word] ?? 0) + 1;
    }

    for (String word in wordCount.keys) {
      if (wordCount[word] == 1) {
        result.add(word);
      }
    }

    return result;
  }
}