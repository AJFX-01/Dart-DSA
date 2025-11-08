function longestPalindrome(s: string): string {
    // iterate through the string, 

    // let longest = ""

    // for(let i = 0; i < s.length; i++) {
        
    //     for(let j = 1; j < s.length; j++) {
    //         const substr = s.slice(i , j + 1);

    //         if(substr === substr.split("").reverse().join("") && substr.length > longest.length ) {
    //             longest = substr
    //         }

    //     }
    // }
    // return longest;

    // check the lenght
    // utils function to expand around the center
    // iterates throught the string and get both odd and even len
    // update start and end
    // return the slice 

    // if (s.length <= 1) return s;

    // let start = 0;
    // let end = 0;

    // for(let i = 0; i < s.length; i++) {

    //     const l1 = expandAroundCenter(i, i);
    //     const l2 = expandAroundCenter(i, i + 1);

    //     const len = Math.max(l1, l2);

    //     if(len > end - start) {
    //         start = i - Math.floor((len - 1) / 2);
    //         end = i + Math.floor(len / 2);
    //     }
    // }

    // function expandAroundCenter(left: number, right: number) {

    //     while(left >= 0 && right < s.length && s[left] === s[right]) {
    //         left--
    //         right++
    //     }

    //     return right - left - 1; 
    // }

    // return s.slice(start, end + 1)
};