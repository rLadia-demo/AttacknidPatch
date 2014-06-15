package org.anddev.andengine.util;

import java.util.*;
import java.io.*;

public class StreamUtils
{
    public static final int IO_BUFFER_SIZE = 8192;
    
    public static void closeStream(final Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        }
        catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
    public static void copy(final InputStream inputStream, final OutputStream outputStream) throws IOException {
        copy(inputStream, outputStream, -1L);
    }
    
    public static void copy(final InputStream inputStream, final OutputStream outputStream, final long n) throws IOException {
        final byte[] array = new byte[8192];
        long n2 = n;
        if (n < 0L) {
            while (true) {
                final int read = inputStream.read(array);
                if (read == -1) {
                    break;
                }
                outputStream.write(array, 0, read);
            }
        }
        else {
            Label_0073: {
                break Label_0073;
                int i = 0;
                do {
                    if (n2 <= i) {
                        outputStream.write(array, 0, (int)n2);
                        break;
                    }
                    outputStream.write(array, 0, i);
                    n2 -= i;
                    i = inputStream.read(array);
                } while (i != -1);
            }
        }
        outputStream.flush();
    }
    
    public static boolean copyAndClose(final InputStream inputStream, final OutputStream outputStream) {
        try {
            copy(inputStream, outputStream, -1L);
            return true;
        }
        catch (IOException ex) {
            return false;
        }
        finally {
            closeStream(inputStream);
            closeStream(outputStream);
        }
    }
    
    public static void flushCloseStream(final OutputStream outputStream) {
        if (outputStream == null) {
            return;
        }
        try {
            outputStream.flush();
            closeStream(outputStream);
        }
        catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
    public static void flushCloseWriter(final Writer writer) {
        if (writer == null) {
            return;
        }
        try {
            writer.flush();
            closeStream(writer);
        }
        catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
    public static final String readFully(final InputStream inputStream) throws IOException {
        final StringBuilder sb = new StringBuilder();
        final Scanner scanner = new Scanner(inputStream);
        while (scanner.hasNextLine()) {
            sb.append(scanner.nextLine());
        }
        return sb.toString();
    }
    
    public static byte[] streamToBytes(final InputStream inputStream) throws IOException {
        return streamToBytes(inputStream, -1);
    }
    
    public static byte[] streamToBytes(final InputStream inputStream, final int n) throws IOException {
        final ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(Math.min(n, 8192));
        copy(inputStream, byteArrayOutputStream, n);
        return byteArrayOutputStream.toByteArray();
    }
}
