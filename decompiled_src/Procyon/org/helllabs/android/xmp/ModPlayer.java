package org.helllabs.android.xmp;

import android.media.*;

public class ModPlayer
{
    private static ModPlayer instance;
    private AudioTrack audio;
    private int minSize;
    protected boolean paused;
    private Thread playThread;
    private Xmp xmp;
    
    static {
        ModPlayer.instance = null;
    }
    
    protected ModPlayer() {
        int minSize = 4096;
        super();
        this.xmp = new Xmp();
        this.minSize = AudioTrack.getMinBufferSize(44100, 3, 2);
        if (this.minSize >= minSize) {
            minSize = this.minSize;
        }
        this.audio = new AudioTrack(3, 44100, 3, 2, minSize, 1);
    }
    
    public static ModPlayer getInstance() {
        if (ModPlayer.instance == null) {
            ModPlayer.instance = new ModPlayer();
            ModPlayer.instance.xmp.init();
            ModPlayer.instance.paused = false;
        }
        return ModPlayer.instance;
    }
    
    @Override
    protected void finalize() {
        this.xmp.stopModule();
        this.paused = false;
        while (true) {
            try {
                this.playThread.join();
                this.xmp.deinit();
            }
            catch (InterruptedException ex) {
                continue;
            }
            break;
        }
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
    
    public void pause() {
        this.paused = !this.paused;
    }
    
    public void play(final String s) {
        if (this.xmp.loadModule(s) < 0) {
            return;
        }
        this.audio.play();
        this.xmp.startPlayer();
        (this.playThread = new Thread(new PlayRunnable((PlayRunnable)null))).start();
    }
    
    public void seek(final int n) {
        this.xmp.seek(n);
    }
    
    public void stop() {
        this.xmp.stopModule();
        this.paused = false;
    }
    
    public int time() {
        return this.xmp.time();
    }
    
    private class PlayRunnable implements Runnable
    {
        @Override
        public void run() {
            short[] buffer = new short[ModPlayer.this.minSize];
            while (ModPlayer.this.xmp.playFrame() == 0) {
                final int softmixer = ModPlayer.this.xmp.softmixer();
                buffer = ModPlayer.this.xmp.getBuffer(softmixer, buffer);
                ModPlayer.this.audio.write(buffer, 0, softmixer / 2);
                while (ModPlayer.this.paused) {
                    try {
                        Thread.sleep(500L);
                    }
                    catch (InterruptedException ex) {
                        break;
                    }
                }
            }
            ModPlayer.this.audio.stop();
            ModPlayer.this.xmp.endPlayer();
            ModPlayer.this.xmp.releaseModule();
        }
    }
}
