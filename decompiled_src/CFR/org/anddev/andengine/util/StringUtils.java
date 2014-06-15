/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

public class StringUtils {
    public static int countOccurrences(String string, char c) {
        int n = 0;
        int n2 = string.indexOf(c, 0);
        while (n2 != -1) {
            ++n;
            n2 = string.indexOf(c, n2 + 1);
        }
        return n;
    }

    public static String padFront(String string, char c, int n) {
        int n2 = n - string.length();
        if (n2 <= 0) {
            return string;
        }
        StringBuilder stringBuilder = new StringBuilder();
        int n3 = n2 - 1;
        do {
            if (n3 < 0) {
                stringBuilder.append(string);
                return stringBuilder.toString();
            }
            stringBuilder.append(c);
            --n3;
        } while (true);
    }

    public static String[] split(String string, char c) {
        return StringUtils.split(string, c, null);
    }

    /*
     * Enabled aggressive block sorting
     */
    public static String[] split(String string, char c, String[] arrstring) {
        int n = 1 + StringUtils.countOccurrences(string, c);
        boolean bl = arrstring != null && arrstring.length == n;
        String[] arrstring2 = bl ? arrstring : new String[n];
        if (n == 0) {
            arrstring2[0] = string;
            return arrstring2;
        }
        int n2 = 0;
        for (int i = 0; i < n - 1; ++i) {
            int n3 = string.indexOf(c, n2);
            arrstring2[i] = string.substring(n2, n3);
            n2 = n3 + 1;
        }
        arrstring2[n - 1] = string.substring(n2, string.length());
        return arrstring2;
    }
}

