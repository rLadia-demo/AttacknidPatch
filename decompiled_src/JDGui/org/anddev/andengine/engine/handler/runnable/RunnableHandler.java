package org.anddev.andengine.engine.handler.runnable;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;

public class RunnableHandler
  implements IUpdateHandler
{
  private final ArrayList<Runnable> mRunnables = new ArrayList();
  
  /* Error */
  public void onUpdate(float paramFloat)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 18	org/anddev/andengine/engine/handler/runnable/RunnableHandler:mRunnables	Ljava/util/ArrayList;
    //   6: astore_3
    //   7: iconst_m1
    //   8: aload_3
    //   9: invokevirtual 24	java/util/ArrayList:size	()I
    //   12: iadd
    //   13: istore 4
    //   15: iload 4
    //   17: ifge +10 -> 27
    //   20: aload_3
    //   21: invokevirtual 27	java/util/ArrayList:clear	()V
    //   24: aload_0
    //   25: monitorexit
    //   26: return
    //   27: aload_3
    //   28: iload 4
    //   30: invokevirtual 31	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   33: checkcast 33	java/lang/Runnable
    //   36: invokeinterface 36 1 0
    //   41: iinc 4 255
    //   44: goto -29 -> 15
    //   47: astore_2
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_2
    //   51: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	52	0	this	RunnableHandler
    //   0	52	1	paramFloat	float
    //   47	4	2	localObject	Object
    //   6	22	3	localArrayList	ArrayList
    //   13	29	4	i	int
    // Exception table:
    //   from	to	target	type
    //   2	15	47	finally
    //   20	24	47	finally
    //   27	41	47	finally
  }
  
  public void postRunnable(Runnable paramRunnable)
  {
    try
    {
      this.mRunnables.add(paramRunnable);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void reset()
  {
    this.mRunnables.clear();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.handler.runnable.RunnableHandler
 * JD-Core Version:    0.7.0.1
 */