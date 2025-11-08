class LengthOfLongestSubstring {

  public lengthOfLongestSubstring(s: string): number {

    const seen = new Map<string, number>();
    let maxLen = 0;
    let start = 0;

    for(let i = 0; i < s.length; i++) {

      const char = s[i];

      if(seen.has(char) && seen.get(char)! >= start) {
        start = seen.get(char)! + 1;
      }

      seen.set(char, i);
      maxLen = Math.max(maxLen, i - start + 1);
    }

    return maxLen;
  }
    
}