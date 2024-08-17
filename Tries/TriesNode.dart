class TriesNode {

  Map<String, TriesNode> edges;
  bool isEndOfWord;

  TriesNode() : edges ={}, isEndOfWord = false;
}