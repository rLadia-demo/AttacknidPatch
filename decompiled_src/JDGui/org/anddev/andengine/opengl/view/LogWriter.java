package org.anddev.andengine.opengl.view;

import android.util.Log;
import java.io.Writer;

class LogWriter
  extends Writer
{
  private final StringBuilder mBuilder = new StringBuilder();
  
  private void flushBuilder()
  {
    if (this.mBuilder.length() > 0)
    {
      Log.v("GLSurfaceView", this.mBuilder.toString());
      this.mBuilder.delete(0, this.mBuilder.length());
    }
  }
  
  public void close()
  {
    flushBuilder();
  }
  
  public void flush()
  {
    flushBuilder();
  }
  
  public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    int i = 0;
    if (i >= paramInt2) {
      return;
    }
    char c = paramArrayOfChar[(paramInt1 + i)];
    if (c == '\n') {
      flushBuilder();
    }
    for (;;)
    {
      i++;
      break;
      this.mBuilder.append(c);
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.view.LogWriter
 * JD-Core Version:    0.7.0.1
 */