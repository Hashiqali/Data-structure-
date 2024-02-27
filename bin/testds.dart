class Heap {
  List heap = [];

  insert(List data) {
    for (int i = 0; i < data.length; i++) {
      heap.add(data[i]);
      heapifyup();
    }
  }

  heapifyup() {
    int currentidx = heap.length - 1;
    while (currentidx > 0) {
      int minval = ((currentidx - 1) / 2).floor();
      if (heap[currentidx] < heap[minval]) {
        swap(currentidx, minval);
        currentidx = minval;
      } else {
        break;
      }
    }
  }

  swap(int currentindx, int parentidx) {
    int temp = heap[currentindx];
    heap[currentindx] = heap[parentidx];
    heap[parentidx] = temp;
  }

  remove() {
    final val = heap.removeLast();
    heap[0] = val;
    heapyfydown(0);
  }

  heapyfydown(int currentidx) {
    int parentidx = currentidx;
    int leftidx = 2 * currentidx + 1;
    int rightidx = 2 * currentidx + 2;

    if (leftidx < heap.length && heap[leftidx] < heap[parentidx]) {
      parentidx = leftidx;
    }
    if (rightidx < heap.length && heap[rightidx] < heap[parentidx]) {
      parentidx = rightidx;
    }
    if (currentidx != parentidx) {
      swap(currentidx, parentidx);
      heapyfydown(parentidx);
    }
  }
}

main() {
  Heap heap = Heap();

  heap.insert([12, 34, 54, 6, 34, 23, 231, 1]);
  print(heap.heap);
}
