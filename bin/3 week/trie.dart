class TrieNode {
  Map<String, TrieNode> children = {};
  bool last = false;
}

class Trie {
  TrieNode root = TrieNode();

  insert(String data) {
    TrieNode current = root;
    for (int i = 0; i < data.length; i++) {
      String char = data[i];
      current.children.putIfAbsent(char, () => TrieNode());
      current = current.children[char]!;
    }
    current.last = true;
  }

  insertsuffix(String data) {
    for (int i = 0; i < data.length; i++) {
      suffixhelper(i, data);
    }
  }

  suffixhelper(int index, data) {
    TrieNode current = root;
    for (int i = index; i < data.length; i++) {
      String char = data[i];
      current.children.putIfAbsent(char, () => TrieNode());
      current = current.children[char]!;
    }
    current.last = true;
  }

  search(String data) {
    TrieNode current = root;
    for (String char in data.split('')) {
      if (!current.children.containsKey(char)) {
        return false;
      }
      current = current.children[char]!;
    }
    return current.last;
  }

  startwith(String data) {
    TrieNode current = root;

    for (String char in data.split('')) {
      if (!current.children.containsKey(char)) {
        return false;
      }
      current = current.children[char]!;
    }
    return true;
  }

  prefixsearch(String data) {
    TrieNode current = root;
    List<String> result = [];
    for (String char in data.split('')) {
      if (!current.children.containsKey(char)) {
        return result;
      }
      current = current.children[char]!;
    }
    prehelper(current, data, result);
    return result;
  }

  prehelper(TrieNode current, String data, List<String> result) {
    if (current.last) {
      result.add(data);
    }
    for (String char in current.children.keys) {
      prehelper(current.children[char]!, data + char, result);
    }
  }
}

void main() {
  Trie trie = Trie();
  trie.insertsuffix("apple");
  trie.insertsuffix('cat');
  // print(trie.search("apple"));
  // print(trie.search("app"));
  // trie.insert("app");
  // print(trie.search("app"));
  print(trie.prefixsearch("ca"));
  print(trie.prefixsearch("ap"));
}
