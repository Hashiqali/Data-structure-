class Node {
  int data;
  Node? next;
  Node(this.data);
}

Node? head;
Node? tail;

addNode(int data) {
  Node newnode = Node(data);
  if (head == null) {
    head = newnode;
  } else {
    tail?.next = newnode;
    tail = newnode;
  }
  tail = newnode;
}

display() {
  Node? temp = head;
  while (temp != null) {
    print(temp.data);
    temp = temp.next;
  }
}

delete(int data) {
  Node? temp = head, prev;
  if (temp != null && temp.data == data) {
    head = temp.next;
    return;
  }
  while (temp != null && temp.data != data) {
    prev = temp;
    temp = temp.next;
  }
  if (temp == null) {
    return;
  }
  if (temp == tail) {
    tail = prev;
    tail?.next = null;
    return;
  }
  prev?.next = temp.next;
}

insert(int target, int data) {
  Node newnode = Node(data);
  Node? temp = head;
  while (temp != null && temp.data != target) {
    temp = temp.next;
  }
  if (temp == null) {
    return;
  }
  if (temp == tail) {
    newnode.next = null;
    tail?.next = newnode;
    return;
  }
  newnode.next = temp.next;
  temp.next = newnode;
}

void main() {
  addNode(10);
  addNode(20);
  addNode(30);
  addNode(40);
  addNode(50);
  insert(30, 100);
  display();
}
