class ApplyParenthesis {

  List<int> differentWaysToCompute(String expression) {

    if (isNumber(expression)) {
      return [int.parse(expression)];
    }
    List<int> results = [];

    for(int i = 0;  i < expression.length; i++) {

      String char = expression[i];

      if (isOperator(char)) {
        List<int> leftResults = differentWaysToCompute(expression.substring(0, i));
        List<int> rightResults = differentWaysToCompute(expression.substring(i + 1));

        for(int left in leftResults) {
          for(int right in rightResults) {
            results.add(applyOperator(left, right, char));
          }
        }
      }

    }

    return results;

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