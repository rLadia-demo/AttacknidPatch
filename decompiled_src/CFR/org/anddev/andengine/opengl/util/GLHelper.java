/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Bitmap
 *  android.os.Build
 *  javax.microedition.khronos.opengles.GL10
 *  javax.microedition.khronos.opengles.GL11
 */
package org.anddev.andengine.opengl.util;

import android.graphics.Bitmap;
import android.os.Build;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;
import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.engine.options.RenderOptions;
import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.util.Debug;

public class GLHelper {
    public static final int BYTES_PER_FLOAT = 4;
    public static final int BYTES_PER_PIXEL_RGBA = 4;
    public static boolean EXTENSIONS_DRAWTEXTURE;
    public static boolean EXTENSIONS_VERTEXBUFFEROBJECTS;
    private static final int[] HARDWAREBUFFERID_CONTAINER;
    private static final int[] HARDWARETEXTUREID_CONTAINER;
    private static final boolean IS_LITTLE_ENDIAN;
    private static float sAlpha;
    private static float sBlue;
    private static int sCurrentDestinationBlendMode;
    private static int sCurrentHardwareBufferID;
    private static int sCurrentHardwareTextureID;
    private static int sCurrentMatrix;
    private static int sCurrentSourceBlendMode;
    private static FastFloatBuffer sCurrentTextureFloatBuffer;
    private static FastFloatBuffer sCurrentVertexFloatBuffer;
    private static boolean sEnableBlend;
    private static boolean sEnableCulling;
    private static boolean sEnableDepthTest;
    private static boolean sEnableDither;
    private static boolean sEnableLightning;
    private static boolean sEnableMultisample;
    private static boolean sEnableTexCoordArray;
    private static boolean sEnableTextures;
    private static boolean sEnableVertexArray;
    private static float sGreen;
    private static float sLineWidth;
    private static float sRed;

    /*
     * Enabled aggressive block sorting
     */
    static {
        boolean bl = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN;
        GLHelper.IS_LITTLE_ENDIAN = bl;
        GLHelper.HARDWARETEXTUREID_CONTAINER = new int[1];
        GLHelper.HARDWAREBUFFERID_CONTAINER = new int[1];
        GLHelper.sCurrentHardwareBufferID = -1;
        GLHelper.sCurrentHardwareTextureID = -1;
        GLHelper.sCurrentMatrix = -1;
        GLHelper.sCurrentSourceBlendMode = -1;
        GLHelper.sCurrentDestinationBlendMode = -1;
        GLHelper.sCurrentTextureFloatBuffer = null;
        GLHelper.sCurrentVertexFloatBuffer = null;
        GLHelper.sEnableDither = true;
        GLHelper.sEnableLightning = true;
        GLHelper.sEnableDepthTest = true;
        GLHelper.sEnableMultisample = true;
        GLHelper.sEnableBlend = false;
        GLHelper.sEnableCulling = false;
        GLHelper.sEnableTextures = false;
        GLHelper.sEnableTexCoordArray = false;
        GLHelper.sEnableVertexArray = false;
        GLHelper.sLineWidth = 1.0f;
        GLHelper.sRed = -1.0f;
        GLHelper.sGreen = -1.0f;
        GLHelper.sBlue = -1.0f;
        GLHelper.sAlpha = -1.0f;
        GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS = false;
        GLHelper.EXTENSIONS_DRAWTEXTURE = false;
    }

    public static void bindBuffer(GL11 gL11, int n) {
        if (GLHelper.sCurrentHardwareBufferID == n) return;
        GLHelper.sCurrentHardwareBufferID = n;
        gL11.glBindBuffer(34962, n);
    }

    public static void bindTexture(GL10 gL10, int n) {
        if (GLHelper.sCurrentHardwareTextureID == n) return;
        GLHelper.sCurrentHardwareTextureID = n;
        gL10.glBindTexture(3553, n);
    }

    public static void blendFunction(GL10 gL10, int n, int n2) {
        if (GLHelper.sCurrentSourceBlendMode == n && GLHelper.sCurrentDestinationBlendMode == n2) return;
        GLHelper.sCurrentSourceBlendMode = n;
        GLHelper.sCurrentDestinationBlendMode = n2;
        gL10.glBlendFunc(n, n2);
    }

    public static void bufferData(GL11 gL11, ByteBuffer byteBuffer, int n) {
        gL11.glBufferData(34962, byteBuffer.capacity(), (Buffer)byteBuffer, n);
    }

    /*
     * Enabled aggressive block sorting
     */
    private static Buffer convertARGBtoRGBABuffer(int[] arrn) {
        if (GLHelper.IS_LITTLE_ENDIAN) {
            int n = -1 + arrn.length;
            for (; n >= 0; --n) {
                int n2 = arrn[n];
                int n3 = 255 & n2 >> 16;
                int n4 = 255 & n2 >> 8;
                int n5 = n2 & 255;
                arrn[n] = n3 | n2 >> 24 << 24 | n5 << 16 | n4 << 8;
            }
            return IntBuffer.wrap(arrn);
        }
        int n = -1 + arrn.length;
        for (; n >= 0; --n) {
            int n6 = arrn[n];
            int n7 = 255 & n6 >> 16;
            int n8 = 255 & n6 >> 8;
            int n9 = n6 & 255;
            arrn[n] = n6 >> 24 | n7 << 24 | n8 << 16 | n9 << 8;
        }
        return IntBuffer.wrap(arrn);
    }

    public static void deleteBuffer(GL11 gL11, int n) {
        GLHelper.HARDWAREBUFFERID_CONTAINER[0] = n;
        gL11.glDeleteBuffers(1, GLHelper.HARDWAREBUFFERID_CONTAINER, 0);
    }

    public static void deleteTexture(GL10 gL10, int n) {
        GLHelper.HARDWARETEXTUREID_CONTAINER[0] = n;
        gL10.glDeleteTextures(1, GLHelper.HARDWARETEXTUREID_CONTAINER, 0);
    }

    public static void disableBlend(GL10 gL10) {
        if (!GLHelper.sEnableBlend) return;
        GLHelper.sEnableBlend = false;
        gL10.glDisable(3042);
    }

    public static void disableCulling(GL10 gL10) {
        if (!GLHelper.sEnableCulling) return;
        GLHelper.sEnableCulling = false;
        gL10.glDisable(2884);
    }

    public static void disableDepthTest(GL10 gL10) {
        if (!GLHelper.sEnableDepthTest) return;
        GLHelper.sEnableDepthTest = false;
        gL10.glDisable(2929);
    }

    public static void disableDither(GL10 gL10) {
        if (!GLHelper.sEnableDither) return;
        GLHelper.sEnableDither = false;
        gL10.glDisable(3024);
    }

    public static void disableLightning(GL10 gL10) {
        if (!GLHelper.sEnableLightning) return;
        GLHelper.sEnableLightning = false;
        gL10.glDisable(2896);
    }

    public static void disableMultisample(GL10 gL10) {
        if (!GLHelper.sEnableMultisample) return;
        GLHelper.sEnableMultisample = false;
        gL10.glDisable(32925);
    }

    public static void disableTexCoordArray(GL10 gL10) {
        if (!GLHelper.sEnableTexCoordArray) return;
        GLHelper.sEnableTexCoordArray = false;
        gL10.glDisableClientState(32888);
    }

    public static void disableTextures(GL10 gL10) {
        if (!GLHelper.sEnableTextures) return;
        GLHelper.sEnableTextures = false;
        gL10.glDisable(3553);
    }

    public static void disableVertexArray(GL10 gL10) {
        if (!GLHelper.sEnableVertexArray) return;
        GLHelper.sEnableVertexArray = false;
        gL10.glDisableClientState(32884);
    }

    public static void enableBlend(GL10 gL10) {
        if (GLHelper.sEnableBlend) return;
        GLHelper.sEnableBlend = true;
        gL10.glEnable(3042);
    }

    public static void enableCulling(GL10 gL10) {
        if (GLHelper.sEnableCulling) return;
        GLHelper.sEnableCulling = true;
        gL10.glEnable(2884);
    }

    public static void enableDepthTest(GL10 gL10) {
        if (GLHelper.sEnableDepthTest) return;
        GLHelper.sEnableDepthTest = true;
        gL10.glEnable(2929);
    }

    public static void enableDither(GL10 gL10) {
        if (GLHelper.sEnableDither) return;
        GLHelper.sEnableDither = true;
        gL10.glEnable(3024);
    }

    /*
     * Enabled aggressive block sorting
     */
    public static void enableExtensions(GL10 gL10, RenderOptions renderOptions) {
        String string = gL10.glGetString(7938);
        String string2 = gL10.glGetString(7937);
        String string3 = gL10.glGetString(7939);
        Debug.d("RENDERER: " + string2);
        Debug.d("VERSION: " + string);
        Debug.d("EXTENSIONS: " + string3);
        boolean bl = string.contains((CharSequence)"1.0");
        boolean bl2 = string2.contains((CharSequence)"PixelFlinger");
        boolean bl3 = string3.contains((CharSequence)"_vertex_buffer_object");
        boolean bl4 = string3.contains((CharSequence)"draw_texture");
        boolean bl5 = !(renderOptions.isDisableExtensionVertexBufferObjects() || bl2 || !bl3 && bl);
        GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS = bl5;
        GLHelper.EXTENSIONS_DRAWTEXTURE = bl4;
        GLHelper.hackBrokenDevices();
        Debug.d("EXTENSIONS_VERXTEXBUFFEROBJECTS = " + GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS);
        Debug.d("EXTENSIONS_DRAWTEXTURE = " + GLHelper.EXTENSIONS_DRAWTEXTURE);
    }

    public static void enableLightning(GL10 gL10) {
        if (GLHelper.sEnableLightning) return;
        GLHelper.sEnableLightning = true;
        gL10.glEnable(2896);
    }

    public static void enableMultisample(GL10 gL10) {
        if (GLHelper.sEnableMultisample) return;
        GLHelper.sEnableMultisample = true;
        gL10.glEnable(32925);
    }

    public static void enableTexCoordArray(GL10 gL10) {
        if (GLHelper.sEnableTexCoordArray) return;
        GLHelper.sEnableTexCoordArray = true;
        gL10.glEnableClientState(32888);
    }

    public static void enableTextures(GL10 gL10) {
        if (GLHelper.sEnableTextures) return;
        GLHelper.sEnableTextures = true;
        gL10.glEnable(3553);
    }

    public static void enableVertexArray(GL10 gL10) {
        if (GLHelper.sEnableVertexArray) return;
        GLHelper.sEnableVertexArray = true;
        gL10.glEnableClientState(32884);
    }

    public static int[] getPixels(Bitmap bitmap) {
        int n = bitmap.getWidth();
        int n2 = bitmap.getHeight();
        int[] arrn = new int[n * n2];
        bitmap.getPixels(arrn, 0, n, 0, 0, n, n2);
        return arrn;
    }

    public static void glTexSubImage2D(GL10 gL10, int n222, int n222, int n3, int n4, Bitmap bitmap, int n222, int n222) {
        Buffer buffer = GLHelper.convertARGBtoRGBABuffer(GLHelper.getPixels(bitmap));
        gL10.glTexSubImage2D(3553, 0, n3, n4, bitmap.getWidth(), bitmap.getHeight(), 6408, 5121, buffer);
    }

    private static void hackBrokenDevices() {
        if (!Build.PRODUCT.contains((CharSequence)"morrison")) return;
        GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS = false;
    }

    public static void lineWidth(GL10 gL10, float f) {
        if (GLHelper.sLineWidth == f) return;
        GLHelper.sLineWidth = f;
        gL10.glLineWidth(f);
    }

    public static void reset(GL10 gL10) {
        GLHelper.sCurrentHardwareBufferID = -1;
        GLHelper.sCurrentHardwareTextureID = -1;
        GLHelper.sCurrentMatrix = -1;
        GLHelper.sCurrentSourceBlendMode = -1;
        GLHelper.sCurrentDestinationBlendMode = -1;
        GLHelper.sCurrentTextureFloatBuffer = null;
        GLHelper.sCurrentVertexFloatBuffer = null;
        GLHelper.enableDither(gL10);
        GLHelper.enableLightning(gL10);
        GLHelper.enableDepthTest(gL10);
        GLHelper.enableMultisample(gL10);
        GLHelper.disableBlend(gL10);
        GLHelper.disableCulling(gL10);
        GLHelper.disableTextures(gL10);
        GLHelper.disableTexCoordArray(gL10);
        GLHelper.disableVertexArray(gL10);
        GLHelper.sLineWidth = 1.0f;
        GLHelper.sRed = -1.0f;
        GLHelper.sGreen = -1.0f;
        GLHelper.sBlue = -1.0f;
        GLHelper.sAlpha = -1.0f;
        GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS = false;
        GLHelper.EXTENSIONS_DRAWTEXTURE = false;
    }

    public static void setColor(GL10 gL10, float f, float f2, float f3, float f4) {
        if (f4 == GLHelper.sAlpha && f == GLHelper.sRed && f2 == GLHelper.sGreen && f3 == GLHelper.sBlue) return;
        GLHelper.sAlpha = f4;
        GLHelper.sRed = f;
        GLHelper.sGreen = f2;
        GLHelper.sBlue = f3;
        gL10.glColor4f(f, f2, f3, f4);
    }

    public static void setModelViewIdentityMatrix(GL10 gL10) {
        GLHelper.switchToModelViewMatrix(gL10);
        gL10.glLoadIdentity();
    }

    public static void setPerspectiveCorrectionHintFastest(GL10 gL10) {
        gL10.glHint(3152, 4353);
    }

    public static void setProjectionIdentityMatrix(GL10 gL10) {
        GLHelper.switchToProjectionMatrix(gL10);
        gL10.glLoadIdentity();
    }

    public static void setShadeModelFlat(GL10 gL10) {
        gL10.glShadeModel(7424);
    }

    public static void switchToModelViewMatrix(GL10 gL10) {
        if (GLHelper.sCurrentMatrix == 5888) return;
        GLHelper.sCurrentMatrix = 5888;
        gL10.glMatrixMode(5888);
    }

    public static void switchToProjectionMatrix(GL10 gL10) {
        if (GLHelper.sCurrentMatrix == 5889) return;
        GLHelper.sCurrentMatrix = 5889;
        gL10.glMatrixMode(5889);
    }

    public static void texCoordPointer(GL10 gL10, FastFloatBuffer fastFloatBuffer) {
        if (GLHelper.sCurrentTextureFloatBuffer == fastFloatBuffer) return;
        GLHelper.sCurrentTextureFloatBuffer = fastFloatBuffer;
        gL10.glTexCoordPointer(2, 5126, 0, (Buffer)fastFloatBuffer.mByteBuffer);
    }

    public static void texCoordZeroPointer(GL11 gL11) {
        gL11.glTexCoordPointer(2, 5126, 0, 0);
    }

    public static void vertexPointer(GL10 gL10, FastFloatBuffer fastFloatBuffer) {
        if (GLHelper.sCurrentVertexFloatBuffer == fastFloatBuffer) return;
        GLHelper.sCurrentVertexFloatBuffer = fastFloatBuffer;
        gL10.glVertexPointer(2, 5126, 0, (Buffer)fastFloatBuffer.mByteBuffer);
    }

    public static void vertexZeroPointer(GL11 gL11) {
        gL11.glVertexPointer(2, 5126, 0, 0);
    }
}

