import 'treenode.dart';

class InOrderTransversalIterative {

    static List<int> inorderTransversal(TreeNode? root) {
      
      // inittaialize a list to store treenode and that to store data in the node
      List<TreeNode> stack = [];
      List<int> res = [];

      // set the root node to the current node
      TreeNode? curr =  root;

      // check to ensure is root is avaliable and stack is not empty
      while(curr != null || stack.isNotEmpty) {
        while(curr != null) {
          // add the current node to the stack
          stack.add(curr);
          // tranverse left
          curr = curr.left;

        }
        // remove the current element
        curr = stack.removeLast();

        // add the pop node data to res list
        res.add(curr.data);
        // tranverse right 
        curr = curr.right;
      }

      return res;
      
    }
}


class InOrderTransversalRecursive {

  static List<int> inorderTransversal(TreeNode? root) {

      List<int> res = [];
      inorder(root, res);
      return res;
  }

  static void inorder(TreeNode? root, List<int> res) {

    if (root == null) return ;

    inorder(root.left, res);
    res.add(root.data);
    inorder(root.right, res);
  }
}