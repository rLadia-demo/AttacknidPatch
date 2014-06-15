package org.anddev.andengine.entity.text;

import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.opengl.buffer.BufferObjectManager;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.buffer.TextTextureBuffer;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.TextVertexBuffer;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.StringUtils;

public class Text
  extends RectangularShape
{
  protected final int mCharactersMaximum;
  private final Font mFont;
  private String[] mLines;
  private int mMaximumLineWidth;
  private String mText;
  private final TextTextureBuffer mTextTextureBuffer;
  protected final int mVertexCount;
  private int[] mWidths;
  
  public Text(float paramFloat1, float paramFloat2, Font paramFont, String paramString)
  {
    this(paramFloat1, paramFloat2, paramFont, paramString, HorizontalAlign.LEFT);
  }
  
  public Text(float paramFloat1, float paramFloat2, Font paramFont, String paramString, HorizontalAlign paramHorizontalAlign)
  {
    this(paramFloat1, paramFloat2, paramFont, paramString, paramHorizontalAlign, paramString.length() - StringUtils.countOccurrences(paramString, '\n'));
  }
  
  protected Text(float paramFloat1, float paramFloat2, Font paramFont, String paramString, HorizontalAlign paramHorizontalAlign, int paramInt)
  {
    super(paramFloat1, paramFloat2, 0.0F, 0.0F, new TextVertexBuffer(paramInt, paramHorizontalAlign, 35044));
    this.mCharactersMaximum = paramInt;
    this.mVertexCount = (6 * this.mCharactersMaximum);
    this.mTextTextureBuffer = new TextTextureBuffer(2 * this.mVertexCount, 35044);
    BufferObjectManager.getActiveInstance().loadBufferObject(this.mTextTextureBuffer);
    this.mFont = paramFont;
    updateText(paramString);
    initBlendFunction();
  }
  
  private void applyTexture(GL10 paramGL10)
  {
    if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS)
    {
      GL11 localGL11 = (GL11)paramGL10;
      this.mTextTextureBuffer.selectOnHardware(localGL11);
      GLHelper.bindTexture(paramGL10, this.mFont.getTexture().getHardwareTextureID());
      GLHelper.texCoordZeroPointer(localGL11);
      return;
    }
    GLHelper.bindTexture(paramGL10, this.mFont.getTexture().getHardwareTextureID());
    GLHelper.texCoordPointer(paramGL10, this.mTextTextureBuffer.getFloatBuffer());
  }
  
  private void initBlendFunction()
  {
    if (this.mFont.getTexture().getTextureOptions().mPreMultipyAlpha) {
      setBlendFunction(1, 771);
    }
  }
  
  protected void drawVertices(GL10 paramGL10, Camera paramCamera)
  {
    paramGL10.glDrawArrays(4, 0, this.mVertexCount);
  }
  
  public int getCharacterCount()
  {
    return this.mCharactersMaximum;
  }
  
  public TextVertexBuffer getVertexBuffer()
  {
    return (TextVertexBuffer)super.getVertexBuffer();
  }
  
  protected void onApplyTransformations(GL10 paramGL10)
  {
    super.onApplyTransformations(paramGL10);
    applyTexture(paramGL10);
  }
  
  protected void onInitDraw(GL10 paramGL10)
  {
    super.onInitDraw(paramGL10);
    GLHelper.enableTextures(paramGL10);
    GLHelper.enableTexCoordArray(paramGL10);
  }
  
  protected void onUpdateVertexBuffer()
  {
    Font localFont = this.mFont;
    if (localFont != null) {
      getVertexBuffer().update(localFont, this.mMaximumLineWidth, this.mWidths, this.mLines);
    }
  }
  
  protected void updateText(String paramString)
  {
    this.mText = paramString;
    Font localFont = this.mFont;
    this.mLines = StringUtils.split(this.mText, '\n', this.mLines);
    String[] arrayOfString = this.mLines;
    int i = arrayOfString.length;
    int j;
    int[] arrayOfInt;
    int k;
    if ((this.mWidths != null) && (this.mWidths.length == i))
    {
      j = 1;
      if (j == 0) {
        this.mWidths = new int[i];
      }
      arrayOfInt = this.mWidths;
      k = 0;
    }
    for (int m = i - 1;; m--)
    {
      if (m < 0)
      {
        this.mMaximumLineWidth = k;
        this.mWidth = this.mMaximumLineWidth;
        float f1 = this.mWidth;
        this.mBaseWidth = f1;
        this.mHeight = (i * localFont.getLineHeight() + (i - 1) * localFont.getLineGap());
        float f2 = this.mHeight;
        this.mBaseHeight = f2;
        this.mRotationCenterX = (f1 * 0.5F);
        this.mRotationCenterY = (f2 * 0.5F);
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
        this.mTextTextureBuffer.update(localFont, arrayOfString);
        updateVertexBuffer();
        return;
        j = 0;
        break;
      }
      arrayOfInt[m] = localFont.getStringWidth(arrayOfString[m]);
      k = Math.max(k, arrayOfInt[m]);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.text.Text
 * JD-Core Version:    0.7.0.1
 */