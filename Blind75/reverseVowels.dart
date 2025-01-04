class Reversevowels {
  String reverseVowels(String s) {
    Set<String> vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
    List<String> chars = s.split("");

    int left = 0, right = chars.length - 1;

    while (left < right) {
      while (left < right && !vowels.contains(chars[left])) {
        left++;
      }
      while (left < right && !vowels.contains(chars[right])) {
        right--;
      }

      if (left < right) {
        // Swap the vowels
        String temp = chars[left];
        chars[left] = chars[right];
        chars[right] = temp;
        left++;
        right--;
      }
    }

    return chars.join();
  }
}

class ReverseVowels2 {
  String reverseVowels(String s) {
    List<String> char = s.split("");
    int i = 0;
    int j = char.length - 1;

    while (i < j) {
      if ("AEIOUaeiou".contains(char[i])) {
        while (true) {
          if ("AEIOUaeiou".contains(char[j])) {
            String temp = char[i];
            char[i] = char[j];
            char[j] = temp;
            j--;
            break;
          }
          j--;
        }
      }
      i++;
    }

    return char.join("");
  }
}
