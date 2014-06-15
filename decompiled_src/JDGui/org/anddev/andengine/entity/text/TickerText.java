package org.anddev.andengine.entity.text;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.util.HorizontalAlign;

public class TickerText
  extends Text
{
  private float mCharactersPerSecond;
  private int mCharactersVisible = 0;
  private float mDuration;
  private boolean mReverse = false;
  private float mSecondsElapsed = 0.0F;
  
  public TickerText(float paramFloat1, float paramFloat2, Font paramFont, String paramString, HorizontalAlign paramHorizontalAlign, float paramFloat3)
  {
    super(paramFloat1, paramFloat2, paramFont, paramString, paramHorizontalAlign);
    setCharactersPerSecond(paramFloat3);
  }
  
  protected void drawVertices(GL10 paramGL10, Camera paramCamera)
  {
    paramGL10.glDrawArrays(4, 0, 6 * this.mCharactersVisible);
  }
  
  public float getCharactersPerSecond()
  {
    return this.mCharactersPerSecond;
  }
  
  public int getCharactersVisible()
  {
    return this.mCharactersVisible;
  }
  
  public boolean isReverse()
  {
    return this.mReverse;
  }
  
  protected void onManagedUpdate(float paramFloat)
  {
    super.onManagedUpdate(paramFloat);
    if (this.mReverse) {
      if (this.mCharactersVisible < this.mCharactersMaximum)
      {
        this.mSecondsElapsed = Math.max(0.0F, this.mSecondsElapsed - paramFloat);
        this.mCharactersVisible = ((int)(this.mSecondsElapsed * this.mCharactersPerSecond));
      }
    }
    while (this.mCharactersVisible >= this.mCharactersMaximum) {
      return;
    }
    this.mSecondsElapsed = Math.min(this.mDuration, paramFloat + this.mSecondsElapsed);
    this.mCharactersVisible = ((int)(this.mSecondsElapsed * this.mCharactersPerSecond));
  }
  
  public void reset()
  {
    super.reset();
    this.mCharactersVisible = 0;
    this.mSecondsElapsed = 0.0F;
    this.mReverse = false;
  }
  
  public void setCharactersPerSecond(float paramFloat)
  {
    this.mCharactersPerSecond = paramFloat;
    this.mDuration = (this.mCharactersMaximum * this.mCharactersPerSecond);
  }
  
  public void setReverse(boolean paramBoolean)
  {
    this.mReverse = paramBoolean;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.text.TickerText
 * JD-Core Version:    0.7.0.1
 */