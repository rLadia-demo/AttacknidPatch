package net.rbgrn.opengl;

import android.opengl.GLSurfaceView.EGLConfigChooser;
import android.opengl.GLSurfaceView.EGLContextFactory;
import android.opengl.GLSurfaceView.EGLWindowSurfaceFactory;
import android.opengl.GLSurfaceView.GLWrapper;
import android.view.SurfaceHolder;
import java.util.ArrayList;
import org.anddev.andengine.opengl.view.GLSurfaceView.Renderer;

class GLThread
  extends Thread
{
  public static final int DEBUG_CHECK_GL_ERROR = 1;
  public static final int DEBUG_LOG_GL_CALLS = 2;
  private static final boolean LOG_THREADS;
  public boolean mDone = false;
  private final GLSurfaceView.EGLConfigChooser mEGLConfigChooser;
  private final GLSurfaceView.EGLContextFactory mEGLContextFactory;
  private final GLSurfaceView.EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
  private EglHelper mEglHelper;
  private GLThread mEglOwner;
  private final ArrayList<Runnable> mEventQueue = new ArrayList();
  private boolean mEventsWaiting;
  private final GLSurfaceView.GLWrapper mGLWrapper;
  private boolean mHasSurface;
  private boolean mHaveEgl;
  private int mHeight = 0;
  public SurfaceHolder mHolder;
  private boolean mPaused;
  private int mRenderMode = 1;
  private final GLSurfaceView.Renderer mRenderer;
  private boolean mRequestRender = true;
  private boolean mSizeChanged = true;
  private boolean mWaitingForSurface;
  private int mWidth = 0;
  private final GLThreadManager sGLThreadManager = new GLThreadManager(null);
  
  GLThread(GLSurfaceView.Renderer paramRenderer, GLSurfaceView.EGLConfigChooser paramEGLConfigChooser, GLSurfaceView.EGLContextFactory paramEGLContextFactory, GLSurfaceView.EGLWindowSurfaceFactory paramEGLWindowSurfaceFactory, GLSurfaceView.GLWrapper paramGLWrapper)
  {
    this.mRenderer = paramRenderer;
    this.mEGLConfigChooser = paramEGLConfigChooser;
    this.mEGLContextFactory = paramEGLContextFactory;
    this.mEGLWindowSurfaceFactory = paramEGLWindowSurfaceFactory;
    this.mGLWrapper = paramGLWrapper;
  }
  
  private Runnable getEvent()
  {
    try
    {
      if (this.mEventQueue.size() > 0)
      {
        Runnable localRunnable = (Runnable)this.mEventQueue.remove(0);
        return localRunnable;
      }
      return null;
    }
    finally {}
  }
  
  /* Error */
  private void guardedRun()
    throws InterruptedException
  {
    // Byte code:
    //   0: aload_0
    //   1: new 105	net/rbgrn/opengl/EglHelper
    //   4: dup
    //   5: aload_0
    //   6: getfield 76	net/rbgrn/opengl/GLThread:mEGLConfigChooser	Landroid/opengl/GLSurfaceView$EGLConfigChooser;
    //   9: aload_0
    //   10: getfield 78	net/rbgrn/opengl/GLThread:mEGLContextFactory	Landroid/opengl/GLSurfaceView$EGLContextFactory;
    //   13: aload_0
    //   14: getfield 80	net/rbgrn/opengl/GLThread:mEGLWindowSurfaceFactory	Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;
    //   17: aload_0
    //   18: getfield 82	net/rbgrn/opengl/GLThread:mGLWrapper	Landroid/opengl/GLSurfaceView$GLWrapper;
    //   21: invokespecial 108	net/rbgrn/opengl/EglHelper:<init>	(Landroid/opengl/GLSurfaceView$EGLConfigChooser;Landroid/opengl/GLSurfaceView$EGLContextFactory;Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;Landroid/opengl/GLSurfaceView$GLWrapper;)V
    //   24: putfield 110	net/rbgrn/opengl/GLThread:mEglHelper	Lnet/rbgrn/opengl/EglHelper;
    //   27: aconst_null
    //   28: astore_1
    //   29: iconst_1
    //   30: istore_2
    //   31: iconst_1
    //   32: istore_3
    //   33: aload_0
    //   34: invokespecial 114	net/rbgrn/opengl/GLThread:isDone	()Z
    //   37: istore 7
    //   39: iload 7
    //   41: ifeq +20 -> 61
    //   44: aload_0
    //   45: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   48: astore 24
    //   50: aload 24
    //   52: monitorenter
    //   53: aload_0
    //   54: invokespecial 117	net/rbgrn/opengl/GLThread:stopEglLocked	()V
    //   57: aload 24
    //   59: monitorexit
    //   60: return
    //   61: iconst_0
    //   62: istore 8
    //   64: iconst_0
    //   65: istore 9
    //   67: iconst_0
    //   68: istore 10
    //   70: iconst_0
    //   71: istore 11
    //   73: aload_0
    //   74: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   77: astore 12
    //   79: aload 12
    //   81: monitorenter
    //   82: aload_0
    //   83: getfield 119	net/rbgrn/opengl/GLThread:mPaused	Z
    //   86: ifeq +7 -> 93
    //   89: aload_0
    //   90: invokespecial 117	net/rbgrn/opengl/GLThread:stopEglLocked	()V
    //   93: aload_0
    //   94: getfield 121	net/rbgrn/opengl/GLThread:mHasSurface	Z
    //   97: ifne +61 -> 158
    //   100: aload_0
    //   101: getfield 123	net/rbgrn/opengl/GLThread:mWaitingForSurface	Z
    //   104: ifne +19 -> 123
    //   107: aload_0
    //   108: invokespecial 117	net/rbgrn/opengl/GLThread:stopEglLocked	()V
    //   111: aload_0
    //   112: iconst_1
    //   113: putfield 123	net/rbgrn/opengl/GLThread:mWaitingForSurface	Z
    //   116: aload_0
    //   117: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   120: invokevirtual 128	java/lang/Object:notifyAll	()V
    //   123: aload_0
    //   124: getfield 64	net/rbgrn/opengl/GLThread:mDone	Z
    //   127: ifeq +72 -> 199
    //   130: aload 12
    //   132: monitorexit
    //   133: aload_0
    //   134: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   137: astore 22
    //   139: aload 22
    //   141: monitorenter
    //   142: aload_0
    //   143: invokespecial 117	net/rbgrn/opengl/GLThread:stopEglLocked	()V
    //   146: aload 22
    //   148: monitorexit
    //   149: return
    //   150: astore 23
    //   152: aload 22
    //   154: monitorexit
    //   155: aload 23
    //   157: athrow
    //   158: aload_0
    //   159: getfield 130	net/rbgrn/opengl/GLThread:mHaveEgl	Z
    //   162: ifne -39 -> 123
    //   165: aload_0
    //   166: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   169: aload_0
    //   170: invokevirtual 134	net/rbgrn/opengl/GLThread$GLThreadManager:tryAcquireEglSurface	(Lnet/rbgrn/opengl/GLThread;)Z
    //   173: ifeq -50 -> 123
    //   176: aload_0
    //   177: iconst_1
    //   178: putfield 130	net/rbgrn/opengl/GLThread:mHaveEgl	Z
    //   181: aload_0
    //   182: getfield 110	net/rbgrn/opengl/GLThread:mEglHelper	Lnet/rbgrn/opengl/EglHelper;
    //   185: invokevirtual 137	net/rbgrn/opengl/EglHelper:start	()V
    //   188: aload_0
    //   189: iconst_1
    //   190: putfield 70	net/rbgrn/opengl/GLThread:mRequestRender	Z
    //   193: iconst_1
    //   194: istore 11
    //   196: goto -73 -> 123
    //   199: aload_0
    //   200: getfield 139	net/rbgrn/opengl/GLThread:mEventsWaiting	Z
    //   203: ifeq +73 -> 276
    //   206: iconst_1
    //   207: istore 14
    //   209: aload_0
    //   210: iconst_0
    //   211: putfield 139	net/rbgrn/opengl/GLThread:mEventsWaiting	Z
    //   214: aload 12
    //   216: monitorexit
    //   217: iload 14
    //   219: ifeq +223 -> 442
    //   222: aload_0
    //   223: invokespecial 141	net/rbgrn/opengl/GLThread:getEvent	()Ljava/lang/Runnable;
    //   226: astore 16
    //   228: aload 16
    //   230: ifnull -197 -> 33
    //   233: aload 16
    //   235: invokeinterface 144 1 0
    //   240: aload_0
    //   241: invokespecial 114	net/rbgrn/opengl/GLThread:isDone	()Z
    //   244: istore 17
    //   246: iload 17
    //   248: ifeq -26 -> 222
    //   251: aload_0
    //   252: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   255: astore 18
    //   257: aload 18
    //   259: monitorenter
    //   260: aload_0
    //   261: invokespecial 117	net/rbgrn/opengl/GLThread:stopEglLocked	()V
    //   264: aload 18
    //   266: monitorexit
    //   267: return
    //   268: astore 19
    //   270: aload 18
    //   272: monitorexit
    //   273: aload 19
    //   275: athrow
    //   276: aload_0
    //   277: getfield 119	net/rbgrn/opengl/GLThread:mPaused	Z
    //   280: ifne +152 -> 432
    //   283: aload_0
    //   284: getfield 121	net/rbgrn/opengl/GLThread:mHasSurface	Z
    //   287: ifeq +145 -> 432
    //   290: aload_0
    //   291: getfield 130	net/rbgrn/opengl/GLThread:mHaveEgl	Z
    //   294: ifeq +138 -> 432
    //   297: aload_0
    //   298: getfield 66	net/rbgrn/opengl/GLThread:mWidth	I
    //   301: ifle +131 -> 432
    //   304: aload_0
    //   305: getfield 68	net/rbgrn/opengl/GLThread:mHeight	I
    //   308: ifle +124 -> 432
    //   311: aload_0
    //   312: getfield 70	net/rbgrn/opengl/GLThread:mRequestRender	Z
    //   315: ifne +11 -> 326
    //   318: aload_0
    //   319: getfield 72	net/rbgrn/opengl/GLThread:mRenderMode	I
    //   322: iconst_1
    //   323: if_icmpne +109 -> 432
    //   326: aload_0
    //   327: getfield 57	net/rbgrn/opengl/GLThread:mSizeChanged	Z
    //   330: istore 10
    //   332: aload_0
    //   333: getfield 66	net/rbgrn/opengl/GLThread:mWidth	I
    //   336: istore 8
    //   338: aload_0
    //   339: getfield 68	net/rbgrn/opengl/GLThread:mHeight	I
    //   342: istore 9
    //   344: aload_0
    //   345: iconst_0
    //   346: putfield 57	net/rbgrn/opengl/GLThread:mSizeChanged	Z
    //   349: aload_0
    //   350: iconst_0
    //   351: putfield 70	net/rbgrn/opengl/GLThread:mRequestRender	Z
    //   354: aload_0
    //   355: getfield 121	net/rbgrn/opengl/GLThread:mHasSurface	Z
    //   358: istore 20
    //   360: iconst_0
    //   361: istore 14
    //   363: iload 20
    //   365: ifeq -151 -> 214
    //   368: aload_0
    //   369: getfield 123	net/rbgrn/opengl/GLThread:mWaitingForSurface	Z
    //   372: istore 21
    //   374: iconst_0
    //   375: istore 14
    //   377: iload 21
    //   379: ifeq -165 -> 214
    //   382: iconst_1
    //   383: istore 10
    //   385: aload_0
    //   386: iconst_0
    //   387: putfield 123	net/rbgrn/opengl/GLThread:mWaitingForSurface	Z
    //   390: aload_0
    //   391: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   394: invokevirtual 128	java/lang/Object:notifyAll	()V
    //   397: iconst_0
    //   398: istore 14
    //   400: goto -186 -> 214
    //   403: astore 13
    //   405: aload 12
    //   407: monitorexit
    //   408: aload 13
    //   410: athrow
    //   411: astore 4
    //   413: aload_0
    //   414: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   417: astore 5
    //   419: aload 5
    //   421: monitorenter
    //   422: aload_0
    //   423: invokespecial 117	net/rbgrn/opengl/GLThread:stopEglLocked	()V
    //   426: aload 5
    //   428: monitorexit
    //   429: aload 4
    //   431: athrow
    //   432: aload_0
    //   433: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   436: invokevirtual 147	java/lang/Object:wait	()V
    //   439: goto -357 -> 82
    //   442: iload 11
    //   444: ifeq +8 -> 452
    //   447: iconst_1
    //   448: istore_2
    //   449: iconst_1
    //   450: istore 10
    //   452: iload 10
    //   454: ifeq +20 -> 474
    //   457: aload_0
    //   458: getfield 110	net/rbgrn/opengl/GLThread:mEglHelper	Lnet/rbgrn/opengl/EglHelper;
    //   461: aload_0
    //   462: getfield 149	net/rbgrn/opengl/GLThread:mHolder	Landroid/view/SurfaceHolder;
    //   465: invokevirtual 153	net/rbgrn/opengl/EglHelper:createSurface	(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;
    //   468: checkcast 155	javax/microedition/khronos/opengles/GL10
    //   471: astore_1
    //   472: iconst_1
    //   473: istore_3
    //   474: iload_2
    //   475: ifeq +22 -> 497
    //   478: aload_0
    //   479: getfield 74	net/rbgrn/opengl/GLThread:mRenderer	Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
    //   482: aload_1
    //   483: aload_0
    //   484: getfield 110	net/rbgrn/opengl/GLThread:mEglHelper	Lnet/rbgrn/opengl/EglHelper;
    //   487: getfield 159	net/rbgrn/opengl/EglHelper:mEglConfig	Ljavax/microedition/khronos/egl/EGLConfig;
    //   490: invokeinterface 165 3 0
    //   495: iconst_0
    //   496: istore_2
    //   497: iload_3
    //   498: ifeq +19 -> 517
    //   501: aload_0
    //   502: getfield 74	net/rbgrn/opengl/GLThread:mRenderer	Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
    //   505: aload_1
    //   506: iload 8
    //   508: iload 9
    //   510: invokeinterface 169 4 0
    //   515: iconst_0
    //   516: istore_3
    //   517: iload 8
    //   519: ifle -486 -> 33
    //   522: iload 9
    //   524: ifle -491 -> 33
    //   527: aload_0
    //   528: getfield 74	net/rbgrn/opengl/GLThread:mRenderer	Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
    //   531: aload_1
    //   532: invokeinterface 173 2 0
    //   537: aload_0
    //   538: getfield 110	net/rbgrn/opengl/GLThread:mEglHelper	Lnet/rbgrn/opengl/EglHelper;
    //   541: invokevirtual 176	net/rbgrn/opengl/EglHelper:swap	()Z
    //   544: pop
    //   545: goto -512 -> 33
    //   548: astore 6
    //   550: aload 5
    //   552: monitorexit
    //   553: aload 6
    //   555: athrow
    //   556: astore 25
    //   558: aload 24
    //   560: monitorexit
    //   561: aload 25
    //   563: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	564	0	this	GLThread
    //   28	504	1	localGL10	javax.microedition.khronos.opengles.GL10
    //   30	467	2	i	int
    //   32	485	3	j	int
    //   411	19	4	localObject1	Object
    //   417	134	5	localGLThreadManager1	GLThreadManager
    //   548	6	6	localObject2	Object
    //   37	3	7	bool1	boolean
    //   62	456	8	k	int
    //   65	458	9	m	int
    //   68	385	10	bool2	boolean
    //   71	372	11	n	int
    //   77	329	12	localGLThreadManager2	GLThreadManager
    //   403	6	13	localObject3	Object
    //   207	192	14	i1	int
    //   226	8	16	localRunnable	Runnable
    //   244	3	17	bool3	boolean
    //   255	16	18	localGLThreadManager3	GLThreadManager
    //   268	6	19	localObject4	Object
    //   358	6	20	bool4	boolean
    //   372	6	21	bool5	boolean
    //   137	16	22	localGLThreadManager4	GLThreadManager
    //   150	6	23	localObject5	Object
    //   48	511	24	localGLThreadManager5	GLThreadManager
    //   556	6	25	localObject6	Object
    // Exception table:
    //   from	to	target	type
    //   142	149	150	finally
    //   152	155	150	finally
    //   260	267	268	finally
    //   270	273	268	finally
    //   82	93	403	finally
    //   93	123	403	finally
    //   123	133	403	finally
    //   158	193	403	finally
    //   199	206	403	finally
    //   209	214	403	finally
    //   214	217	403	finally
    //   276	326	403	finally
    //   326	360	403	finally
    //   368	374	403	finally
    //   385	397	403	finally
    //   405	408	403	finally
    //   432	439	403	finally
    //   33	39	411	finally
    //   73	82	411	finally
    //   222	228	411	finally
    //   233	246	411	finally
    //   408	411	411	finally
    //   457	472	411	finally
    //   478	495	411	finally
    //   501	515	411	finally
    //   527	545	411	finally
    //   422	429	548	finally
    //   550	553	548	finally
    //   53	60	556	finally
    //   558	561	556	finally
  }
  
  private boolean isDone()
  {
    synchronized (this.sGLThreadManager)
    {
      boolean bool = this.mDone;
      return bool;
    }
  }
  
  private void stopEglLocked()
  {
    if (this.mHaveEgl)
    {
      this.mHaveEgl = false;
      this.mEglHelper.destroySurface();
      this.mEglHelper.finish();
      this.sGLThreadManager.releaseEglSurface(this);
    }
  }
  
  public int getRenderMode()
  {
    synchronized (this.sGLThreadManager)
    {
      int i = this.mRenderMode;
      return i;
    }
  }
  
  public void onPause()
  {
    synchronized (this.sGLThreadManager)
    {
      this.mPaused = true;
      this.sGLThreadManager.notifyAll();
      return;
    }
  }
  
  public void onResume()
  {
    synchronized (this.sGLThreadManager)
    {
      this.mPaused = false;
      this.mRequestRender = true;
      this.sGLThreadManager.notifyAll();
      return;
    }
  }
  
  public void onWindowResize(int paramInt1, int paramInt2)
  {
    synchronized (this.sGLThreadManager)
    {
      this.mWidth = paramInt1;
      this.mHeight = paramInt2;
      this.mSizeChanged = true;
      this.sGLThreadManager.notifyAll();
      return;
    }
  }
  
  /* Error */
  public void queueEvent(Runnable paramRunnable)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 62	net/rbgrn/opengl/GLThread:mEventQueue	Ljava/util/ArrayList;
    //   6: aload_1
    //   7: invokevirtual 197	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   10: pop
    //   11: aload_0
    //   12: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   15: astore 4
    //   17: aload 4
    //   19: monitorenter
    //   20: aload_0
    //   21: iconst_1
    //   22: putfield 139	net/rbgrn/opengl/GLThread:mEventsWaiting	Z
    //   25: aload_0
    //   26: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   29: invokevirtual 128	java/lang/Object:notifyAll	()V
    //   32: aload 4
    //   34: monitorexit
    //   35: aload_0
    //   36: monitorexit
    //   37: return
    //   38: astore 5
    //   40: aload 4
    //   42: monitorexit
    //   43: aload 5
    //   45: athrow
    //   46: astore_2
    //   47: aload_0
    //   48: monitorexit
    //   49: aload_2
    //   50: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	51	0	this	GLThread
    //   0	51	1	paramRunnable	Runnable
    //   46	4	2	localObject1	Object
    //   38	6	5	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   20	35	38	finally
    //   40	43	38	finally
    //   2	20	46	finally
    //   35	37	46	finally
    //   43	46	46	finally
    //   47	49	46	finally
  }
  
  public void requestExitAndWait()
  {
    synchronized (this.sGLThreadManager)
    {
      this.mDone = true;
      this.sGLThreadManager.notifyAll();
    }
  }
  
  public void requestRender()
  {
    synchronized (this.sGLThreadManager)
    {
      this.mRequestRender = true;
      this.sGLThreadManager.notifyAll();
      return;
    }
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: new 211	java/lang/StringBuilder
    //   4: dup
    //   5: ldc 213
    //   7: invokespecial 216	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   10: aload_0
    //   11: invokevirtual 220	net/rbgrn/opengl/GLThread:getId	()J
    //   14: invokevirtual 224	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   17: invokevirtual 228	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   20: invokevirtual 231	net/rbgrn/opengl/GLThread:setName	(Ljava/lang/String;)V
    //   23: aload_0
    //   24: invokespecial 233	net/rbgrn/opengl/GLThread:guardedRun	()V
    //   27: aload_0
    //   28: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   31: aload_0
    //   32: invokevirtual 236	net/rbgrn/opengl/GLThread$GLThreadManager:threadExiting	(Lnet/rbgrn/opengl/GLThread;)V
    //   35: return
    //   36: astore_2
    //   37: aload_0
    //   38: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   41: aload_0
    //   42: invokevirtual 236	net/rbgrn/opengl/GLThread$GLThreadManager:threadExiting	(Lnet/rbgrn/opengl/GLThread;)V
    //   45: return
    //   46: astore_1
    //   47: aload_0
    //   48: getfield 55	net/rbgrn/opengl/GLThread:sGLThreadManager	Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    //   51: aload_0
    //   52: invokevirtual 236	net/rbgrn/opengl/GLThread$GLThreadManager:threadExiting	(Lnet/rbgrn/opengl/GLThread;)V
    //   55: aload_1
    //   56: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	57	0	this	GLThread
    //   46	10	1	localObject	Object
    //   36	1	2	localInterruptedException	InterruptedException
    // Exception table:
    //   from	to	target	type
    //   23	27	36	java/lang/InterruptedException
    //   23	27	46	finally
  }
  
  public void setRenderMode(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 1)) {
      throw new IllegalArgumentException("renderMode");
    }
    synchronized (this.sGLThreadManager)
    {
      this.mRenderMode = paramInt;
      if (paramInt == 1) {
        this.sGLThreadManager.notifyAll();
      }
      return;
    }
  }
  
  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    this.mHolder = paramSurfaceHolder;
    synchronized (this.sGLThreadManager)
    {
      this.mHasSurface = true;
      this.sGLThreadManager.notifyAll();
      return;
    }
  }
  
  public void surfaceDestroyed()
  {
    synchronized (this.sGLThreadManager)
    {
      this.mHasSurface = false;
      this.sGLThreadManager.notifyAll();
      for (;;)
      {
        if ((this.mWaitingForSurface) || (!isAlive()) || (this.mDone)) {
          return;
        }
        try
        {
          this.sGLThreadManager.wait();
        }
        catch (InterruptedException localInterruptedException)
        {
          Thread.currentThread().interrupt();
        }
      }
    }
  }
  
  private class GLThreadManager
  {
    private GLThreadManager() {}
    
    public void releaseEglSurface(GLThread paramGLThread)
    {
      try
      {
        if (GLThread.this.mEglOwner == paramGLThread) {
          GLThread.this.mEglOwner = null;
        }
        notifyAll();
        return;
      }
      finally {}
    }
    
    public void threadExiting(GLThread paramGLThread)
    {
      try
      {
        paramGLThread.mDone = true;
        if (GLThread.this.mEglOwner == paramGLThread) {
          GLThread.this.mEglOwner = null;
        }
        notifyAll();
        return;
      }
      finally {}
    }
    
    /* Error */
    public boolean tryAcquireEglSurface(GLThread paramGLThread)
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 10	net/rbgrn/opengl/GLThread$GLThreadManager:this$0	Lnet/rbgrn/opengl/GLThread;
      //   6: invokestatic 23	net/rbgrn/opengl/GLThread:access$0	(Lnet/rbgrn/opengl/GLThread;)Lnet/rbgrn/opengl/GLThread;
      //   9: aload_1
      //   10: if_acmpeq +13 -> 23
      //   13: aload_0
      //   14: getfield 10	net/rbgrn/opengl/GLThread$GLThreadManager:this$0	Lnet/rbgrn/opengl/GLThread;
      //   17: invokestatic 23	net/rbgrn/opengl/GLThread:access$0	(Lnet/rbgrn/opengl/GLThread;)Lnet/rbgrn/opengl/GLThread;
      //   20: ifnonnull +21 -> 41
      //   23: aload_0
      //   24: getfield 10	net/rbgrn/opengl/GLThread$GLThreadManager:this$0	Lnet/rbgrn/opengl/GLThread;
      //   27: aload_1
      //   28: invokestatic 27	net/rbgrn/opengl/GLThread:access$1	(Lnet/rbgrn/opengl/GLThread;Lnet/rbgrn/opengl/GLThread;)V
      //   31: aload_0
      //   32: invokevirtual 30	java/lang/Object:notifyAll	()V
      //   35: iconst_1
      //   36: istore_3
      //   37: aload_0
      //   38: monitorexit
      //   39: iload_3
      //   40: ireturn
      //   41: iconst_0
      //   42: istore_3
      //   43: goto -6 -> 37
      //   46: astore_2
      //   47: aload_0
      //   48: monitorexit
      //   49: aload_2
      //   50: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	51	0	this	GLThreadManager
      //   0	51	1	paramGLThread	GLThread
      //   46	4	2	localObject	Object
      //   36	7	3	bool	boolean
      // Exception table:
      //   from	to	target	type
      //   2	23	46	finally
      //   23	35	46	finally
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     net.rbgrn.opengl.GLThread
 * JD-Core Version:    0.7.0.1
 */