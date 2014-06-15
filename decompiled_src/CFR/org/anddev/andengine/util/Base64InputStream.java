/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.anddev.andengine.util.Base64;

public class Base64InputStream
extends FilterInputStream {
    private static final int BUFFER_SIZE = 2048;
    private static byte[] EMPTY = new byte[0];
    private final Base64.Coder coder;
    private boolean eof = false;
    private byte[] inputBuffer = new byte[2048];
    private int outputEnd;
    private int outputStart;

    public Base64InputStream(InputStream inputStream, int n) {
        this(inputStream, n, false);
    }

    /*
     * Enabled aggressive block sorting
     */
    public Base64InputStream(InputStream inputStream, int n, boolean bl) {
        super(inputStream);
        this.coder = bl ? new Base64.Encoder(n, null) : new Base64.Decoder(n, null);
        this.coder.output = new byte[this.coder.maxOutputSize(2048)];
        this.outputStart = 0;
        this.outputEnd = 0;
    }

    /*
     * Enabled aggressive block sorting
     */
    private void refill() throws IOException {
        int n;
        boolean bl;
        if (this.eof) {
            return;
        }
        if ((n = this.in.read(this.inputBuffer)) == -1) {
            this.eof = true;
            bl = this.coder.process(Base64InputStream.EMPTY, 0, 0, true);
        } else {
            bl = this.coder.process(this.inputBuffer, 0, n, false);
        }
        if (!bl) {
            throw new IOException("bad base-64");
        }
        this.outputEnd = this.coder.op;
        this.outputStart = 0;
    }

    @Override
    public int available() {
        return this.outputEnd - this.outputStart;
    }

    @Override
    public void close() throws IOException {
        this.in.close();
        this.inputBuffer = null;
    }

    @Override
    public void mark(int n) {
        throw new UnsupportedOperationException();
    }

    @Override
    public boolean markSupported() {
        return false;
    }

    @Override
    public int read() throws IOException {
        if (this.outputStart >= this.outputEnd) {
            this.refill();
        }
        if (this.outputStart >= this.outputEnd) {
            return -1;
        }
        byte[] arrby = this.coder.output;
        int n = this.outputStart;
        this.outputStart = n + 1;
        return arrby[n];
    }

    @Override
    public int read(byte[] arrby, int n, int n2) throws IOException {
        if (this.outputStart >= this.outputEnd) {
            this.refill();
        }
        if (this.outputStart >= this.outputEnd) {
            return -1;
        }
        int n3 = Math.min(n2, this.outputEnd - this.outputStart);
        System.arraycopy(this.coder.output, this.outputStart, arrby, n, n3);
        this.outputStart = n3 + this.outputStart;
        return n3;
    }

    @Override
    public void reset() {
        throw new UnsupportedOperationException();
    }

    @Override
    public long skip(long l) throws IOException {
        if (this.outputStart >= this.outputEnd) {
            this.refill();
        }
        if (this.outputStart >= this.outputEnd) {
            return 0;
        }
        long l2 = Math.min(l, (long)(this.outputEnd - this.outputStart));
        this.outputStart = (int)(l2 + (long)this.outputStart);
        return l2;
    }
}

