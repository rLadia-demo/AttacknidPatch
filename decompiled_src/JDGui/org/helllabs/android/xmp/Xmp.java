package org.helllabs.android.xmp;

public class Xmp
{
  static
  {
    System.loadLibrary("xmp");
  }
  
  public native int decGvol();
  
  public native int deinit();
  
  public native int endPlayer();
  
  public native short[] getBuffer(int paramInt, short[] paramArrayOfShort);
  
  public native int getFormatCount();
  
  public native String[] getFormats();
  
  public native ModInfo getModInfo(String paramString);
  
  public native int getPlayBpm();
  
  public native int getPlayPat();
  
  public native int getPlayPos();
  
  public native int getPlayTempo();
  
  public native String getVersion();
  
  public native int incGvol();
  
  public native int init();
  
  public native int loadModule(String paramString);
  
  public native int nextOrd();
  
  public native int playFrame();
  
  public native int prevOrd();
  
  public native int releaseModule();
  
  public native int restartModule();
  
  public native int restartTimer();
  
  public native int seek(int paramInt);
  
  public native int seek(long paramLong);
  
  public native int setOrd(int paramInt);
  
  public native int softmixer();
  
  public native int startPlayer();
  
  public native int stopModule();
  
  public native int stopTimer();
  
  public native int testModule(String paramString);
  
  public native int time();
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.helllabs.android.xmp.Xmp
 * JD-Core Version:    0.7.0.1
 */