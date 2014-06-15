/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import org.xml.sax.Attributes;

public class SAXUtils {
    public static void appendAttribute(StringBuilder stringBuilder, String string, byte by) {
        SAXUtils.appendAttribute(stringBuilder, string, String.valueOf(by));
    }

    public static void appendAttribute(StringBuilder stringBuilder, String string, double d) {
        SAXUtils.appendAttribute(stringBuilder, string, String.valueOf(d));
    }

    public static void appendAttribute(StringBuilder stringBuilder, String string, float f) {
        SAXUtils.appendAttribute(stringBuilder, string, String.valueOf(f));
    }

    public static void appendAttribute(StringBuilder stringBuilder, String string, int n) {
        SAXUtils.appendAttribute(stringBuilder, string, String.valueOf(n));
    }

    public static void appendAttribute(StringBuilder stringBuilder, String string, long l) {
        SAXUtils.appendAttribute(stringBuilder, string, String.valueOf(l));
    }

    public static void appendAttribute(StringBuilder stringBuilder, String string, String string2) {
        stringBuilder.append(' ').append(string).append('=').append('\"').append(string2).append('\"');
    }

    public static void appendAttribute(StringBuilder stringBuilder, String string, short s) {
        SAXUtils.appendAttribute(stringBuilder, string, String.valueOf(s));
    }

    public static void appendAttribute(StringBuilder stringBuilder, String string, boolean bl) {
        SAXUtils.appendAttribute(stringBuilder, string, String.valueOf(bl));
    }

    public static String getAttribute(Attributes attributes, String string, String string2) {
        String string3 = attributes.getValue("", string);
        if (string3 == null) return string2;
        return string3;
    }

    public static String getAttributeOrThrow(Attributes attributes, String string) {
        String string2 = attributes.getValue("", string);
        if (string2 == null) throw new IllegalArgumentException("No value found for attribute: '" + string + "'");
        return string2;
    }

    public static boolean getBooleanAttribute(Attributes attributes, String string, boolean bl) {
        String string2 = attributes.getValue("", string);
        if (string2 == null) return bl;
        bl = Boolean.parseBoolean(string2);
        return bl;
    }

    public static boolean getBooleanAttributeOrThrow(Attributes attributes, String string) {
        return Boolean.parseBoolean(SAXUtils.getAttributeOrThrow(attributes, string));
    }

    public static byte getByteAttribute(Attributes attributes, String string, byte by) {
        String string2 = attributes.getValue("", string);
        if (string2 == null) return by;
        by = Byte.parseByte(string2);
        return by;
    }

    public static byte getByteAttributeOrThrow(Attributes attributes, String string) {
        return Byte.parseByte(SAXUtils.getAttributeOrThrow(attributes, string));
    }

    public static double getDoubleAttribute(Attributes attributes, String string, double d) {
        String string2 = attributes.getValue("", string);
        if (string2 == null) return d;
        d = Double.parseDouble(string2);
        return d;
    }

    public static double getDoubleAttributeOrThrow(Attributes attributes, String string) {
        return Double.parseDouble(SAXUtils.getAttributeOrThrow(attributes, string));
    }

    public static float getFloatAttribute(Attributes attributes, String string, float f) {
        String string2 = attributes.getValue("", string);
        if (string2 == null) return f;
        f = Float.parseFloat(string2);
        return f;
    }

    public static float getFloatAttributeOrThrow(Attributes attributes, String string) {
        return Float.parseFloat(SAXUtils.getAttributeOrThrow(attributes, string));
    }

    public static int getIntAttribute(Attributes attributes, String string, int n) {
        String string2 = attributes.getValue("", string);
        if (string2 == null) return n;
        n = Integer.parseInt(string2);
        return n;
    }

    public static int getIntAttributeOrThrow(Attributes attributes, String string) {
        return Integer.parseInt(SAXUtils.getAttributeOrThrow(attributes, string));
    }

    public static long getLongAttribute(Attributes attributes, String string, long l) {
        String string2 = attributes.getValue("", string);
        if (string2 == null) return l;
        l = Long.parseLong(string2);
        return l;
    }

    public static long getLongAttributeOrThrow(Attributes attributes, String string) {
        return Long.parseLong(SAXUtils.getAttributeOrThrow(attributes, string));
    }

    public static short getShortAttribute(Attributes attributes, String string, short s) {
        String string2 = attributes.getValue("", string);
        if (string2 == null) return s;
        s = Short.parseShort(string2);
        return s;
    }

    public static short getShortAttributeOrThrow(Attributes attributes, String string) {
        return Short.parseShort(SAXUtils.getAttributeOrThrow(attributes, string));
    }
}

