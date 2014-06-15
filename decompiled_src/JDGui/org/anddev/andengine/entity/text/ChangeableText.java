package org.anddev.andengine.entity.text;

import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.StringUtils;

public class ChangeableText
  extends Text
{
  private static final String ELLIPSIS = "...";
  private static final int ELLIPSIS_CHARACTER_COUNT = "...".length();
  private int mCharacterCountCurrentText;
  
  public ChangeableText(float paramFloat1, float paramFloat2, Font paramFont, String paramString)
  {
    this(paramFloat1, paramFloat2, paramFont, paramString, paramString.length() - StringUtils.countOccurrences(paramString, '\n'));
  }
  
  public ChangeableText(float paramFloat1, float paramFloat2, Font paramFont, String paramString, int paramInt)
  {
    this(paramFloat1, paramFloat2, paramFont, paramString, HorizontalAlign.LEFT, paramInt);
  }
  
  public ChangeableText(float paramFloat1, float paramFloat2, Font paramFont, String paramString, HorizontalAlign paramHorizontalAlign, int paramInt)
  {
    super(paramFloat1, paramFloat2, paramFont, paramString, paramHorizontalAlign, paramInt);
    this.mCharacterCountCurrentText = (paramString.length() - StringUtils.countOccurrences(paramString, '\n'));
  }
  
  protected void drawVertices(GL10 paramGL10, Camera paramCamera)
  {
    paramGL10.glDrawArrays(4, 0, 6 * this.mCharacterCountCurrentText);
  }
  
  public void setText(String paramString)
  {
    setText(paramString, false);
  }
  
  public void setText(String paramString, boolean paramBoolean)
  {
    int i = paramString.length() - StringUtils.countOccurrences(paramString, '\n');
    if (i > this.mCharactersMaximum)
    {
      if ((paramBoolean) && (this.mCharactersMaximum > ELLIPSIS_CHARACTER_COUNT)) {
        updateText(paramString.substring(0, this.mCharactersMaximum - ELLIPSIS_CHARACTER_COUNT).concat("..."));
      }
      for (;;)
      {
        this.mCharacterCountCurrentText = this.mCharactersMaximum;
        return;
        updateText(paramString.substring(0, this.mCharactersMaximum));
      }
    }
    updateText(paramString);
    this.mCharacterCountCurrentText = i;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.text.ChangeableText
 * JD-Core Version:    0.7.0.1
 */