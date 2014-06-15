package org.anddev.andengine.util;

import java.io.*;

public class Base64InputStream extends FilterInputStream
{
    private static final int BUFFER_SIZE = 2048;
    private static byte[] EMPTY;
    private final Base64.Coder coder;
    private boolean eof;
    private byte[] inputBuffer;
    private int outputEnd;
    private int outputStart;
    
    static {
        Base64InputStream.EMPTY = new byte[0];
    }
    
    public Base64InputStream(final InputStream inputStream, final int n) {
        this(inputStream, n, false);
    }
    
    public Base64InputStream(final InputStream inputStream, final int n, final boolean b) {
        super(inputStream);
        this.eof = false;
        this.inputBuffer = new byte[2048];
        if (b) {
            this.coder = new Base64.Encoder(n, null);
        }
        else {
            this.coder = new Base64.Decoder(n, null);
        }
        this.coder.output = new byte[this.coder.maxOutputSize(2048)];
        this.outputStart = 0;
        this.outputEnd = 0;
    }
    
    private void refill() throws IOException {
        if (this.eof) {
            return;
        }
        final int read = this.in.read(this.inputBuffer);
        boolean b;
        if (read == -1) {
            this.eof = true;
            b = this.coder.process(Base64InputStream.EMPTY, 0, 0, true);
        }
        else {
            b = this.coder.process(this.inputBuffer, 0, read, false);
        }
        if (!b) {
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
    public void mark(final int n) {
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
        return this.coder.output[this.outputStart++];
    }
    
    @Override
    public int read(final byte[] array, final int n, final int n2) throws IOException {
        if (this.outputStart >= this.outputEnd) {
            this.refill();
        }
        if (this.outputStart >= this.outputEnd) {
            return -1;
        }
        final int min = Math.min(n2, this.outputEnd - this.outputStart);
        System.arraycopy(this.coder.output, this.outputStart, array, n, min);
        this.outputStart += min;
        return min;
    }
    
    @Override
    public void reset() {
        throw new UnsupportedOperationException();
    }
    
    @Override
    public long skip(final long n) throws IOException {
        if (this.outputStart >= this.outputEnd) {
            this.refill();
        }
        if (this.outputStart >= this.outputEnd) {
            return 0L;
        }
        final long min = Math.min(n, this.outputEnd - this.outputStart);
        this.outputStart += (int)min;
        return min;
    }
}
