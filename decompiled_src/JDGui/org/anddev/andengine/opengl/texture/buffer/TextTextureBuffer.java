package org.anddev.andengine.opengl.texture.buffer;

import org.anddev.andengine.opengl.buffer.BufferObject;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.font.Letter;
import org.anddev.andengine.opengl.util.FastFloatBuffer;

public class TextTextureBuffer
  extends BufferObject
{
  public TextTextureBuffer(int paramInt1, int paramInt2)
  {
    super(paramInt1, paramInt2);
  }
  
  public void update(Font paramFont, String[] paramArrayOfString)
  {
    for (;;)
    {
      FastFloatBuffer localFastFloatBuffer;
      int j;
      String str;
      int k;
      int m;
      try
      {
        localFastFloatBuffer = getFloatBuffer();
        localFastFloatBuffer.position(0);
        int i = paramArrayOfString.length;
        j = 0;
        if (j >= i)
        {
          localFastFloatBuffer.position(0);
          setHardwareBufferNeedsUpdate();
          return;
        }
        str = paramArrayOfString[j];
        k = str.length();
        m = 0;
      }
      finally {}
      Letter localLetter = paramFont.getLetter(str.charAt(m));
      float f1 = localLetter.mTextureX;
      float f2 = localLetter.mTextureY;
      float f3 = f1 + localLetter.mTextureWidth;
      float f4 = f2 + localLetter.mTextureHeight;
      localFastFloatBuffer.put(f1);
      localFastFloatBuffer.put(f2);
      localFastFloatBuffer.put(f1);
      localFastFloatBuffer.put(f4);
      localFastFloatBuffer.put(f3);
      localFastFloatBuffer.put(f4);
      localFastFloatBuffer.put(f3);
      localFastFloatBuffer.put(f4);
      localFastFloatBuffer.put(f3);
      localFastFloatBuffer.put(f2);
      localFastFloatBuffer.put(f1);
      localFastFloatBuffer.put(f2);
      m++;
      if (m >= k) {
        j++;
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.buffer.TextTextureBuffer
 * JD-Core Version:    0.7.0.1
 */