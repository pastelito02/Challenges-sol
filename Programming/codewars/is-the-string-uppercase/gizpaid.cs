public static class StringExtensions
{
  public static bool IsUpperCase(this string value)
  {
    return value.ToUpper() == value;
  }
}
