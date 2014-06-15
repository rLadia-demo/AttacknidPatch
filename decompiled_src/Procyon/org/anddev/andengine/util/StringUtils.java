package org.anddev.andengine.util;

public class StringUtils
{
    public static int countOccurrences(final String s, final char c) {
        int n = 0;
        for (int i = s.indexOf(c, 0); i != -1; i = s.indexOf(c, i + 1)) {
            ++n;
        }
        return n;
    }
    
    public static String padFront(final String s, final char c, final int n) {
        final int n2 = n - s.length();
        if (n2 <= 0) {
            return s;
        }
        final StringBuilder sb = new StringBuilder();
        for (int i = n2 - 1; i >= 0; --i) {
            sb.append(c);
        }
        sb.append(s);
        return sb.toString();
    }
    
    public static String[] split(final String s, final char c) {
        return split(s, c, null);
    }
    
    public static String[] split(final String s, final char c, final String[] array) {
        final int n = 1 + countOccurrences(s, c);
        int n2;
        if (array != null && array.length == n) {
            n2 = 1;
        }
        else {
            n2 = 0;
        }
        String[] array2;
        if (n2 != 0) {
            array2 = array;
        }
        else {
            array2 = new String[n];
        }
        if (n == 0) {
            array2[0] = s;
            return array2;
        }
        int n3 = 0;
        for (int i = 0; i < n - 1; ++i) {
            final int index = s.indexOf(c, n3);
            array2[i] = s.substring(n3, index);
            n3 = index + 1;
        }
        array2[n - 1] = s.substring(n3, s.length());
        return array2;
    }
}
