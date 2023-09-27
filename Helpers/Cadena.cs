using System.Text.RegularExpressions;

namespace Helpers
{
    public static class Cadena
    {

        public static string SepararCadenaPorMayuscula(string cadena)
        {
            var regex = new Regex(@"
                (?<=[A-Z])(?=[A-Z][a-z]) |
                 (?<=[^A-Z])(?=[A-Z]) |
                 (?<=[A-Za-z])(?=[^A-Za-z])", RegexOptions.IgnorePatternWhitespace);

            return regex.Replace(cadena, " ");
        }
    }
}
