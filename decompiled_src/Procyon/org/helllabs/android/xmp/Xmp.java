package org.helllabs.android.xmp;

public class Xmp
{
    static {
        System.loadLibrary("xmp");
    }
    
    public native int decGvol();
    
    public native int deinit();
    
    public native int endPlayer();
    
    public native short[] getBuffer(final int p0, final short[] p1);
    
    public native int getFormatCount();
    
    public native String[] getFormats();
    
    public native ModInfo getModInfo(final String p0);
    
    public native int getPlayBpm();
    
    public native int getPlayPat();
    
    public native int getPlayPos();
    
    public native int getPlayTempo();
    
    public native String getVersion();
    
    public native int incGvol();
    
    public native int init();
    
    public native int loadModule(final String p0);
    
    public native int nextOrd();
    
    public native int playFrame();
    
    public native int prevOrd();
    
    public native int releaseModule();
    
    public native int restartModule();
    
    public native int restartTimer();
    
    public native int seek(final int p0);
    
    public native int seek(final long p0);
    
    public native int setOrd(final int p0);
    
    public native int softmixer();
    
    public native int startPlayer();
    
    public native int stopModule();
    
    public native int stopTimer();
    
    public native int testModule(final String p0);
    
    public native int time();
}
