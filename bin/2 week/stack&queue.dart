class Stack {
  int data;
  int? index;
  Stack? next;
  Stack(this.data);
}

Stack? top;

pushNode(int data) {
  Stack newnode = Stack(data);

  if (top == null) {
    top = newnode;
  } else {
    newnode.next = top;
    top = newnode;
  }
}

popNode() {
  if (top != null) {
    top = top?.next;
  } else {
    print('unable to delete');
  }
}

display() {
  Stack? temp = top;
  while (temp != null) {
    print(temp.data);
    temp = temp.next;
  }
}

///////////////queue////////////////

class Queue {
  int data;
  Queue? next;
  Queue(this.data);
}

Queue? front;
Queue? rear;
enqueue(int data) {
  Queue newnode = Queue(data);
  if (front == null) {
    front = newnode;
    rear = newnode;
  } else {
    rear?.next = newnode;
    rear = newnode;
  }
}

dequeue() {
  if (front != null) {
    front = front?.next;
  } else {
    print('unable to delete');
  }
}

displayqueue() {
  Queue? temp = front;
  while (temp != null) {
    print(temp.data);
    temp = temp.next;
  }
}

void main() {
  enqueue(10);
  enqueue(20);
  enqueue(30);
  enqueue(40);
  dequeue();
  dequeue();
  dequeue();
  dequeue();
  displayqueue();
}
