package org.anddev.andengine.util;

public class StringUtils
{
  public static int countOccurrences(String paramString, char paramChar)
  {
    int i = 0;
    for (int j = paramString.indexOf(paramChar, 0);; j = paramString.indexOf(paramChar, j + 1))
    {
      if (j == -1) {
        return i;
      }
      i++;
    }
  }
  
  public static String padFront(String paramString, char paramChar, int paramInt)
  {
    int i = paramInt - paramString.length();
    if (i <= 0) {
      return paramString;
    }
    StringBuilder localStringBuilder = new StringBuilder();
    for (int j = i - 1;; j--)
    {
      if (j < 0)
      {
        localStringBuilder.append(paramString);
        return localStringBuilder.toString();
      }
      localStringBuilder.append(paramChar);
    }
  }
  
  public static String[] split(String paramString, char paramChar)
  {
    return split(paramString, paramChar, null);
  }
  
  public static String[] split(String paramString, char paramChar, String[] paramArrayOfString)
  {
    int i = 1 + countOccurrences(paramString, paramChar);
    int j;
    if ((paramArrayOfString != null) && (paramArrayOfString.length == i))
    {
      j = 1;
      if (j == 0) {
        break label47;
      }
    }
    label47:
    for (String[] arrayOfString = paramArrayOfString;; arrayOfString = new String[i])
    {
      if (i != 0) {
        break label56;
      }
      arrayOfString[0] = paramString;
      return arrayOfString;
      j = 0;
      break;
    }
    label56:
    int k = 0;
    for (int m = 0;; m++)
    {
      if (m >= i - 1)
      {
        arrayOfString[(i - 1)] = paramString.substring(k, paramString.length());
        return arrayOfString;
      }
      int n = paramString.indexOf(paramChar, k);
      arrayOfString[m] = paramString.substring(k, n);
      k = n + 1;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.StringUtils
 * JD-Core Version:    0.7.0.1
 */