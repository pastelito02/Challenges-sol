/*Seprum*/
using System.Linq;

namespace Extensions
{
    public static class StringExt
    {
        public static string ToAlternatingCase (this string s)
        {
            return string.Concat(s.Select(c => char.IsUpper(c) ? char.ToLower(c) : char.ToUpper(c)));
        }
    }
}
