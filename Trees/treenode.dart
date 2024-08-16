class TreeNode<T> {
  T data;
  TreeNode<T>? left;
  TreeNode<T>? right;

  TreeNode(this.data, {this.left, this.right});
}