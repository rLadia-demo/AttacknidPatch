package org.anddev.andengine.opengl.font;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.util.FloatMath;
import android.util.SparseArray;
import java.util.ArrayList;
import org.anddev.andengine.opengl.texture.Texture;

public class Font
{
  private static final int LETTER_EXTRA_WIDTH = 10;
  protected static final float LETTER_LEFT_OFFSET;
  private final Paint mBackgroundPaint;
  protected final Canvas mCanvas = new Canvas();
  private final Size mCreateLetterTemporarySize = new Size();
  private int mCurrentTextureX = 0;
  private int mCurrentTextureY = 0;
  protected final Paint.FontMetrics mFontMetrics;
  private final Rect mGetLetterBitmapTemporaryRect = new Rect();
  private final Rect mGetLetterBoundsTemporaryRect = new Rect();
  private final Rect mGetStringWidthTemporaryRect = new Rect();
  private final ArrayList<Letter> mLettersPendingToBeDrawnToTexture = new ArrayList();
  private final int mLineGap;
  private final int mLineHeight;
  private final SparseArray<Letter> mManagedCharacterToLetterMap = new SparseArray();
  protected final Paint mPaint;
  private final float[] mTemporaryTextWidthFetchers = new float[1];
  private final Texture mTexture;
  private final float mTextureHeight;
  private final float mTextureWidth;
  
  public Font(Texture paramTexture, Typeface paramTypeface, float paramFloat, boolean paramBoolean, int paramInt)
  {
    this.mTexture = paramTexture;
    this.mTextureWidth = paramTexture.getWidth();
    this.mTextureHeight = paramTexture.getHeight();
    this.mPaint = new Paint();
    this.mPaint.setTypeface(paramTypeface);
    this.mPaint.setColor(paramInt);
    this.mPaint.setTextSize(paramFloat);
    this.mPaint.setAntiAlias(paramBoolean);
    this.mBackgroundPaint = new Paint();
    this.mBackgroundPaint.setColor(0);
    this.mBackgroundPaint.setStyle(Paint.Style.FILL);
    this.mFontMetrics = this.mPaint.getFontMetrics();
    this.mLineHeight = ((int)FloatMath.ceil(Math.abs(this.mFontMetrics.ascent) + Math.abs(this.mFontMetrics.descent)));
    this.mLineGap = ((int)FloatMath.ceil(this.mFontMetrics.leading));
  }
  
  private Letter createLetter(char paramChar)
  {
    float f1 = this.mTextureWidth;
    float f2 = this.mTextureHeight;
    Size localSize = this.mCreateLetterTemporarySize;
    getLetterBounds(paramChar, localSize);
    float f3 = localSize.getWidth();
    float f4 = localSize.getHeight();
    if (f3 + this.mCurrentTextureX >= f1)
    {
      this.mCurrentTextureX = 0;
      this.mCurrentTextureY += getLineGap() + getLineHeight();
    }
    float f5 = this.mCurrentTextureX / f1;
    float f6 = this.mCurrentTextureY / f2;
    float f7 = f3 / f1;
    float f8 = f4 / f2;
    Letter localLetter = new Letter(paramChar, getLetterAdvance(paramChar), (int)f3, (int)f4, f5, f6, f7, f8);
    this.mCurrentTextureX = ((int)(f3 + this.mCurrentTextureX));
    return localLetter;
  }
  
  private int getLetterAdvance(char paramChar)
  {
    this.mPaint.getTextWidths(String.valueOf(paramChar), this.mTemporaryTextWidthFetchers);
    return (int)FloatMath.ceil(this.mTemporaryTextWidthFetchers[0]);
  }
  
  private Bitmap getLetterBitmap(char paramChar)
  {
    int i = 1;
    Rect localRect = this.mGetLetterBitmapTemporaryRect;
    String str = String.valueOf(paramChar);
    this.mPaint.getTextBounds(str, 0, i, localRect);
    int j = getLineHeight();
    if (localRect.width() == 0) {}
    for (;;)
    {
      Bitmap localBitmap = Bitmap.createBitmap(i, j, Bitmap.Config.ARGB_8888);
      this.mCanvas.setBitmap(localBitmap);
      this.mCanvas.drawRect(0.0F, 0.0F, 10 + localRect.width(), j, this.mBackgroundPaint);
      drawCharacterString(str);
      return localBitmap;
      i = 10 + localRect.width();
    }
  }
  
  private void getLetterBounds(char paramChar, Size paramSize)
  {
    this.mPaint.getTextBounds(String.valueOf(paramChar), 0, 1, this.mGetLetterBoundsTemporaryRect);
    paramSize.set(10 + this.mGetLetterBoundsTemporaryRect.width(), getLineHeight());
  }
  
  protected void drawCharacterString(String paramString)
  {
    this.mCanvas.drawText(paramString, 0.0F, -this.mFontMetrics.ascent, this.mPaint);
  }
  
  public Letter getLetter(char paramChar)
  {
    try
    {
      SparseArray localSparseArray = this.mManagedCharacterToLetterMap;
      Letter localLetter = (Letter)localSparseArray.get(paramChar);
      if (localLetter == null)
      {
        localLetter = createLetter(paramChar);
        this.mLettersPendingToBeDrawnToTexture.add(localLetter);
        localSparseArray.put(paramChar, localLetter);
      }
      return localLetter;
    }
    finally {}
  }
  
  public int getLineGap()
  {
    return this.mLineGap;
  }
  
  public int getLineHeight()
  {
    return this.mLineHeight;
  }
  
  public int getStringWidth(String paramString)
  {
    this.mPaint.getTextBounds(paramString, 0, paramString.length(), this.mGetStringWidthTemporaryRect);
    return this.mGetStringWidthTemporaryRect.width();
  }
  
  public Texture getTexture()
  {
    return this.mTexture;
  }
  
  /* Error */
  public void reload()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 57	org/anddev/andengine/opengl/font/Font:mLettersPendingToBeDrawnToTexture	Ljava/util/ArrayList;
    //   6: astore_2
    //   7: aload_0
    //   8: getfield 52	org/anddev/andengine/opengl/font/Font:mManagedCharacterToLetterMap	Landroid/util/SparseArray;
    //   11: astore_3
    //   12: aload_3
    //   13: invokevirtual 261	android/util/SparseArray:size	()I
    //   16: istore 4
    //   18: iload 4
    //   20: iconst_1
    //   21: isub
    //   22: istore 5
    //   24: iload 5
    //   26: ifge +6 -> 32
    //   29: aload_0
    //   30: monitorexit
    //   31: return
    //   32: aload_2
    //   33: aload_3
    //   34: iload 5
    //   36: invokevirtual 264	android/util/SparseArray:valueAt	(I)Ljava/lang/Object;
    //   39: checkcast 177	org/anddev/andengine/opengl/font/Letter
    //   42: invokevirtual 246	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   45: pop
    //   46: iinc 5 255
    //   49: goto -25 -> 24
    //   52: astore_1
    //   53: aload_0
    //   54: monitorexit
    //   55: aload_1
    //   56: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	57	0	this	Font
    //   52	4	1	localObject	Object
    //   6	27	2	localArrayList	ArrayList
    //   11	23	3	localSparseArray	SparseArray
    //   16	6	4	i	int
    //   22	25	5	j	int
    // Exception table:
    //   from	to	target	type
    //   2	18	52	finally
    //   32	46	52	finally
  }
  
  /* Error */
  public void update(javax.microedition.khronos.opengles.GL10 paramGL10)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 57	org/anddev/andengine/opengl/font/Font:mLettersPendingToBeDrawnToTexture	Ljava/util/ArrayList;
    //   6: astore_3
    //   7: aload_3
    //   8: invokevirtual 267	java/util/ArrayList:size	()I
    //   11: ifle +44 -> 55
    //   14: aload_0
    //   15: getfield 80	org/anddev/andengine/opengl/font/Font:mTexture	Lorg/anddev/andengine/opengl/texture/Texture;
    //   18: invokevirtual 270	org/anddev/andengine/opengl/texture/Texture:getHardwareTextureID	()I
    //   21: istore 4
    //   23: aload_0
    //   24: getfield 88	org/anddev/andengine/opengl/font/Font:mTextureWidth	F
    //   27: fstore 5
    //   29: aload_0
    //   30: getfield 93	org/anddev/andengine/opengl/font/Font:mTextureHeight	F
    //   33: fstore 6
    //   35: iconst_m1
    //   36: aload_3
    //   37: invokevirtual 267	java/util/ArrayList:size	()I
    //   40: iadd
    //   41: istore 7
    //   43: iload 7
    //   45: ifge +13 -> 58
    //   48: aload_3
    //   49: invokevirtual 273	java/util/ArrayList:clear	()V
    //   52: invokestatic 278	java/lang/System:gc	()V
    //   55: aload_0
    //   56: monitorexit
    //   57: return
    //   58: aload_3
    //   59: iload 7
    //   61: invokevirtual 279	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   64: checkcast 177	org/anddev/andengine/opengl/font/Letter
    //   67: astore 8
    //   69: aload_0
    //   70: aload 8
    //   72: getfield 283	org/anddev/andengine/opengl/font/Letter:mCharacter	C
    //   75: invokespecial 285	org/anddev/andengine/opengl/font/Font:getLetterBitmap	(C)Landroid/graphics/Bitmap;
    //   78: astore 9
    //   80: aload_1
    //   81: iload 4
    //   83: invokestatic 291	org/anddev/andengine/opengl/util/GLHelper:bindTexture	(Ljavax/microedition/khronos/opengles/GL10;I)V
    //   86: sipush 3553
    //   89: iconst_0
    //   90: fload 5
    //   92: aload 8
    //   94: getfield 294	org/anddev/andengine/opengl/font/Letter:mTextureX	F
    //   97: fmul
    //   98: f2i
    //   99: fload 6
    //   101: aload 8
    //   103: getfield 297	org/anddev/andengine/opengl/font/Letter:mTextureY	F
    //   106: fmul
    //   107: f2i
    //   108: aload 9
    //   110: invokestatic 303	android/opengl/GLUtils:texSubImage2D	(IIIILandroid/graphics/Bitmap;)V
    //   113: aload 9
    //   115: invokevirtual 306	android/graphics/Bitmap:recycle	()V
    //   118: iinc 7 255
    //   121: goto -78 -> 43
    //   124: astore_2
    //   125: aload_0
    //   126: monitorexit
    //   127: aload_2
    //   128: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	129	0	this	Font
    //   0	129	1	paramGL10	javax.microedition.khronos.opengles.GL10
    //   124	4	2	localObject	Object
    //   6	53	3	localArrayList	ArrayList
    //   21	61	4	i	int
    //   27	64	5	f1	float
    //   33	67	6	f2	float
    //   41	78	7	j	int
    //   67	35	8	localLetter	Letter
    //   78	36	9	localBitmap	Bitmap
    // Exception table:
    //   from	to	target	type
    //   2	43	124	finally
    //   48	55	124	finally
    //   58	118	124	finally
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.font.Font
 * JD-Core Version:    0.7.0.1
 */