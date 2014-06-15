package org.anddev.andengine.opengl.util;

import javax.microedition.khronos.opengles.*;
import java.nio.*;
import org.anddev.andengine.engine.options.*;
import org.anddev.andengine.util.*;
import android.graphics.*;
import android.os.*;

public class GLHelper
{
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
    
    static {
        IS_LITTLE_ENDIAN = (ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN);
        HARDWARETEXTUREID_CONTAINER = new int[1];
        HARDWAREBUFFERID_CONTAINER = new int[1];
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
    
    public static void bindBuffer(final GL11 gl11, final int sCurrentHardwareBufferID) {
        if (GLHelper.sCurrentHardwareBufferID != sCurrentHardwareBufferID) {
            gl11.glBindBuffer(34962, GLHelper.sCurrentHardwareBufferID = sCurrentHardwareBufferID);
        }
    }
    
    public static void bindTexture(final GL10 gl10, final int sCurrentHardwareTextureID) {
        if (GLHelper.sCurrentHardwareTextureID != sCurrentHardwareTextureID) {
            gl10.glBindTexture(3553, GLHelper.sCurrentHardwareTextureID = sCurrentHardwareTextureID);
        }
    }
    
    public static void blendFunction(final GL10 gl10, final int sCurrentSourceBlendMode, final int sCurrentDestinationBlendMode) {
        if (GLHelper.sCurrentSourceBlendMode != sCurrentSourceBlendMode || GLHelper.sCurrentDestinationBlendMode != sCurrentDestinationBlendMode) {
            gl10.glBlendFunc(GLHelper.sCurrentSourceBlendMode = sCurrentSourceBlendMode, GLHelper.sCurrentDestinationBlendMode = sCurrentDestinationBlendMode);
        }
    }
    
    public static void bufferData(final GL11 gl11, final ByteBuffer byteBuffer, final int n) {
        gl11.glBufferData(34962, byteBuffer.capacity(), (Buffer)byteBuffer, n);
    }
    
    private static Buffer convertARGBtoRGBABuffer(final int[] array) {
        if (GLHelper.IS_LITTLE_ENDIAN) {
            for (int i = -1 + array.length; i >= 0; --i) {
                final int n = array[i];
                array[i] = ((0xFF & n >> 16) | (n >> 24 << 24 | (n & 0xFF) << 16 | (0xFF & n >> 8) << 8));
            }
        }
        else {
            for (int j = -1 + array.length; j >= 0; --j) {
                final int n2 = array[j];
                array[j] = (n2 >> 24 | ((0xFF & n2 >> 16) << 24 | (0xFF & n2 >> 8) << 16 | (n2 & 0xFF) << 8));
            }
        }
        return IntBuffer.wrap(array);
    }
    
    public static void deleteBuffer(final GL11 gl11, final int n) {
        GLHelper.HARDWAREBUFFERID_CONTAINER[0] = n;
        gl11.glDeleteBuffers(1, GLHelper.HARDWAREBUFFERID_CONTAINER, 0);
    }
    
    public static void deleteTexture(final GL10 gl10, final int n) {
        GLHelper.HARDWARETEXTUREID_CONTAINER[0] = n;
        gl10.glDeleteTextures(1, GLHelper.HARDWARETEXTUREID_CONTAINER, 0);
    }
    
    public static void disableBlend(final GL10 gl10) {
        if (GLHelper.sEnableBlend) {
            GLHelper.sEnableBlend = false;
            gl10.glDisable(3042);
        }
    }
    
    public static void disableCulling(final GL10 gl10) {
        if (GLHelper.sEnableCulling) {
            GLHelper.sEnableCulling = false;
            gl10.glDisable(2884);
        }
    }
    
    public static void disableDepthTest(final GL10 gl10) {
        if (GLHelper.sEnableDepthTest) {
            GLHelper.sEnableDepthTest = false;
            gl10.glDisable(2929);
        }
    }
    
    public static void disableDither(final GL10 gl10) {
        if (GLHelper.sEnableDither) {
            GLHelper.sEnableDither = false;
            gl10.glDisable(3024);
        }
    }
    
    public static void disableLightning(final GL10 gl10) {
        if (GLHelper.sEnableLightning) {
            GLHelper.sEnableLightning = false;
            gl10.glDisable(2896);
        }
    }
    
    public static void disableMultisample(final GL10 gl10) {
        if (GLHelper.sEnableMultisample) {
            GLHelper.sEnableMultisample = false;
            gl10.glDisable(32925);
        }
    }
    
    public static void disableTexCoordArray(final GL10 gl10) {
        if (GLHelper.sEnableTexCoordArray) {
            GLHelper.sEnableTexCoordArray = false;
            gl10.glDisableClientState(32888);
        }
    }
    
    public static void disableTextures(final GL10 gl10) {
        if (GLHelper.sEnableTextures) {
            GLHelper.sEnableTextures = false;
            gl10.glDisable(3553);
        }
    }
    
    public static void disableVertexArray(final GL10 gl10) {
        if (GLHelper.sEnableVertexArray) {
            GLHelper.sEnableVertexArray = false;
            gl10.glDisableClientState(32884);
        }
    }
    
    public static void enableBlend(final GL10 gl10) {
        if (!GLHelper.sEnableBlend) {
            GLHelper.sEnableBlend = true;
            gl10.glEnable(3042);
        }
    }
    
    public static void enableCulling(final GL10 gl10) {
        if (!GLHelper.sEnableCulling) {
            GLHelper.sEnableCulling = true;
            gl10.glEnable(2884);
        }
    }
    
    public static void enableDepthTest(final GL10 gl10) {
        if (!GLHelper.sEnableDepthTest) {
            GLHelper.sEnableDepthTest = true;
            gl10.glEnable(2929);
        }
    }
    
    public static void enableDither(final GL10 gl10) {
        if (!GLHelper.sEnableDither) {
            GLHelper.sEnableDither = true;
            gl10.glEnable(3024);
        }
    }
    
    public static void enableExtensions(final GL10 gl10, final RenderOptions renderOptions) {
        final String glGetString = gl10.glGetString(7938);
        final String glGetString2 = gl10.glGetString(7937);
        final String glGetString3 = gl10.glGetString(7939);
        Debug.d("RENDERER: " + glGetString2);
        Debug.d("VERSION: " + glGetString);
        Debug.d("EXTENSIONS: " + glGetString3);
        final boolean contains = glGetString.contains("1.0");
        final boolean contains2 = glGetString2.contains("PixelFlinger");
        final boolean contains3 = glGetString3.contains("_vertex_buffer_object");
        final boolean contains4 = glGetString3.contains("draw_texture");
        GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS = (!renderOptions.isDisableExtensionVertexBufferObjects() && !contains2 && (contains3 || !contains));
        GLHelper.EXTENSIONS_DRAWTEXTURE = contains4;
        hackBrokenDevices();
        Debug.d("EXTENSIONS_VERXTEXBUFFEROBJECTS = " + GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS);
        Debug.d("EXTENSIONS_DRAWTEXTURE = " + GLHelper.EXTENSIONS_DRAWTEXTURE);
    }
    
    public static void enableLightning(final GL10 gl10) {
        if (!GLHelper.sEnableLightning) {
            GLHelper.sEnableLightning = true;
            gl10.glEnable(2896);
        }
    }
    
    public static void enableMultisample(final GL10 gl10) {
        if (!GLHelper.sEnableMultisample) {
            GLHelper.sEnableMultisample = true;
            gl10.glEnable(32925);
        }
    }
    
    public static void enableTexCoordArray(final GL10 gl10) {
        if (!GLHelper.sEnableTexCoordArray) {
            GLHelper.sEnableTexCoordArray = true;
            gl10.glEnableClientState(32888);
        }
    }
    
    public static void enableTextures(final GL10 gl10) {
        if (!GLHelper.sEnableTextures) {
            GLHelper.sEnableTextures = true;
            gl10.glEnable(3553);
        }
    }
    
    public static void enableVertexArray(final GL10 gl10) {
        if (!GLHelper.sEnableVertexArray) {
            GLHelper.sEnableVertexArray = true;
            gl10.glEnableClientState(32884);
        }
    }
    
    public static int[] getPixels(final Bitmap bitmap) {
        final int width = bitmap.getWidth();
        final int height = bitmap.getHeight();
        final int[] array = new int[width * height];
        bitmap.getPixels(array, 0, width, 0, 0, width, height);
        return array;
    }
    
    public static void glTexSubImage2D(final GL10 gl10, final int n, final int n2, final int n3, final int n4, final Bitmap bitmap, final int n5, final int n6) {
        gl10.glTexSubImage2D(3553, 0, n3, n4, bitmap.getWidth(), bitmap.getHeight(), 6408, 5121, convertARGBtoRGBABuffer(getPixels(bitmap)));
    }
    
    private static void hackBrokenDevices() {
        if (Build.PRODUCT.contains("morrison")) {
            GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS = false;
        }
    }
    
    public static void lineWidth(final GL10 gl10, final float sLineWidth) {
        if (GLHelper.sLineWidth != sLineWidth) {
            gl10.glLineWidth(GLHelper.sLineWidth = sLineWidth);
        }
    }
    
    public static void reset(final GL10 gl10) {
        GLHelper.sCurrentHardwareBufferID = -1;
        GLHelper.sCurrentHardwareTextureID = -1;
        GLHelper.sCurrentMatrix = -1;
        GLHelper.sCurrentSourceBlendMode = -1;
        GLHelper.sCurrentDestinationBlendMode = -1;
        GLHelper.sCurrentTextureFloatBuffer = null;
        GLHelper.sCurrentVertexFloatBuffer = null;
        enableDither(gl10);
        enableLightning(gl10);
        enableDepthTest(gl10);
        enableMultisample(gl10);
        disableBlend(gl10);
        disableCulling(gl10);
        disableTextures(gl10);
        disableTexCoordArray(gl10);
        disableVertexArray(gl10);
        GLHelper.sLineWidth = 1.0f;
        GLHelper.sRed = -1.0f;
        GLHelper.sGreen = -1.0f;
        GLHelper.sBlue = -1.0f;
        GLHelper.sAlpha = -1.0f;
        GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS = false;
        GLHelper.EXTENSIONS_DRAWTEXTURE = false;
    }
    
    public static void setColor(final GL10 gl10, final float sRed, final float sGreen, final float sBlue, final float sAlpha) {
        if (sAlpha != GLHelper.sAlpha || sRed != GLHelper.sRed || sGreen != GLHelper.sGreen || sBlue != GLHelper.sBlue) {
            GLHelper.sAlpha = sAlpha;
            gl10.glColor4f(GLHelper.sRed = sRed, GLHelper.sGreen = sGreen, GLHelper.sBlue = sBlue, sAlpha);
        }
    }
    
    public static void setModelViewIdentityMatrix(final GL10 gl10) {
        switchToModelViewMatrix(gl10);
        gl10.glLoadIdentity();
    }
    
    public static void setPerspectiveCorrectionHintFastest(final GL10 gl10) {
        gl10.glHint(3152, 4353);
    }
    
    public static void setProjectionIdentityMatrix(final GL10 gl10) {
        switchToProjectionMatrix(gl10);
        gl10.glLoadIdentity();
    }
    
    public static void setShadeModelFlat(final GL10 gl10) {
        gl10.glShadeModel(7424);
    }
    
    public static void switchToModelViewMatrix(final GL10 gl10) {
        if (GLHelper.sCurrentMatrix != 5888) {
            gl10.glMatrixMode(GLHelper.sCurrentMatrix = 5888);
        }
    }
    
    public static void switchToProjectionMatrix(final GL10 gl10) {
        if (GLHelper.sCurrentMatrix != 5889) {
            gl10.glMatrixMode(GLHelper.sCurrentMatrix = 5889);
        }
    }
    
    public static void texCoordPointer(final GL10 gl10, final FastFloatBuffer sCurrentTextureFloatBuffer) {
        if (GLHelper.sCurrentTextureFloatBuffer != sCurrentTextureFloatBuffer) {
            GLHelper.sCurrentTextureFloatBuffer = sCurrentTextureFloatBuffer;
            gl10.glTexCoordPointer(2, 5126, 0, (Buffer)sCurrentTextureFloatBuffer.mByteBuffer);
        }
    }
    
    public static void texCoordZeroPointer(final GL11 gl11) {
        gl11.glTexCoordPointer(2, 5126, 0, 0);
    }
    
    public static void vertexPointer(final GL10 gl10, final FastFloatBuffer sCurrentVertexFloatBuffer) {
        if (GLHelper.sCurrentVertexFloatBuffer != sCurrentVertexFloatBuffer) {
            GLHelper.sCurrentVertexFloatBuffer = sCurrentVertexFloatBuffer;
            gl10.glVertexPointer(2, 5126, 0, (Buffer)sCurrentVertexFloatBuffer.mByteBuffer);
        }
    }
    
    public static void vertexZeroPointer(final GL11 gl11) {
        gl11.glVertexPointer(2, 5126, 0, 0);
    }
}
