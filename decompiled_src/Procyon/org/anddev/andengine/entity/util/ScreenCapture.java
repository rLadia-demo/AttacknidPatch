package org.anddev.andengine.entity.util;

import org.anddev.andengine.entity.*;
import javax.microedition.khronos.opengles.*;
import java.nio.*;
import android.graphics.*;
import org.anddev.andengine.util.*;
import java.io.*;
import org.anddev.andengine.engine.camera.*;

public class ScreenCapture extends Entity
{
    private String mFilePath;
    private int mHeight;
    private IScreenCaptureCallback mScreenCaptureCallback;
    private boolean mScreenCapturePending;
    private int mWidth;
    
    public ScreenCapture() {
        super();
        this.mScreenCapturePending = false;
    }
    
    private static Bitmap capture(final int n, final int n2, final int n3, final int n4, final GL10 gl10) {
        final int[] array = new int[n3 * (n2 + n4)];
        final int[] array2 = new int[n3 * n4];
        final IntBuffer wrap = IntBuffer.wrap(array);
        wrap.position(0);
        gl10.glReadPixels(n, 0, n3, n2 + n4, 6408, 5121, (Buffer)wrap);
        for (int i = 0, n5 = 0; i < n4; ++i, ++n5) {
            for (int j = 0; j < n3; ++j) {
                final int n6 = array[j + i * n3];
                array2[j + n3 * (-1 + (n4 - n5))] = ((0xFF & n6 >> 16) | ((0xFF0000 & n6 << 16) | (0xFF00FF00 & n6)));
            }
        }
        return Bitmap.createBitmap(array2, n3, n4, Bitmap$Config.ARGB_8888);
    }
    
    private static void saveCapture(final int n, final int n2, final int n3, final int n4, final String s, final GL10 gl10) {
        final Bitmap capture = capture(n, n2, n3, n4, gl10);
        try {
            final FileOutputStream fileOutputStream = new FileOutputStream(s);
            capture.compress(Bitmap$CompressFormat.PNG, 100, (OutputStream)fileOutputStream);
            StreamUtils.flushCloseStream(fileOutputStream);
        }
        catch (FileNotFoundException ex) {
            Debug.e("Error saving file to: " + s, ex);
        }
    }
    
    private static void saveCapture(final int n, final int n2, final String s, final GL10 gl10) {
        saveCapture(0, 0, n, n2, s, gl10);
    }
    
    public void capture(final int mWidth, final int mHeight, final String mFilePath, final IScreenCaptureCallback mScreenCaptureCallback) {
        this.mWidth = mWidth;
        this.mHeight = mHeight;
        this.mFilePath = mFilePath;
        this.mScreenCaptureCallback = mScreenCaptureCallback;
        this.mScreenCapturePending = true;
    }
    
    @Override
    protected void onManagedDraw(final GL10 gl10, final Camera camera) {
        if (this.mScreenCapturePending) {
            saveCapture(this.mWidth, this.mHeight, this.mFilePath, gl10);
            this.mScreenCaptureCallback.onScreenCaptured(this.mFilePath);
            this.mScreenCapturePending = false;
            this.mFilePath = null;
            this.mScreenCaptureCallback = null;
        }
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
    }
    
    @Override
    public void reset() {
    }
    
    public interface IScreenCaptureCallback
    {
        void onScreenCaptured(String p0);
    }
}
