class LongestPalindrome {

  public longestPalindromeBruteForce(s: string): string {
    let longest = "";

    if (s.length <= 1) return s;

    for (let i = 0; i < s.length; i++) {
      for (let j = 1; j < s.length; j++) {
        const substr = s.slice(i , j + 1);

        if( substr === substr.split('').reverse().join("") && substr.length > longest.length) {
          longest = substr;
        }
      }
    }

    return longest;
  }


  public longestPalindromeCenter(s: string): string {

    if (s.length <= 1) return s;

    let start = 0;
    let end = 0;


    for (let i  = 0; i < s.length; i++) {
      const l1 = this.expandAroundCenter(s, i, i);
      const l2 = this.expandAroundCenter(s, i, i + 1);

      const len : number = Math.max(l1, l2);
      if ( len > end - start) {
        start = i - Math.floor((len - 1) / 2);
        end = i + Math.floor(len / 2);
      }
    }


    return s.slice(start , end + 1);

  }


  private expandAroundCenter(s: string, left: number, right: number): number  {
    while(left >= 0 && right < s.length && s[left] === s[right]) {
      left--
      right++
    }

    return right - left - 1;
  }

  public longestPalindromeDP(s: string): string {
    if (s.length < 2) return s;

    const n: number = s.length;

    const radii = new Array(2 * n + 1).fill(0);

    let center: number = 0;
    let rightBoundary: number = 0;

    for (let i = 0; i < (2 * n + 1); i++) {

      const mirror = 2 * center - i;

      if (i < rightBoundary) {
        radii[i] =  Math.min(rightBoundary - 1, radii[mirror]);
      }

      let leftHalf = i - (radii[i] + 1);
      let rightHalf = i + (radii[i] + 1);

      while(leftHalf >= 0 && rightHalf < 2 * n + 1 && 
        (leftHalf % 2 === 0 || s[(leftHalf - 1) / 2] === s[(rightHalf - 1) / 2])
      ) {
        radii[i]++;
        leftHalf--;
        rightHalf++;
      }

      if(i + radii[i] > rightBoundary) {
        center = i;
        rightBoundary = i + radii[i];
      }
    }

    let maxLen = 0;
    let centerIndex = 0;

    for(let i = 0; i < 2 * n + 1; i++) {
      if (radii[i] > maxLen) {
        maxLen = radii[i];
        centerIndex = i;
      }
    }

    const start = (centerIndex - maxLen) / 2;
    return s.substring(start, start + maxLen);
  }
}