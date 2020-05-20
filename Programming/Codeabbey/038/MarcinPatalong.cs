//Author MarcinPatalong
class Program {
        static void Main(string[] args) { 

            string result="";
            int n = int.Parse(Console.ReadLine()),x1,x2;
            double a, b, c, d,x3,x4;
            
            for(int i = 0; i < n; ++i) {
                string[] input = Console.ReadLine().Split(' ');
                double[] numbers = Array.ConvertAll(input, double.Parse);
                a = numbers[0];
                b = numbers[1];
                c = numbers[2];
                d = (b * b) - (4 * a * c);
                if (d >= 0) {
                    x1 = (int)(((-b + Math.Sqrt(d)) / (2 * a)));
                    x2 = (int)(((-b - Math.Sqrt(d)) / (2 * a)));
                    if (x1 > x2) result += x1 + " " + x2 + ";" + " ";
                    else result += x2 + " " + x1 + ";" + " ";
                }else {
                    double r = Math.Sqrt(c / a);
                    double theta = Math.Acos(-b/(2*(Math.Sqrt(a*c))));
                    x3 = Math.Round((r * (((Math.Cos(theta))))), MidpointRounding.AwayFromZero);
                    x4 = Math.Round((r * (((Math.Sin(theta))))), MidpointRounding.AwayFromZero);

                    result += x3 + "+" + x4 + "i" + " " + x3 + "-" + x4 + "i" + ";" + " ";

                }

            }


            Console.WriteLine();
            Console.WriteLine(result);
        }
    }