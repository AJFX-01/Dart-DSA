//

class TriesNode {
  Map<String, TriesNode> edges ={};
  String word = "";

  TriesNode();
}

class Solution {
  final TriesNode root;

  Solution() : root = TriesNode();
  String result = "";

  void insert(String word) {
    TriesNode currentNode = root;

    for (int i = 0; i < word.length; i++) {

      String k = word[i];

      if (!currentNode.edges.containsKey(k)) {
        currentNode.edges[k] = TriesNode();
      }
      currentNode = currentNode.edges[k]!;
    }

    currentNode.word = word;
  }

  void dfs(TriesNode? node) {

    if (node == null) return;

    if (node.word != null) {
        if (node.word.length > result.length) {
          result = node.word;
        } else if (node.word.length == result.length && node.word.compareTo(result) < 0) {
          result = node.word;
        }
    }

    for (TriesNode child in node.edges.values) {
      if (child.word.isNotEmpty) {
        dfs(child);
      }
    }
  }

  String longestWord (List<String> words) {

    for (String word in words) {
      insert(word);
    }

    dfs(root);

    return result;
  }
}


// Using a set
class Solution2 {

  String longestWord(List<String> words) {
     //sort the list in the lexigographically and by thier length
     words.sort((a,b) {
        if (a.length == b.length) {
            return a.compareTo(b);
        }
        return a.length.compareTo(b.length);
     });

     // create a set to track valid words
      Set<String> validwords = {''};
      String longestWord = '';

    // iterate through rach words 

    for(String word in words) {
        //check all the prefixes are valid
        if(validwords.contains(word.substring(0, word.length-1))) {
            validwords.add(word);
        // update the longest word found so far
            if (word.length > longestWord.length) {
                longestWord = word;
            }
        }
    }
    return longestWord;
  }
}