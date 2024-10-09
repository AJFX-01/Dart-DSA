class MinSWap {
  int minSwap(String s) {
    int unbalanced = 0;
    int swaps = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '[') {
        unbalanced++;
      } else {
        unbalanced--;
      }

      if (unbalanced == 0) {
        swaps++;
        unbalanced -= 2;
      }
    }

    return swaps;
  }
}

// Uisng two stacks

class MinSwapWithTwoStack {
  List<int> openStack = [];
  List<int> closeStack = [];
  
  int minSwap (String s) {
    // transcerse through the 
    for (int i = 0; i < s.length; i++) {
      if (s[i] == '[') {
        openStack.add(i);
      } else {
        if (openStack.isNotEmpty) {
          closeStack.add(openStack.removeLast());
        } else {
          closeStack.add(i);
        }
      }
    }
    return (closeStack.length + 1) ~/ 2;
  }
}
