=begin
Write a function solution that, given a string S consisting of N letters 'a' and/or 'b'
returns true when all occurrences of letter 'a' are before all occurrences of letter 'b'
and returns false otherwise.

Examples:after =>
1. Given S = "aabbb", the function should return true.
2. Given S = "ba", the function should return false.
3. Given S = "aaa", the function should return true.
4. Given S = "b", the function should return true.
Note that 'a' does not need to occur in S.
5. Given S = "abba", the function should return false.

Write an efficient algorithm for the following assumptions:
 * N is an integer withing the range [1.300,000];
 * string S is made obly of the characters "a" and/or "b".

=end

def solution(s)
	foundB = false
	pass = true
  letters = s.split("")
  letters.each do |c|
    if c.eql?("b")
			foundB = true
    elsif c.eql?("a") && foundB
			pass = false
    end
  end
	return pass;
end
