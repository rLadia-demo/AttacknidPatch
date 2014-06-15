package org.anddev.andengine.extension.multiplayer.protocol.util;

import java.util.regex.*;
import android.content.*;
import android.net.wifi.*;

public class IPUtils
{
    private static final Pattern IP_PATTERN;
    public static final String LOCALHOST_IP = "127.0.0.1";
    private static final String REGEXP_255 = "(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)";
    private static final String REGEXP_IP = "(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)";
    
    static {
        IP_PATTERN = Pattern.compile("(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)");
    }
    
    public static String getIPAddress(final Context context) {
        return ipAddressToString(((WifiManager)context.getSystemService("wifi")).getConnectionInfo().getIpAddress());
    }
    
    public static String ipAddressToString(final int n) {
        final StringBuilder sb = new StringBuilder();
        final StringBuilder append = sb.append(n & 0xFF).append('.');
        final int n2 = n >>> 8;
        final StringBuilder append2 = append.append(n2 & 0xFF).append('.');
        final int n3 = n2 >>> 8;
        append2.append(n3 & 0xFF).append('.').append(0xFF & n3 >>> 8);
        return sb.toString();
    }
    
    public static boolean isValidIP(final String s) {
        return IPUtils.IP_PATTERN.matcher(s).matches();
    }
}
