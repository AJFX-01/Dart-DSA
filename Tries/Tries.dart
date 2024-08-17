import 'TriesNode.dart';

class Tries {

   static void insert(TriesNode? root, String word) {
    TriesNode? currentNode = root;
    // iterate throught the words 
    for (int i = 0; i < word.length; i++) {
      // create a variable to keep track of the character we are on
      String c = word[i];

      if (currentNode?.edges[c] == null || !currentNode!.edges.containsKey(c)) {
        // if the character doesn't exist in the current node, create a new one and add it to the edges map
        currentNode?.edges[c] = TriesNode();
      }
      // if the character exist in the current node, add it to the edges map
      currentNode = currentNode?.edges[c];
    }
    // set the isEndOfWord flag to true to mark the end of the word in the trie
    currentNode?.isEndOfWord = true;
  }


  static bool search(TriesNode? root, String word) {
    TriesNode? currentNode = root;
    // iterate through the words
    for (int i = 0; i < word.length; i++) {
      // create a key to keep track of the current char in the string
      String key = word[i];
      // if character does not exist in the edges we return false 
      if (!currentNode!.edges.containsKey(key)) {
        return false;
      }
      // if it exist we set currrentnode to the current node
      currentNode = currentNode.edges[key];
    }
    // retrun the current node
    return currentNode!.isEndOfWord;
  }

  static bool startWith(TriesNode? root, String prefix) {
    TriesNode? currentNode = root;
    // iterate through the prefix
    for (int i = 0; i < prefix.length; i++) {
      // create a key to keep track of the current char in the string
      String key = prefix[i];
      // if character does not exist in the edges we return false
      if (!currentNode!.edges.containsKey(key)) {
        return false;
      }
      // if it exist we set currrentnode to the current node
      currentNode = currentNode.edges[key];
    }
    // return true if prefix is found in the trie
    return true;
  }

}