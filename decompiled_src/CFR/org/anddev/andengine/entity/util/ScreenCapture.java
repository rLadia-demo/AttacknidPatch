/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$CompressFormat
 *  android.graphics.Bitmap$Config
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.util;

import android.graphics.Bitmap;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.Buffer;
import java.nio.IntBuffer;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.StreamUtils;

public class ScreenCapture
extends Entity {
    private String mFilePath;
    private int mHeight;
    private IScreenCaptureCallback mScreenCaptureCallback;
    private boolean mScreenCapturePending = false;
    private int mWidth;

    private static Bitmap capture(int n, int n2, int n3, int n4, GL10 gL10) {
        int[] arrn = new int[n3 * (n2 + n4)];
        int[] arrn2 = new int[n3 * n4];
        IntBuffer intBuffer = IntBuffer.wrap(arrn);
        intBuffer.position(0);
        gL10.glReadPixels(n, 0, n3, n2 + n4, 6408, 5121, (Buffer)intBuffer);
        int n5 = 0;
        int n6 = 0;
        block0 : while (n5 < n4) {
            int n7 = 0;
            do {
                int n8;
                if (n7 >= n3) {
                    ++n5;
                    ++n6;
                    continue block0;
                }
                int n9 = arrn[n7 + n5 * n3];
                arrn2[n7 + n3 * (-1 + n4 - n6)] = n8 = 255 & n9 >> 16 | 16711680 & n9 << 16 | -16711936 & n9;
                ++n7;
            } while (true);
            break;
        }
        return Bitmap.createBitmap((int[])arrn2, (int)n3, (int)n4, (Bitmap.Config)Bitmap.Config.ARGB_8888);
    }

    private static void saveCapture(int n, int n2, int n3, int n4, String string, GL10 gL10) {
        Bitmap bitmap = ScreenCapture.capture(n, n2, n3, n4, gL10);
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(string);
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, (OutputStream)fileOutputStream);
            StreamUtils.flushCloseStream(fileOutputStream);
            return;
        }
        catch (FileNotFoundException var8_8) {
            Debug.e("Error saving file to: " + string, var8_8);
            return;
        }
    }

    private static void saveCapture(int n, int n2, String string, GL10 gL10) {
        ScreenCapture.saveCapture(0, 0, n, n2, string, gL10);
    }

    public void capture(int n, int n2, String string, IScreenCaptureCallback iScreenCaptureCallback) {
        this.mWidth = n;
        this.mHeight = n2;
        this.mFilePath = string;
        this.mScreenCaptureCallback = iScreenCaptureCallback;
        this.mScreenCapturePending = true;
    }

    @Override
    protected void onManagedDraw(GL10 gL10, Camera camera) {
        if (!this.mScreenCapturePending) return;
        ScreenCapture.saveCapture(this.mWidth, this.mHeight, this.mFilePath, gL10);
        this.mScreenCaptureCallback.onScreenCaptured(this.mFilePath);
        this.mScreenCapturePending = false;
        this.mFilePath = null;
        this.mScreenCaptureCallback = null;
    }

    @Override
    protected void onManagedUpdate(float f) {
    }

    @Override
    public void reset() {
    }

    public interface IScreenCaptureCallback {
        public void onScreenCaptured(String var1);
    }

}

