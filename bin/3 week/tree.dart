import 'dart:io';

class Node {
  int data;
  Node? left, right;
  Node(this.data);
}

Node? root;

insert(int data) {
  Node? current = root;
  if (current == null) {
    root = Node(data);
    return;
  }
  while (true) {
    if (data < current!.data) {
      if (current.left == null) {
        current.left = Node(data);
        break;
      } else {
        current = current.left;
      }
    } else {
      if (current.right == null) {
        current.right = Node(data);
        break;
      } else {
        current = current.right;
      }
    }
  }
}

contains(int data) {
  Node? current = root;
  while (current?.data != null) {
    if (data < current!.data) {
      current = current.left;
    } else if (data > current.data) {
      current = current.right;
    } else {
      return true;
    }
  }
  return false;
}

remove(int data) {
  removehelper(data, root, null);
}

removehelper(int data, Node? current, Node? parent) {
  while (current != null) {
    if (data < current.data) {
      parent = current;
      current = current.left;
    } else if (data > current.data) {
      parent = current;
      current = current.right;
    } else {
      if (current.left != null && current.right != null) {
        current.data = getminvalue(current.right!);
        removehelper(current.data, current.right, current);
      } else {
        if (parent == null) {
          if (current.left == null) {
            root = current.left;
          } else {
            root = current.right;
          }
        } else {
          if (parent.left == current) {
            if (current.right == null) {
              parent.left = current.left;
            } else {
              parent.left = current.right;
            }
          } else {
            if (current.right == null) {
              parent.right = current.left;
            } else {
              parent.right = current.right;
            }
          }
        }
      }
      break;
    }
  }
}

getminvalue(Node current) {
  if (current.left == null) {
    return current.data;
  } else {
    return getminvalue(current.left!);
  }
}

inorder() {
  inorderhelper(root);
}

inorderhelper(Node? node) {
  if (node != null) {
    inorderhelper(node.left);
    stdout.write('${node.data} ');
    inorderhelper(node.right);
  }
}

preorder() {
  preorderhelper(root);
}

preorderhelper(Node? node) {
  if (node != null) {
    stdout.write('${node.data} ');
    preorderhelper(node.left);
    preorderhelper(node.right);
  }
}

postorder() {
  postorderhelper(root);
}

postorderhelper(Node? node) {
  if (node != null) {
    postorderhelper(node.left);

    postorderhelper(node.right);
    stdout.write('${node.data} ');
  }
}

findclosest(int target) {
  Node? current = root;
  int? closest = current?.data;
  while (current != null) {
    if ((target - current.data).abs() < (target - closest!).abs()) {
      closest = current.data;
    }

    if (target < current.data) {
      current = current.left;
    } else if (target > current.data) {
      current = current.right;
    } else {
      break;
    }
  }
  return closest;
}

bstvalidate() {
  List check = [];
  Node? current = root;
  helper(current, check);
  for (int i = 1; i < check.length; i++) {
    if (check[i] <= check[i - 1]) {
      return false;
    }
  }
  return true;
}

helper(Node? current, List check) {
  if (current != null) {
    helper(current.left, check);
    check.add(current.data);
    helper(current.right, check);
  }
}

void main() {
  insert(10);
  insert(8);
  insert(11);
  insert(4);
  insert(9);

  print(bstvalidate());
}
