/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Writer;
import java.util.Scanner;

public class StreamUtils {
    public static final int IO_BUFFER_SIZE = 8192;

    public static void closeStream(Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
            return;
        }
        catch (IOException var1_1) {
            var1_1.printStackTrace();
            return;
        }
    }

    public static void copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        StreamUtils.copy(inputStream, outputStream, -1);
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    public static void copy(InputStream var0, OutputStream var1_1, long var2_2) throws IOException {
        block2 : {
            var4_3 = new byte[8192];
            var5_4 = var2_2;
            ** if (var2_2 >= 0) goto lbl11
lbl4: // 2 sources:
            while ((var8_5 = var0.read(var4_3)) != -1) {
                var1_1.write(var4_3, 0, var8_5);
            }
            ** GOTO lbl14
            while (var5_4 > (long)var7_6) {
                var1_1.write(var4_3, 0, var7_6);
                var5_4-=(long)var7_6;
lbl11: // 2 sources:
                if ((var7_6 = var0.read(var4_3)) != -1) continue;
                break block2;
            }
            var1_1.write(var4_3, 0, (int)var5_4);
        }
        var1_1.flush();
    }

    public static boolean copyAndClose(InputStream inputStream, OutputStream outputStream) {
        try {
            StreamUtils.copy(inputStream, outputStream, -1);
            return true;
        }
        catch (IOException var3_2) {
            return false;
        }
        finally {
            StreamUtils.closeStream(inputStream);
            StreamUtils.closeStream(outputStream);
        }
    }

    public static void flushCloseStream(OutputStream outputStream) {
        if (outputStream == null) return;
        try {
            outputStream.flush();
            StreamUtils.closeStream(outputStream);
            return;
        }
        catch (IOException var1_1) {
            var1_1.printStackTrace();
            return;
        }
    }

    public static void flushCloseWriter(Writer writer) {
        if (writer == null) return;
        try {
            writer.flush();
            StreamUtils.closeStream(writer);
            return;
        }
        catch (IOException var1_1) {
            var1_1.printStackTrace();
            return;
        }
    }

    public static final String readFully(InputStream inputStream) throws IOException {
        StringBuilder stringBuilder = new StringBuilder();
        Scanner scanner = new Scanner(inputStream);
        while (scanner.hasNextLine()) {
            stringBuilder.append(scanner.nextLine());
        }
        return stringBuilder.toString();
    }

    public static byte[] streamToBytes(InputStream inputStream) throws IOException {
        return StreamUtils.streamToBytes(inputStream, -1);
    }

    public static byte[] streamToBytes(InputStream inputStream, int n) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(Math.min(n, 8192));
        StreamUtils.copy(inputStream, byteArrayOutputStream, n);
        return byteArrayOutputStream.toByteArray();
    }
}

