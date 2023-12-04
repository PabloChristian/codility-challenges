// See https://aka.ms/new-console-template for more information
using System.Xml.Linq;

Console.WriteLine("Hello, World!");

var solution = new Solution();

Console.WriteLine($"Max length is: {solution.Binary(529)}");

Console.ReadKey();

public class Solution
{
    public int Binary(int N)
    {
        int length = 0;
        int max = 0;
        string numbers = Convert.ToString(N, 2);
        bool foundOne = false;

        for(int i=0;i<numbers.Length; i++)
        {
            if (numbers[i].ToString().Equals("0"))
            {
                length++;
                if (length > max)
                    max = length;
            }
            else
            {
                length = 0;
            }
        }

        return max;
    }
}
