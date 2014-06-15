/*
 * Decompiled with CFR 0_79.
 */
package org.helllabs.android.xmp;

import org.helllabs.android.xmp.ModInfo;

public class Xmp {
    static {
        System.loadLibrary("xmp");
    }

    public native int decGvol();

    public native int deinit();

    public native int endPlayer();

    public native short[] getBuffer(int var1, short[] var2);

    public native int getFormatCount();

    public native String[] getFormats();

    public native ModInfo getModInfo(String var1);

    public native int getPlayBpm();

    public native int getPlayPat();

    public native int getPlayPos();

    public native int getPlayTempo();

    public native String getVersion();

    public native int incGvol();

    public native int init();

    public native int loadModule(String var1);

    public native int nextOrd();

    public native int playFrame();

    public native int prevOrd();

    public native int releaseModule();

    public native int restartModule();

    public native int restartTimer();

    public native int seek(int var1);

    public native int seek(long var1);

    public native int setOrd(int var1);

    public native int softmixer();

    public native int startPlayer();

    public native int stopModule();

    public native int stopTimer();

    public native int testModule(String var1);

    public native int time();
}

