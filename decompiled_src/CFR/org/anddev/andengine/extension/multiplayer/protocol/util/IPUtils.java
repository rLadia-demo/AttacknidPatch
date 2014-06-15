/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.content.Context
 *  android.net.wifi.WifiInfo
 *  android.net.wifi.WifiManager
 */
package org.anddev.andengine.extension.multiplayer.protocol.util;

import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IPUtils {
    private static final Pattern IP_PATTERN = Pattern.compile("(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)");
    public static final String LOCALHOST_IP = "127.0.0.1";
    private static final String REGEXP_255 = "(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)";
    private static final String REGEXP_IP = "(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)";

    public static String getIPAddress(Context context) {
        return IPUtils.ipAddressToString(((WifiManager)context.getSystemService("wifi")).getConnectionInfo().getIpAddress());
    }

    public static String ipAddressToString(int n) {
        StringBuilder stringBuilder = new StringBuilder();
        StringBuilder stringBuilder2 = stringBuilder.append(n & 255).append('.');
        int n2 = n >>> 8;
        StringBuilder stringBuilder3 = stringBuilder2.append(n2 & 255).append('.');
        int n3 = n2 >>> 8;
        stringBuilder3.append(n3 & 255).append('.').append(255 & n3 >>> 8);
        return stringBuilder.toString();
    }

    public static boolean isValidIP(String string) {
        return IPUtils.IP_PATTERN.matcher((CharSequence)string).matches();
    }
}

