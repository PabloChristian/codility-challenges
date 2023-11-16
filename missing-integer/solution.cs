/*begin
This is a demo task.
Write a function:
def solution(a)

that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

Given A = [1, 2, 3], the function should return 4.

Given A = [−1, −3], the function should return 1.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..100,000];
each element of array A is an integer within the range [−1,000,000..1,000,000].
*/

using System;
// you can also use other imports, for example:
// using System.Collections.Generic;

// you can write to stdout for debugging purposes, e.g.
// Console.WriteLine("this is a debug message");

class Solution {
    public int solution(int[] A) {

        // Remove duplicates and negative numbers
        A = A.Distinct().Where(num => num > 0).ToArray();

        // If the array is empty, the smallest missing positive integer is 1
        if (A.Length == 0)
            return 1;

        // Sort the array
        Array.Sort(A);

        // Find the smallest missing positive integer
        int smallest = 1;
        foreach (int num in A)
        {
            if (num == smallest)
            {
                smallest++;
            }
        }

        return smallest;
    }
}
