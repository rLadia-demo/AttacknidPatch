package org.anddev.andengine.opengl.font;

public class Letter
{
  public final int mAdvance;
  public final char mCharacter;
  public final int mHeight;
  public final float mTextureHeight;
  public final float mTextureWidth;
  public final float mTextureX;
  public final float mTextureY;
  public final int mWidth;
  
  Letter(char paramChar, int paramInt1, int paramInt2, int paramInt3, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mCharacter = paramChar;
    this.mAdvance = paramInt1;
    this.mWidth = paramInt2;
    this.mHeight = paramInt3;
    this.mTextureX = paramFloat1;
    this.mTextureY = paramFloat2;
    this.mTextureWidth = paramFloat3;
    this.mTextureHeight = paramFloat4;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    Letter localLetter;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localLetter = (Letter)paramObject;
    } while (this.mCharacter == localLetter.mCharacter);
    return false;
  }
  
  public int hashCode()
  {
    return '\037' + this.mCharacter;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.font.Letter
 * JD-Core Version:    0.7.0.1
 */