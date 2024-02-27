class Heap {
  List<int> heap = [];

  insert(List<int> arr) {
    for (int i = 0; i < arr.length; i++) {
      heap.add(arr[i]);
      heapifyup();
    }
  }

  heapifyup() {
    int currentidx = heap.length - 1;
    while (currentidx > 0) {
      int parentidx = ((currentidx - 1) / 2).floor();
      if (heap[currentidx] > heap[parentidx]) {
        swap(currentidx, parentidx);
        currentidx = parentidx;
      } else {
        break;
      }
    }
  }

  peek() {
    print(heap[0]);
  }

  remove() {
    int val = heap.removeLast();
    heap[0] = val;
    heapifydown(0);
  }

  heapifydown(int currentidx) {
    int minvalidx = currentidx;
    int leftidx = 2 * currentidx + 1;
    int rightidx = 2 * currentidx + 2;
    if (leftidx < heap.length && heap[leftidx] > heap[minvalidx]) {
      minvalidx = leftidx;
    }
    if (rightidx < heap.length && heap[rightidx] > heap[minvalidx]) {
      minvalidx = rightidx;
    }
    if (currentidx != minvalidx) {
      swap(currentidx, minvalidx);
      heapifydown(minvalidx);
    }
  }

  swap(int currentidx, int parentidx) {
    int temp = heap[currentidx];
    heap[currentidx] = heap[parentidx];
    heap[parentidx] = temp;
  }
}

void main() {
  Heap heap = Heap();
  heap.insert([21, 3, 19, 5, 6]);

  heap.peek();
}
