
class Solution {

    final TrieNode root;
    Solution() : root = TrieNode();

    void insert(String word) {
        TrieNode currentNode = root;
        for (int i = 0; i < word.length; i++) {
            String k = word[i];

            if(!currentNode.edges.containsKey(k)) {
                currentNode.edges[k] = TrieNode();
            }

            currentNode = currentNode.edges[k]!;
        }
        currentNode.isEndOfWord = true;
    }

    String findRoot(String word) {
        TrieNode currentNode = root;
        StringBuffer rootWord = StringBuffer();

        for (int i = 0; i < word.length; i++) {
            String ch = word[i];
            if(!currentNode.edges.containsKey(ch)) {
                break;
            }
            rootWord.write(ch);

            currentNode = currentNode.edges[ch]!;
            if (currentNode.isEndOfWord) {
                return rootWord.toString();
            }
        }

        return word;
    }


    String replaceWords(List<String> dictionary, String sentence) {
        for (String word in dictionary) {
            insert(word);
        }

        List<String> words = sentence.split(" ");
        for (int i = 0; i < words.length; i++) {
            words[i] = findRoot(words[i]);
        }

        return words.join(' ');
    }
}


class TrieNode {
    Map<String, TrieNode> edges;
    bool isEndOfWord;

    TrieNode () : edges = {}, isEndOfWord = false;
}