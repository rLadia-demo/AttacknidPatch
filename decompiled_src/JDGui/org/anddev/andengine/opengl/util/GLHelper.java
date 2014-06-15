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
import org.anddev.andengine.util.Debug;

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
  
  static
  {
    if (ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN) {}
    for (boolean bool = true;; bool = false)
    {
      IS_LITTLE_ENDIAN = bool;
      HARDWARETEXTUREID_CONTAINER = new int[1];
      HARDWAREBUFFERID_CONTAINER = new int[1];
      sCurrentHardwareBufferID = -1;
      sCurrentHardwareTextureID = -1;
      sCurrentMatrix = -1;
      sCurrentSourceBlendMode = -1;
      sCurrentDestinationBlendMode = -1;
      sCurrentTextureFloatBuffer = null;
      sCurrentVertexFloatBuffer = null;
      sEnableDither = true;
      sEnableLightning = true;
      sEnableDepthTest = true;
      sEnableMultisample = true;
      sEnableBlend = false;
      sEnableCulling = false;
      sEnableTextures = false;
      sEnableTexCoordArray = false;
      sEnableVertexArray = false;
      sLineWidth = 1.0F;
      sRed = -1.0F;
      sGreen = -1.0F;
      sBlue = -1.0F;
      sAlpha = -1.0F;
      EXTENSIONS_VERTEXBUFFEROBJECTS = false;
      EXTENSIONS_DRAWTEXTURE = false;
      return;
    }
  }
  
  public static void bindBuffer(GL11 paramGL11, int paramInt)
  {
    if (sCurrentHardwareBufferID != paramInt)
    {
      sCurrentHardwareBufferID = paramInt;
      paramGL11.glBindBuffer(34962, paramInt);
    }
  }
  
  public static void bindTexture(GL10 paramGL10, int paramInt)
  {
    if (sCurrentHardwareTextureID != paramInt)
    {
      sCurrentHardwareTextureID = paramInt;
      paramGL10.glBindTexture(3553, paramInt);
    }
  }
  
  public static void blendFunction(GL10 paramGL10, int paramInt1, int paramInt2)
  {
    if ((sCurrentSourceBlendMode != paramInt1) || (sCurrentDestinationBlendMode != paramInt2))
    {
      sCurrentSourceBlendMode = paramInt1;
      sCurrentDestinationBlendMode = paramInt2;
      paramGL10.glBlendFunc(paramInt1, paramInt2);
    }
  }
  
  public static void bufferData(GL11 paramGL11, ByteBuffer paramByteBuffer, int paramInt)
  {
    paramGL11.glBufferData(34962, paramByteBuffer.capacity(), paramByteBuffer, paramInt);
  }
  
  private static Buffer convertARGBtoRGBABuffer(int[] paramArrayOfInt)
  {
    int i1;
    if (IS_LITTLE_ENDIAN)
    {
      i1 = -1 + paramArrayOfInt.length;
      if (i1 >= 0) {}
    }
    for (;;)
    {
      return IntBuffer.wrap(paramArrayOfInt);
      int i2 = paramArrayOfInt[i1];
      int i3 = 0xFF & i2 >> 16;
      int i4 = 0xFF & i2 >> 8;
      int i5 = i2 & 0xFF;
      paramArrayOfInt[i1] = (i3 | i2 >> 24 << 24 | i5 << 16 | i4 << 8);
      i1--;
      break;
      for (int i = -1 + paramArrayOfInt.length; i >= 0; i--)
      {
        int j = paramArrayOfInt[i];
        int k = 0xFF & j >> 16;
        int m = 0xFF & j >> 8;
        int n = j & 0xFF;
        paramArrayOfInt[i] = (j >> 24 | k << 24 | m << 16 | n << 8);
      }
    }
  }
  
  public static void deleteBuffer(GL11 paramGL11, int paramInt)
  {
    HARDWAREBUFFERID_CONTAINER[0] = paramInt;
    paramGL11.glDeleteBuffers(1, HARDWAREBUFFERID_CONTAINER, 0);
  }
  
  public static void deleteTexture(GL10 paramGL10, int paramInt)
  {
    HARDWARETEXTUREID_CONTAINER[0] = paramInt;
    paramGL10.glDeleteTextures(1, HARDWARETEXTUREID_CONTAINER, 0);
  }
  
  public static void disableBlend(GL10 paramGL10)
  {
    if (sEnableBlend)
    {
      sEnableBlend = false;
      paramGL10.glDisable(3042);
    }
  }
  
  public static void disableCulling(GL10 paramGL10)
  {
    if (sEnableCulling)
    {
      sEnableCulling = false;
      paramGL10.glDisable(2884);
    }
  }
  
  public static void disableDepthTest(GL10 paramGL10)
  {
    if (sEnableDepthTest)
    {
      sEnableDepthTest = false;
      paramGL10.glDisable(2929);
    }
  }
  
  public static void disableDither(GL10 paramGL10)
  {
    if (sEnableDither)
    {
      sEnableDither = false;
      paramGL10.glDisable(3024);
    }
  }
  
  public static void disableLightning(GL10 paramGL10)
  {
    if (sEnableLightning)
    {
      sEnableLightning = false;
      paramGL10.glDisable(2896);
    }
  }
  
  public static void disableMultisample(GL10 paramGL10)
  {
    if (sEnableMultisample)
    {
      sEnableMultisample = false;
      paramGL10.glDisable(32925);
    }
  }
  
  public static void disableTexCoordArray(GL10 paramGL10)
  {
    if (sEnableTexCoordArray)
    {
      sEnableTexCoordArray = false;
      paramGL10.glDisableClientState(32888);
    }
  }
  
  public static void disableTextures(GL10 paramGL10)
  {
    if (sEnableTextures)
    {
      sEnableTextures = false;
      paramGL10.glDisable(3553);
    }
  }
  
  public static void disableVertexArray(GL10 paramGL10)
  {
    if (sEnableVertexArray)
    {
      sEnableVertexArray = false;
      paramGL10.glDisableClientState(32884);
    }
  }
  
  public static void enableBlend(GL10 paramGL10)
  {
    if (!sEnableBlend)
    {
      sEnableBlend = true;
      paramGL10.glEnable(3042);
    }
  }
  
  public static void enableCulling(GL10 paramGL10)
  {
    if (!sEnableCulling)
    {
      sEnableCulling = true;
      paramGL10.glEnable(2884);
    }
  }
  
  public static void enableDepthTest(GL10 paramGL10)
  {
    if (!sEnableDepthTest)
    {
      sEnableDepthTest = true;
      paramGL10.glEnable(2929);
    }
  }
  
  public static void enableDither(GL10 paramGL10)
  {
    if (!sEnableDither)
    {
      sEnableDither = true;
      paramGL10.glEnable(3024);
    }
  }
  
  public static void enableExtensions(GL10 paramGL10, RenderOptions paramRenderOptions)
  {
    String str1 = paramGL10.glGetString(7938);
    String str2 = paramGL10.glGetString(7937);
    String str3 = paramGL10.glGetString(7939);
    Debug.d("RENDERER: " + str2);
    Debug.d("VERSION: " + str1);
    Debug.d("EXTENSIONS: " + str3);
    boolean bool1 = str1.contains("1.0");
    boolean bool2 = str2.contains("PixelFlinger");
    boolean bool3 = str3.contains("_vertex_buffer_object");
    boolean bool4 = str3.contains("draw_texture");
    if ((!paramRenderOptions.isDisableExtensionVertexBufferObjects()) && (!bool2) && ((bool3) || (!bool1))) {}
    for (boolean bool5 = true;; bool5 = false)
    {
      EXTENSIONS_VERTEXBUFFEROBJECTS = bool5;
      EXTENSIONS_DRAWTEXTURE = bool4;
      hackBrokenDevices();
      Debug.d("EXTENSIONS_VERXTEXBUFFEROBJECTS = " + EXTENSIONS_VERTEXBUFFEROBJECTS);
      Debug.d("EXTENSIONS_DRAWTEXTURE = " + EXTENSIONS_DRAWTEXTURE);
      return;
    }
  }
  
  public static void enableLightning(GL10 paramGL10)
  {
    if (!sEnableLightning)
    {
      sEnableLightning = true;
      paramGL10.glEnable(2896);
    }
  }
  
  public static void enableMultisample(GL10 paramGL10)
  {
    if (!sEnableMultisample)
    {
      sEnableMultisample = true;
      paramGL10.glEnable(32925);
    }
  }
  
  public static void enableTexCoordArray(GL10 paramGL10)
  {
    if (!sEnableTexCoordArray)
    {
      sEnableTexCoordArray = true;
      paramGL10.glEnableClientState(32888);
    }
  }
  
  public static void enableTextures(GL10 paramGL10)
  {
    if (!sEnableTextures)
    {
      sEnableTextures = true;
      paramGL10.glEnable(3553);
    }
  }
  
  public static void enableVertexArray(GL10 paramGL10)
  {
    if (!sEnableVertexArray)
    {
      sEnableVertexArray = true;
      paramGL10.glEnableClientState(32884);
    }
  }
  
  public static int[] getPixels(Bitmap paramBitmap)
  {
    int i = paramBitmap.getWidth();
    int j = paramBitmap.getHeight();
    int[] arrayOfInt = new int[i * j];
    paramBitmap.getPixels(arrayOfInt, 0, i, 0, 0, i, j);
    return arrayOfInt;
  }
  
  public static void glTexSubImage2D(GL10 paramGL10, int paramInt1, int paramInt2, int paramInt3, int paramInt4, Bitmap paramBitmap, int paramInt5, int paramInt6)
  {
    Buffer localBuffer = convertARGBtoRGBABuffer(getPixels(paramBitmap));
    paramGL10.glTexSubImage2D(3553, 0, paramInt3, paramInt4, paramBitmap.getWidth(), paramBitmap.getHeight(), 6408, 5121, localBuffer);
  }
  
  private static void hackBrokenDevices()
  {
    if (Build.PRODUCT.contains("morrison")) {
      EXTENSIONS_VERTEXBUFFEROBJECTS = false;
    }
  }
  
  public static void lineWidth(GL10 paramGL10, float paramFloat)
  {
    if (sLineWidth != paramFloat)
    {
      sLineWidth = paramFloat;
      paramGL10.glLineWidth(paramFloat);
    }
  }
  
  public static void reset(GL10 paramGL10)
  {
    sCurrentHardwareBufferID = -1;
    sCurrentHardwareTextureID = -1;
    sCurrentMatrix = -1;
    sCurrentSourceBlendMode = -1;
    sCurrentDestinationBlendMode = -1;
    sCurrentTextureFloatBuffer = null;
    sCurrentVertexFloatBuffer = null;
    enableDither(paramGL10);
    enableLightning(paramGL10);
    enableDepthTest(paramGL10);
    enableMultisample(paramGL10);
    disableBlend(paramGL10);
    disableCulling(paramGL10);
    disableTextures(paramGL10);
    disableTexCoordArray(paramGL10);
    disableVertexArray(paramGL10);
    sLineWidth = 1.0F;
    sRed = -1.0F;
    sGreen = -1.0F;
    sBlue = -1.0F;
    sAlpha = -1.0F;
    EXTENSIONS_VERTEXBUFFEROBJECTS = false;
    EXTENSIONS_DRAWTEXTURE = false;
  }
  
  public static void setColor(GL10 paramGL10, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if ((paramFloat4 != sAlpha) || (paramFloat1 != sRed) || (paramFloat2 != sGreen) || (paramFloat3 != sBlue))
    {
      sAlpha = paramFloat4;
      sRed = paramFloat1;
      sGreen = paramFloat2;
      sBlue = paramFloat3;
      paramGL10.glColor4f(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    }
  }
  
  public static void setModelViewIdentityMatrix(GL10 paramGL10)
  {
    switchToModelViewMatrix(paramGL10);
    paramGL10.glLoadIdentity();
  }
  
  public static void setPerspectiveCorrectionHintFastest(GL10 paramGL10)
  {
    paramGL10.glHint(3152, 4353);
  }
  
  public static void setProjectionIdentityMatrix(GL10 paramGL10)
  {
    switchToProjectionMatrix(paramGL10);
    paramGL10.glLoadIdentity();
  }
  
  public static void setShadeModelFlat(GL10 paramGL10)
  {
    paramGL10.glShadeModel(7424);
  }
  
  public static void switchToModelViewMatrix(GL10 paramGL10)
  {
    if (sCurrentMatrix != 5888)
    {
      sCurrentMatrix = 5888;
      paramGL10.glMatrixMode(5888);
    }
  }
  
  public static void switchToProjectionMatrix(GL10 paramGL10)
  {
    if (sCurrentMatrix != 5889)
    {
      sCurrentMatrix = 5889;
      paramGL10.glMatrixMode(5889);
    }
  }
  
  public static void texCoordPointer(GL10 paramGL10, FastFloatBuffer paramFastFloatBuffer)
  {
    if (sCurrentTextureFloatBuffer != paramFastFloatBuffer)
    {
      sCurrentTextureFloatBuffer = paramFastFloatBuffer;
      paramGL10.glTexCoordPointer(2, 5126, 0, paramFastFloatBuffer.mByteBuffer);
    }
  }
  
  public static void texCoordZeroPointer(GL11 paramGL11)
  {
    paramGL11.glTexCoordPointer(2, 5126, 0, 0);
  }
  
  public static void vertexPointer(GL10 paramGL10, FastFloatBuffer paramFastFloatBuffer)
  {
    if (sCurrentVertexFloatBuffer != paramFastFloatBuffer)
    {
      sCurrentVertexFloatBuffer = paramFastFloatBuffer;
      paramGL10.glVertexPointer(2, 5126, 0, paramFastFloatBuffer.mByteBuffer);
    }
  }
  
  public static void vertexZeroPointer(GL11 paramGL11)
  {
    paramGL11.glVertexPointer(2, 5126, 0, 0);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.util.GLHelper
 * JD-Core Version:    0.7.0.1
 */