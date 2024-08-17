import 'TriesNode.dart';

class Tries {

  static void insert(TriesNode? root, String word) {
    TriesNode? currentNode = root;

    for (int i = 0; i < word.length; i++) {
      String c = word[i];

      if (currentNode?.edges[c] == null || ) {
        currentNode?.edges[c] = TriesNode();
      }
      currentNode = currentNode?.edges[c];
    }
    currentNode?.isEndOfWord = true;
  }

}