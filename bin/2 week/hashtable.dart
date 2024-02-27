class Hashtable {
  List table = [];
  int size = 0;
  Hashtable(this.size) {
    table = List.filled(size, []);
  }

  hash(key) {
    num total = 0;
    for (int i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % size;
  }

  set(key, value) {
    final index = hash(key);
    if (table[index] == null) {
      table[index] = [
        [key, value]
      ];
    } else {
      var bucket = List.from(table[index]);

      final samekey = bucket.firstWhere(
        (element) => element[0] == key,
        orElse: () => null,
      );
      if (samekey != null) {
        samekey[1] = value;
      } else {
        bucket.add([key, value]);
        table[index] = bucket;
      }
    }
  }

  get(key) {
    final index = hash(key);
    var bucket = table[index];
    final val = bucket.firstWhere(
      (element) => element[0] == key,
      orElse: () => null,
    );
    if (val != null) {
      print(val[1]);
    } else {
      print('not founded');
    }
  }

  display() {
    for (int i = 0; i < table.length; i++) {
      if (table[i] != null) {
        print('$i => ${table[i]}');
      }
    }
  }

  remove(key) {
    final index = hash(key);
    List bucket = table[index];
    final val = bucket.firstWhere(
      (element) => element[0] == key,
      orElse: () => null,
    );
    if (val != null) {
      bucket.removeRange(bucket.lastIndexOf(val), 1);
    } else {
      print('unable to delete');
    }
  }

  remove1(key) {
    var index = hash(key);
    // table[index] = null;
    var bucket = table[index];
    if (bucket != null) {
      var val = bucket.firstWhere(
        (item) => item[0] == key,
        orElse: () => null,
      );
      if (val != null) {
        bucket.removeAt(bucket.indexOf(val));
      } else {
        print('no elements found');
      }
    }
  }
}

void main() {
  Hashtable table = Hashtable(50);
  table.set('name', 'hashiqali');
  table.set('mane', 'ashi');

  table.remove1('mane');
  table.display();
}
