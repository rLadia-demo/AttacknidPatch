package com.SixClawWorm.application;

import android.app.Activity;
import android.app.Application;
import java.util.LinkedList;
import java.util.List;

public class MeetingApplication
  extends Application
{
  public static String VERSION = "1.0";
  private static MeetingApplication instance;
  private List<Activity> mList = new LinkedList();
  
  public static MeetingApplication getInstance()
  {
    try
    {
      if (instance == null) {
        instance = new MeetingApplication();
      }
      MeetingApplication localMeetingApplication = instance;
      return localMeetingApplication;
    }
    finally {}
  }
  
  public void addActivity(Activity paramActivity)
  {
    this.mList.add(paramActivity);
  }
  
  /* Error */
  public void exit()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 25	com/SixClawWorm/application/MeetingApplication:mList	Ljava/util/List;
    //   4: invokeinterface 45 1 0
    //   9: astore_3
    //   10: aload_3
    //   11: invokeinterface 51 1 0
    //   16: istore 4
    //   18: iload 4
    //   20: ifne +8 -> 28
    //   23: iconst_0
    //   24: invokestatic 56	java/lang/System:exit	(I)V
    //   27: return
    //   28: aload_3
    //   29: invokeinterface 60 1 0
    //   34: checkcast 62	android/app/Activity
    //   37: astore 5
    //   39: aload 5
    //   41: ifnull -31 -> 10
    //   44: aload 5
    //   46: invokevirtual 65	android/app/Activity:finish	()V
    //   49: goto -39 -> 10
    //   52: astore_2
    //   53: aload_2
    //   54: invokevirtual 68	java/lang/Exception:printStackTrace	()V
    //   57: iconst_0
    //   58: invokestatic 56	java/lang/System:exit	(I)V
    //   61: return
    //   62: astore_1
    //   63: iconst_0
    //   64: invokestatic 56	java/lang/System:exit	(I)V
    //   67: aload_1
    //   68: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	69	0	this	MeetingApplication
    //   62	6	1	localObject	Object
    //   52	2	2	localException	java.lang.Exception
    //   9	20	3	localIterator	java.util.Iterator
    //   16	3	4	bool	boolean
    //   37	8	5	localActivity	Activity
    // Exception table:
    //   from	to	target	type
    //   0	10	52	java/lang/Exception
    //   10	18	52	java/lang/Exception
    //   28	39	52	java/lang/Exception
    //   44	49	52	java/lang/Exception
    //   0	10	62	finally
    //   10	18	62	finally
    //   28	39	62	finally
    //   44	49	62	finally
    //   53	57	62	finally
  }
  
  public void onCreate()
  {
    super.onCreate();
    instance = this;
  }
  
  public void onExit() {}
  
  public void onLowMemory()
  {
    super.onLowMemory();
    System.gc();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.application.MeetingApplication
 * JD-Core Version:    0.7.0.1
 */