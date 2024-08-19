class TrieNode {
  Map<String, TrieNode> children = {};
  bool isWordEnd = false;
  int value = 0;
  int prefixSum = 0;
 
}

class MapSum {
  final TrieNode root;

  Map<String, int> keyMap;

  MapSum() : root = TrieNode(), keyMap = {};

  void insert(String key, int val) {

    // create a varible to check if the key exist in the keyMAp
    //int delta = val - (keyMap[key] ?? 0);
    // if it exist we set it to our currentnode key 
    // if does not exist we create the key 
    //keyMap[key] = val;
    int currentValue = getWordValue(key);
    int diff = val - currentValue;
    // set current node to the root and set add the key to the value 
    TrieNode currentNode = root;
    // currentNode.value += delta;

    for (int i = 0; i < key.length; i++){
      String c = key[i];
      // if the key does not exist in the node we createa a new node 
      if (!currentNode.children.containsKey(c)) {
        currentNode.children[c] = new TrieNode();
      }
      // set it tp our current node and increament the value with our key
      currentNode = currentNode.children[c]!;
      currentNode.prefixSum += diff;
    }

    currentNode.isWordEnd = true;
    currentNode.value = val;
  }

  int sum(String prefix) {
    TrieNode currentNode = root;

    for(int i = 0; i < prefix.length; i++) {
      String c = prefix[i];
      if (!currentNode.children.containsKey(c)) {
        return 0;
      } 
      currentNode = currentNode.children[c]!;
    }

    return currentNode.prefixSum;
  }

  int getWordValue(String word) {
    TrieNode currentNode = root;
    for (int i = 0; i < word.length; i++) {
      String c = word[i];
      if (!currentNode.children.containsKey(c)) {
        return 0;
      }
      currentNode = currentNode.children[c]!;
    }

    return currentNode.value;
  }
}