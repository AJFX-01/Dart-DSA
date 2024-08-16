import 'treenode.dart';

class PreOrderTransversal {
  static List<int> preorderTransversal(TreeNode<int>? root) {
    
    List<int> res = [];
    preorder(root, res);
    return res;
    
  }

  static void preorder(TreeNode<int>? root, List<int> res) {
    // check if the root is not null 
    if (root == null) return;
    
    // Transverse from the root to left leaf null then 
    res.add(root.data);
    preorder(root.left, res);
    preorder(root.right, res);
  }
}

class PreOrderTransversalIterative {

    static List<int> preorderTransversal(TreeNode? root) {
      //initialise a stack list to keep track of our tramverse node
      List<TreeNode> stack = [];

      // initialize  list to keep track of the data 
      List<int> res = [];

      // check that root is not null
      if (root == null) return res;

      // else add then root to the stack
      stack.add(root);

      // iteate throught the stack until it empty to return all the tranveresd data
      while(stack.isNotEmpty) {
        // the root of the tree
        root = stack.removeLast();
        // add the data to list of data
        res.add(root.data);
        // check that the right and left child node is not null
        // then add it to the stack
        if (root.right != null) {
          stack.add(root.right!);
        }
        if (root.left != null) {
          stack.add(root.left!);
        }
      }

      return res; 
    }
}