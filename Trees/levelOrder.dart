import 'dart:collection';

import 'treenode.dart';


class LevelOrderTransversal {

  //create a sttaic method to traverse throught the tree in level order
  static List<List<int>> levelOrder (TreeNode<int>? root) {

    // inittailize an empty list of list or array of list
    List<List<int>> res = [];
    // Ensure that root node is not null or empty
    if (root == null) return res;

    // Initialize a new queue to hold our nodes in the tree
    Queue<TreeNode<int>> q = Queue<TreeNode<int>>();

    // we add the root to queue first then transverse throught it 
    q.add(root);

    // keep checking the queue if it is not empty 
    while(q.isNotEmpty) {
      int len = q.length;

      // create our sub list to hold the tranversed nodes
      List<int> subres = [];
      // we transverse through the tree, adding the node to queue then 
      //pop the node and add to the sub alist
      for (int i = 0 ; i < len; i++ ) {
        TreeNode<int> node = q.removeFirst();

        // we check the left and right side of our node to ensure it not empty
        if (node.left != null) q.add(node.left!);
        if (node.right != null) q.add(node.right!); 
        // we add node to the sub list
        subres.add(node.data);
      }
      
      // add the sub list to main list
      res.add(subres);
    }
    return res;
  }
    
}