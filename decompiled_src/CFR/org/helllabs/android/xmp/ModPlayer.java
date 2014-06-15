/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.media.AudioTrack
 */
package org.helllabs.android.xmp;

import android.media.AudioTrack;
import org.helllabs.android.xmp.Xmp;

public class ModPlayer {
    private static ModPlayer instance = null;
    private AudioTrack audio;
    private int minSize;
    protected boolean paused;
    private Thread playThread;
    private Xmp xmp;

    /*
     * Enabled aggressive block sorting
     */
    protected ModPlayer() {
        int n = 4096;
        this.xmp = new Xmp();
        this.minSize = AudioTrack.getMinBufferSize((int)44100, (int)3, (int)2);
        if (this.minSize >= n) {
            n = this.minSize;
        }
        this.audio = new AudioTrack(3, 44100, 3, 2, n, 1);
    }

    public static ModPlayer getInstance() {
        if (ModPlayer.instance != null) return ModPlayer.instance;
        ModPlayer.instance = new ModPlayer();
        ModPlayer.instance.xmp.init();
        ModPlayer.instance.paused = false;
        return ModPlayer.instance;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    protected void finalize() {
        this.xmp.stopModule();
        this.paused = false;
        try {
            this.playThread.join();
        }
        catch (InterruptedException var2_1) {}
        this.xmp.deinit();
    }

    public int getPlayBpm() {
        return this.xmp.getPlayBpm();
    }

    public int getPlayPat() {
        return this.xmp.getPlayPat();
    }

    public int getPlayPos() {
        return this.xmp.getPlayPos();
    }

    public int getPlayTempo() {
        return this.xmp.getPlayTempo();
    }

    public boolean isPaused() {
        return this.paused;
    }

    /*
     * Enabled aggressive block sorting
     */
    public void pause() {
        boolean bl = this.paused ? false : true;
        this.paused = bl;
    }

    public void play(String string) {
        if (this.xmp.loadModule(string) < 0) {
            return;
        }
        this.audio.play();
        this.xmp.startPlayer();
        this.playThread = new Thread(new PlayRunnable(null));
        this.playThread.start();
    }

    public void seek(int n) {
        this.xmp.seek(n);
    }

    public void stop() {
        this.xmp.stopModule();
        this.paused = false;
    }

    public int time() {
        return this.xmp.time();
    }

    class PlayRunnable
    implements Runnable {
        private PlayRunnable() {
        }

        /* synthetic */ PlayRunnable(ModPlayer modPlayer, PlayRunnable playRunnable) {
            this();
        }

        @Override
        public void run() {
            short[] arrs = new short[this$0.minSize];
            block2 : do {
                if (this$0.xmp.playFrame() != 0) {
                    this$0.audio.stop();
                    this$0.xmp.endPlayer();
                    this$0.xmp.releaseModule();
                    return;
                }
                int n = this$0.xmp.softmixer();
                arrs = this$0.xmp.getBuffer(n, arrs);
                this$0.audio.write(arrs, 0, n / 2);
                do {
                    if (!this$0.paused) continue block2;
                    try {
                        Thread.sleep(500);
                        continue;
                    }
                    catch (InterruptedException var4_3) {
                        continue block2;
                    }
                } while (true);
                break;
            } while (true);
        }
    }

}

