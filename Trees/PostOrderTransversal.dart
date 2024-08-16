import 'treenode.dart';

class PostOrderTransversalIterative {

  static List<int> postorderTraversal(TreeNode? root) {
    // initialize two list two keep track od the current node
    // the other to keep track of the node we have transversed throught
    List<TreeNode>? stack1 = [];
    List<TreeNode>? stack2 = [];

    // the other list to store the node values
    List<int> res = [];

    // ensure the tree has a node 
    if(root == null) return res;

    //push the root into the stack
    stack1.add(root);
    // iterate as long has the stack1 is not empty
    while(stack1.isNotEmpty) {
      //set root to the last element and pop it

      root = stack1.removeLast();
      // then add it to the second list
      stack2.add(root);
      // transverse through the left side 
      if(root.left != null) stack1.add(root.left!);
      // transverse throught the right side
      if(root.right != null) stack1.add(root.right!);
    }

    //iterate through the second stack and add the item in it into res list
    while(stack2.isNotEmpty) {
      res.add(stack2.removeLast().data);
    }

    return res;
  }
}

class PostOrderTransversalRecursive {
  static List<int> postorderTraversal(TreeNode? root) {
    List<int> res = [];
    postorder(root, res);
    return res;
  }


  static void postorder(TreeNode? root, List<int> res) {
    if(root == null) return;
    postorder(root.left, res);
    postorder(root.right, res);
    res.add(root.data);
  }
}