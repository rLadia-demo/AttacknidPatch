package org.anddev.andengine.opengl.font;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.graphics.Paint.Style;
import android.graphics.Typeface;
import org.anddev.andengine.opengl.texture.Texture;

public class StrokeFont
  extends Font
{
  private final boolean mStrokeOnly;
  private final Paint mStrokePaint = new Paint();
  
  public StrokeFont(Texture paramTexture, Typeface paramTypeface, float paramFloat1, boolean paramBoolean, int paramInt1, float paramFloat2, int paramInt2)
  {
    this(paramTexture, paramTypeface, paramFloat1, paramBoolean, paramInt1, paramFloat2, paramInt2, false);
  }
  
  public StrokeFont(Texture paramTexture, Typeface paramTypeface, float paramFloat1, boolean paramBoolean1, int paramInt1, float paramFloat2, int paramInt2, boolean paramBoolean2)
  {
    super(paramTexture, paramTypeface, paramFloat1, paramBoolean1, paramInt1);
    this.mStrokePaint.setTypeface(paramTypeface);
    this.mStrokePaint.setStyle(Paint.Style.STROKE);
    this.mStrokePaint.setStrokeWidth(paramFloat2);
    this.mStrokePaint.setColor(paramInt2);
    this.mStrokePaint.setTextSize(paramFloat1);
    this.mStrokePaint.setAntiAlias(paramBoolean1);
    this.mStrokeOnly = paramBoolean2;
  }
  
  protected void drawCharacterString(String paramString)
  {
    if (!this.mStrokeOnly) {
      super.drawCharacterString(paramString);
    }
    this.mCanvas.drawText(paramString, 0.0F, -this.mFontMetrics.ascent, this.mStrokePaint);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.font.StrokeFont
 * JD-Core Version:    0.7.0.1
 */