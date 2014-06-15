/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.Log
 */
package org.anddev.andengine.opengl.view;

import android.util.Log;
import java.io.Writer;

class LogWriter
extends Writer {
    private final StringBuilder mBuilder = new StringBuilder();

    LogWriter() {
    }

    private void flushBuilder() {
        if (this.mBuilder.length() <= 0) return;
        Log.v((String)"GLSurfaceView", (String)this.mBuilder.toString());
        this.mBuilder.delete(0, this.mBuilder.length());
    }

    @Override
    public void close() {
        this.flushBuilder();
    }

    @Override
    public void flush() {
        this.flushBuilder();
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public void write(char[] arrc, int n, int n2) {
        for (int i = 0; i < n2; ++i) {
            char c = arrc[n + i];
            if (c == '\u000a') {
                this.flushBuilder();
                continue;
            }
            this.mBuilder.append(c);
        }
    }
}

