class TreeNode {
  int start;
  int end;
  TreeNode? left;
  TreeNode? right;

  TreeNode(
    this.start,
    this.end
  );
}

class MyCalender {

  TreeNode? root;

  bool insert(TreeNode node, int start, int end) {
    // If the new event has overlap with the current node, return false
    if(start < node.end && node.start < end) {
      return false;
    }

     // If start time is earlier than current node, go to the left subtree

    if (start < node.start) {
      if (node.left != null) {
          node.left = TreeNode(start, end);
          return true;
      }

      return insert(node.left!, start, end);
    } else {
      if(node.right != null) {
        node.right = TreeNode(start, end);
        return true;
      }

      return insert(node.left!, start, end);
    }

  }

  bool book(int start , int end){
    if (root != null) {
      root = TreeNode(start, end);
      return true;
    }
    return insert(root!, start, end);
  }
}

