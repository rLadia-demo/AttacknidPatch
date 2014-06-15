package org.anddev.andengine.extension.multiplayer.protocol.util;

import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IPUtils
{
  private static final Pattern IP_PATTERN = Pattern.compile("(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)");
  public static final String LOCALHOST_IP = "127.0.0.1";
  private static final String REGEXP_255 = "(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)";
  private static final String REGEXP_IP = "(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)\\.(25[0-5]|2[0-4]\\d|[01]?\\d\\d?)";
  
  public static String getIPAddress(Context paramContext)
  {
    return ipAddressToString(((WifiManager)paramContext.getSystemService("wifi")).getConnectionInfo().getIpAddress());
  }
  
  public static String ipAddressToString(int paramInt)
  {
    StringBuilder localStringBuilder1 = new StringBuilder();
    StringBuilder localStringBuilder2 = localStringBuilder1.append(paramInt & 0xFF).append('.');
    int i = paramInt >>> 8;
    StringBuilder localStringBuilder3 = localStringBuilder2.append(i & 0xFF).append('.');
    int j = i >>> 8;
    localStringBuilder3.append(j & 0xFF).append('.').append(0xFF & j >>> 8);
    return localStringBuilder1.toString();
  }
  
  public static boolean isValidIP(String paramString)
  {
    return IP_PATTERN.matcher(paramString).matches();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.util.IPUtils
 * JD-Core Version:    0.7.0.1
 */