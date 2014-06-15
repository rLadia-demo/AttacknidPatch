package org.anddev.andengine.util;

import org.xml.sax.*;

public class SAXUtils
{
    public static void appendAttribute(final StringBuilder sb, final String s, final byte b) {
        appendAttribute(sb, s, String.valueOf(b));
    }
    
    public static void appendAttribute(final StringBuilder sb, final String s, final double n) {
        appendAttribute(sb, s, String.valueOf(n));
    }
    
    public static void appendAttribute(final StringBuilder sb, final String s, final float n) {
        appendAttribute(sb, s, String.valueOf(n));
    }
    
    public static void appendAttribute(final StringBuilder sb, final String s, final int n) {
        appendAttribute(sb, s, String.valueOf(n));
    }
    
    public static void appendAttribute(final StringBuilder sb, final String s, final long n) {
        appendAttribute(sb, s, String.valueOf(n));
    }
    
    public static void appendAttribute(final StringBuilder sb, final String s, final String s2) {
        sb.append(' ').append(s).append('=').append('\"').append(s2).append('\"');
    }
    
    public static void appendAttribute(final StringBuilder sb, final String s, final short n) {
        appendAttribute(sb, s, String.valueOf(n));
    }
    
    public static void appendAttribute(final StringBuilder sb, final String s, final boolean b) {
        appendAttribute(sb, s, String.valueOf(b));
    }
    
    public static String getAttribute(final Attributes attributes, final String s, final String s2) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            return value;
        }
        return s2;
    }
    
    public static String getAttributeOrThrow(final Attributes attributes, final String s) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            return value;
        }
        throw new IllegalArgumentException("No value found for attribute: '" + s + "'");
    }
    
    public static boolean getBooleanAttribute(final Attributes attributes, final String s, boolean boolean1) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            boolean1 = Boolean.parseBoolean(value);
        }
        return boolean1;
    }
    
    public static boolean getBooleanAttributeOrThrow(final Attributes attributes, final String s) {
        return Boolean.parseBoolean(getAttributeOrThrow(attributes, s));
    }
    
    public static byte getByteAttribute(final Attributes attributes, final String s, byte byte1) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            byte1 = Byte.parseByte(value);
        }
        return byte1;
    }
    
    public static byte getByteAttributeOrThrow(final Attributes attributes, final String s) {
        return Byte.parseByte(getAttributeOrThrow(attributes, s));
    }
    
    public static double getDoubleAttribute(final Attributes attributes, final String s, double double1) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            double1 = Double.parseDouble(value);
        }
        return double1;
    }
    
    public static double getDoubleAttributeOrThrow(final Attributes attributes, final String s) {
        return Double.parseDouble(getAttributeOrThrow(attributes, s));
    }
    
    public static float getFloatAttribute(final Attributes attributes, final String s, float float1) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            float1 = Float.parseFloat(value);
        }
        return float1;
    }
    
    public static float getFloatAttributeOrThrow(final Attributes attributes, final String s) {
        return Float.parseFloat(getAttributeOrThrow(attributes, s));
    }
    
    public static int getIntAttribute(final Attributes attributes, final String s, int int1) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            int1 = Integer.parseInt(value);
        }
        return int1;
    }
    
    public static int getIntAttributeOrThrow(final Attributes attributes, final String s) {
        return Integer.parseInt(getAttributeOrThrow(attributes, s));
    }
    
    public static long getLongAttribute(final Attributes attributes, final String s, long long1) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            long1 = Long.parseLong(value);
        }
        return long1;
    }
    
    public static long getLongAttributeOrThrow(final Attributes attributes, final String s) {
        return Long.parseLong(getAttributeOrThrow(attributes, s));
    }
    
    public static short getShortAttribute(final Attributes attributes, final String s, short short1) {
        final String value = attributes.getValue("", s);
        if (value != null) {
            short1 = Short.parseShort(value);
        }
        return short1;
    }
    
    public static short getShortAttributeOrThrow(final Attributes attributes, final String s) {
        return Short.parseShort(getAttributeOrThrow(attributes, s));
    }
}
