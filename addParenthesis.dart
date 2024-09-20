class ApplyParenthesis {

  List<int> differentWaysToCompute(String expression) {

    if (isNumber(expression)) {
      return [int.parse(expression)];
    }
    List<int> results = [];

    for(int i = 0;  i < expression.length; i++) {

      
    }

  }

  bool isNumber(String expression) {
    return int.tryParse(expression) != null;
  }

  bool isOperator(String char) {
    return char == '+' || char == "-" || char == "*";
  }

  int applyOperator(int left, int right, String operator) {

    if (operator == "+") return left + right;
    if (operator == "-") return left - right;
    if (operator == "*") return left * right;

    return 0;
  }
}