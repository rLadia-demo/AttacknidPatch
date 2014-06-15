package org.anddev.andengine.opengl.vertex;

import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.font.Letter;
import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.util.HorizontalAlign;

public class TextVertexBuffer
  extends VertexBuffer
{
  public static final int VERTICES_PER_CHARACTER = 6;
  private final HorizontalAlign mHorizontalAlign;
  
  public TextVertexBuffer(int paramInt1, HorizontalAlign paramHorizontalAlign, int paramInt2)
  {
    super(paramInt1 * 12, paramInt2);
    this.mHorizontalAlign = paramHorizontalAlign;
  }
  
  public void update(Font paramFont, int paramInt, int[] paramArrayOfInt, String[] paramArrayOfString)
  {
    for (;;)
    {
      int[] arrayOfInt;
      int i;
      int j;
      int m;
      String str;
      int i1;
      int i2;
      int i3;
      int i5;
      try
      {
        arrayOfInt = this.mBufferData;
        i = 0;
        j = paramFont.getLineHeight();
        int k = paramArrayOfString.length;
        m = 0;
        if (m >= k)
        {
          FastFloatBuffer localFastFloatBuffer = getFloatBuffer();
          localFastFloatBuffer.position(0);
          localFastFloatBuffer.put(arrayOfInt);
          localFastFloatBuffer.position(0);
          super.setHardwareBufferNeedsUpdate();
          return;
        }
        str = paramArrayOfString[m];
        switch (this.mHorizontalAlign)
        {
        case RIGHT: 
          i1 = m * (paramFont.getLineHeight() + paramFont.getLineGap());
          i2 = Float.floatToRawIntBits(i1);
          i3 = str.length();
          i4 = i;
          i5 = 0;
        }
      }
      finally {}
      int n = paramInt - paramArrayOfInt[m];
      continue;
      n = paramInt - paramArrayOfInt[m] >> 1;
      continue;
      Letter localLetter = paramFont.getLetter(str.charAt(i5));
      int i6 = i1 + j;
      int i7 = n + localLetter.mWidth;
      int i8 = Float.floatToRawIntBits(n);
      int i9 = Float.floatToRawIntBits(i7);
      int i10 = Float.floatToRawIntBits(i6);
      int i11 = i4 + 1;
      arrayOfInt[i4] = i8;
      int i12 = i11 + 1;
      arrayOfInt[i11] = i2;
      int i13 = i12 + 1;
      arrayOfInt[i12] = i8;
      int i14 = i13 + 1;
      arrayOfInt[i13] = i10;
      int i15 = i14 + 1;
      arrayOfInt[i14] = i9;
      int i16 = i15 + 1;
      arrayOfInt[i15] = i10;
      int i17 = i16 + 1;
      arrayOfInt[i16] = i9;
      int i18 = i17 + 1;
      arrayOfInt[i17] = i10;
      int i19 = i18 + 1;
      arrayOfInt[i18] = i9;
      int i20 = i19 + 1;
      arrayOfInt[i19] = i2;
      int i21 = i20 + 1;
      arrayOfInt[i20] = i8;
      int i4 = i21 + 1;
      arrayOfInt[i21] = i2;
      int i22 = localLetter.mAdvance;
      n += i22;
      i5++;
      break label410;
      n = 0;
      continue;
      label410:
      if (i5 >= i3)
      {
        m++;
        i = i4;
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.vertex.TextVertexBuffer
 * JD-Core Version:    0.7.0.1
 */