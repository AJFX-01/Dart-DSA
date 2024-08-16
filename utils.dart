// max number in  in a kist 
int maxNum(List<int> nums) => nums.reduce((x,y) => x > y ? x : y);

// return the sum of the list

int sumOfList(List<int> nums) => nums.reduce((x,y) => x + y);