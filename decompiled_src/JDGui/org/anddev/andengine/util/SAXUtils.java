package org.anddev.andengine.util;

import org.xml.sax.Attributes;

public class SAXUtils
{
  public static void appendAttribute(StringBuilder paramStringBuilder, String paramString, byte paramByte)
  {
    appendAttribute(paramStringBuilder, paramString, String.valueOf(paramByte));
  }
  
  public static void appendAttribute(StringBuilder paramStringBuilder, String paramString, double paramDouble)
  {
    appendAttribute(paramStringBuilder, paramString, String.valueOf(paramDouble));
  }
  
  public static void appendAttribute(StringBuilder paramStringBuilder, String paramString, float paramFloat)
  {
    appendAttribute(paramStringBuilder, paramString, String.valueOf(paramFloat));
  }
  
  public static void appendAttribute(StringBuilder paramStringBuilder, String paramString, int paramInt)
  {
    appendAttribute(paramStringBuilder, paramString, String.valueOf(paramInt));
  }
  
  public static void appendAttribute(StringBuilder paramStringBuilder, String paramString, long paramLong)
  {
    appendAttribute(paramStringBuilder, paramString, String.valueOf(paramLong));
  }
  
  public static void appendAttribute(StringBuilder paramStringBuilder, String paramString1, String paramString2)
  {
    paramStringBuilder.append(' ').append(paramString1).append('=').append('"').append(paramString2).append('"');
  }
  
  public static void appendAttribute(StringBuilder paramStringBuilder, String paramString, short paramShort)
  {
    appendAttribute(paramStringBuilder, paramString, String.valueOf(paramShort));
  }
  
  public static void appendAttribute(StringBuilder paramStringBuilder, String paramString, boolean paramBoolean)
  {
    appendAttribute(paramStringBuilder, paramString, String.valueOf(paramBoolean));
  }
  
  public static String getAttribute(Attributes paramAttributes, String paramString1, String paramString2)
  {
    String str = paramAttributes.getValue("", paramString1);
    if (str != null) {
      return str;
    }
    return paramString2;
  }
  
  public static String getAttributeOrThrow(Attributes paramAttributes, String paramString)
  {
    String str = paramAttributes.getValue("", paramString);
    if (str != null) {
      return str;
    }
    throw new IllegalArgumentException("No value found for attribute: '" + paramString + "'");
  }
  
  public static boolean getBooleanAttribute(Attributes paramAttributes, String paramString, boolean paramBoolean)
  {
    String str = paramAttributes.getValue("", paramString);
    if (str != null) {
      paramBoolean = Boolean.parseBoolean(str);
    }
    return paramBoolean;
  }
  
  public static boolean getBooleanAttributeOrThrow(Attributes paramAttributes, String paramString)
  {
    return Boolean.parseBoolean(getAttributeOrThrow(paramAttributes, paramString));
  }
  
  public static byte getByteAttribute(Attributes paramAttributes, String paramString, byte paramByte)
  {
    String str = paramAttributes.getValue("", paramString);
    if (str != null) {
      paramByte = Byte.parseByte(str);
    }
    return paramByte;
  }
  
  public static byte getByteAttributeOrThrow(Attributes paramAttributes, String paramString)
  {
    return Byte.parseByte(getAttributeOrThrow(paramAttributes, paramString));
  }
  
  public static double getDoubleAttribute(Attributes paramAttributes, String paramString, double paramDouble)
  {
    String str = paramAttributes.getValue("", paramString);
    if (str != null) {
      paramDouble = Double.parseDouble(str);
    }
    return paramDouble;
  }
  
  public static double getDoubleAttributeOrThrow(Attributes paramAttributes, String paramString)
  {
    return Double.parseDouble(getAttributeOrThrow(paramAttributes, paramString));
  }
  
  public static float getFloatAttribute(Attributes paramAttributes, String paramString, float paramFloat)
  {
    String str = paramAttributes.getValue("", paramString);
    if (str != null) {
      paramFloat = Float.parseFloat(str);
    }
    return paramFloat;
  }
  
  public static float getFloatAttributeOrThrow(Attributes paramAttributes, String paramString)
  {
    return Float.parseFloat(getAttributeOrThrow(paramAttributes, paramString));
  }
  
  public static int getIntAttribute(Attributes paramAttributes, String paramString, int paramInt)
  {
    String str = paramAttributes.getValue("", paramString);
    if (str != null) {
      paramInt = Integer.parseInt(str);
    }
    return paramInt;
  }
  
  public static int getIntAttributeOrThrow(Attributes paramAttributes, String paramString)
  {
    return Integer.parseInt(getAttributeOrThrow(paramAttributes, paramString));
  }
  
  public static long getLongAttribute(Attributes paramAttributes, String paramString, long paramLong)
  {
    String str = paramAttributes.getValue("", paramString);
    if (str != null) {
      paramLong = Long.parseLong(str);
    }
    return paramLong;
  }
  
  public static long getLongAttributeOrThrow(Attributes paramAttributes, String paramString)
  {
    return Long.parseLong(getAttributeOrThrow(paramAttributes, paramString));
  }
  
  public static short getShortAttribute(Attributes paramAttributes, String paramString, short paramShort)
  {
    String str = paramAttributes.getValue("", paramString);
    if (str != null) {
      paramShort = Short.parseShort(str);
    }
    return paramShort;
  }
  
  public static short getShortAttributeOrThrow(Attributes paramAttributes, String paramString)
  {
    return Short.parseShort(getAttributeOrThrow(paramAttributes, paramString));
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.SAXUtils
 * JD-Core Version:    0.7.0.1
 */