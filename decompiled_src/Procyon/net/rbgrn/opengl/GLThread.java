package net.rbgrn.opengl;

import java.util.*;
import android.opengl.*;
import android.view.*;
import org.anddev.andengine.opengl.view.*;

class GLThread extends Thread
{
    public static final int DEBUG_CHECK_GL_ERROR = 1;
    public static final int DEBUG_LOG_GL_CALLS = 2;
    private static final boolean LOG_THREADS;
    public boolean mDone;
    private final GLSurfaceView$EGLConfigChooser mEGLConfigChooser;
    private final GLSurfaceView$EGLContextFactory mEGLContextFactory;
    private final GLSurfaceView$EGLWindowSurfaceFactory mEGLWindowSurfaceFactory;
    private EglHelper mEglHelper;
    private GLThread mEglOwner;
    private final ArrayList<Runnable> mEventQueue;
    private boolean mEventsWaiting;
    private final GLSurfaceView$GLWrapper mGLWrapper;
    private boolean mHasSurface;
    private boolean mHaveEgl;
    private int mHeight;
    public SurfaceHolder mHolder;
    private boolean mPaused;
    private int mRenderMode;
    private final GLSurfaceView.Renderer mRenderer;
    private boolean mRequestRender;
    private boolean mSizeChanged;
    private boolean mWaitingForSurface;
    private int mWidth;
    private final GLThreadManager sGLThreadManager;
    
    GLThread(final GLSurfaceView.Renderer mRenderer, final GLSurfaceView$EGLConfigChooser meglConfigChooser, final GLSurfaceView$EGLContextFactory meglContextFactory, final GLSurfaceView$EGLWindowSurfaceFactory meglWindowSurfaceFactory, final GLSurfaceView$GLWrapper mglWrapper) {
        super();
        this.sGLThreadManager = new GLThreadManager((GLThreadManager)null);
        this.mSizeChanged = true;
        this.mEventQueue = new ArrayList<Runnable>();
        this.mDone = false;
        this.mWidth = 0;
        this.mHeight = 0;
        this.mRequestRender = true;
        this.mRenderMode = 1;
        this.mRenderer = mRenderer;
        this.mEGLConfigChooser = meglConfigChooser;
        this.mEGLContextFactory = meglContextFactory;
        this.mEGLWindowSurfaceFactory = meglWindowSurfaceFactory;
        this.mGLWrapper = mglWrapper;
    }
    
    static /* synthetic */ void access$1(final GLThread glThread, final GLThread mEglOwner) {
        glThread.mEglOwner = mEglOwner;
    }
    
    private Runnable getEvent() {
        synchronized (this) {
            if (this.mEventQueue.size() > 0) {
                return this.mEventQueue.remove(0);
            }
            return null;
        }
    }
    
    private void guardedRun() throws InterruptedException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: new             Lnet/rbgrn/opengl/EglHelper;
        //     4: dup            
        //     5: aload_0        
        //     6: getfield        net/rbgrn/opengl/GLThread.mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;
        //     9: aload_0        
        //    10: getfield        net/rbgrn/opengl/GLThread.mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;
        //    13: aload_0        
        //    14: getfield        net/rbgrn/opengl/GLThread.mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;
        //    17: aload_0        
        //    18: getfield        net/rbgrn/opengl/GLThread.mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;
        //    21: invokespecial   net/rbgrn/opengl/EglHelper.<init>:(Landroid/opengl/GLSurfaceView$EGLConfigChooser;Landroid/opengl/GLSurfaceView$EGLContextFactory;Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;Landroid/opengl/GLSurfaceView$GLWrapper;)V
        //    24: putfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //    27: aconst_null    
        //    28: astore_1       
        //    29: iconst_1       
        //    30: istore_2       
        //    31: iconst_1       
        //    32: istore_3       
        //    33: aload_0        
        //    34: invokespecial   net/rbgrn/opengl/GLThread.isDone:()Z
        //    37: istore          7
        //    39: iload           7
        //    41: ifeq            61
        //    44: aload_0        
        //    45: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //    48: astore          24
        //    50: aload           24
        //    52: monitorenter   
        //    53: aload_0        
        //    54: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //    57: aload           24
        //    59: monitorexit    
        //    60: return         
        //    61: iconst_0       
        //    62: istore          8
        //    64: iconst_0       
        //    65: istore          9
        //    67: iconst_0       
        //    68: istore          10
        //    70: iconst_0       
        //    71: istore          11
        //    73: aload_0        
        //    74: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //    77: astore          12
        //    79: aload           12
        //    81: monitorenter   
        //    82: aload_0        
        //    83: getfield        net/rbgrn/opengl/GLThread.mPaused:Z
        //    86: ifeq            93
        //    89: aload_0        
        //    90: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //    93: aload_0        
        //    94: getfield        net/rbgrn/opengl/GLThread.mHasSurface:Z
        //    97: ifne            158
        //   100: aload_0        
        //   101: getfield        net/rbgrn/opengl/GLThread.mWaitingForSurface:Z
        //   104: ifne            123
        //   107: aload_0        
        //   108: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //   111: aload_0        
        //   112: iconst_1       
        //   113: putfield        net/rbgrn/opengl/GLThread.mWaitingForSurface:Z
        //   116: aload_0        
        //   117: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   120: invokevirtual   java/lang/Object.notifyAll:()V
        //   123: aload_0        
        //   124: getfield        net/rbgrn/opengl/GLThread.mDone:Z
        //   127: ifeq            199
        //   130: aload           12
        //   132: monitorexit    
        //   133: aload_0        
        //   134: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   137: astore          22
        //   139: aload           22
        //   141: monitorenter   
        //   142: aload_0        
        //   143: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //   146: aload           22
        //   148: monitorexit    
        //   149: return         
        //   150: astore          23
        //   152: aload           22
        //   154: monitorexit    
        //   155: aload           23
        //   157: athrow         
        //   158: aload_0        
        //   159: getfield        net/rbgrn/opengl/GLThread.mHaveEgl:Z
        //   162: ifne            123
        //   165: aload_0        
        //   166: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   169: aload_0        
        //   170: invokevirtual   net/rbgrn/opengl/GLThread$GLThreadManager.tryAcquireEglSurface:(Lnet/rbgrn/opengl/GLThread;)Z
        //   173: ifeq            123
        //   176: aload_0        
        //   177: iconst_1       
        //   178: putfield        net/rbgrn/opengl/GLThread.mHaveEgl:Z
        //   181: aload_0        
        //   182: getfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //   185: invokevirtual   net/rbgrn/opengl/EglHelper.start:()V
        //   188: aload_0        
        //   189: iconst_1       
        //   190: putfield        net/rbgrn/opengl/GLThread.mRequestRender:Z
        //   193: iconst_1       
        //   194: istore          11
        //   196: goto            123
        //   199: aload_0        
        //   200: getfield        net/rbgrn/opengl/GLThread.mEventsWaiting:Z
        //   203: ifeq            276
        //   206: iconst_1       
        //   207: istore          14
        //   209: aload_0        
        //   210: iconst_0       
        //   211: putfield        net/rbgrn/opengl/GLThread.mEventsWaiting:Z
        //   214: aload           12
        //   216: monitorexit    
        //   217: iload           14
        //   219: ifeq            442
        //   222: aload_0        
        //   223: invokespecial   net/rbgrn/opengl/GLThread.getEvent:()Ljava/lang/Runnable;
        //   226: astore          16
        //   228: aload           16
        //   230: ifnull          33
        //   233: aload           16
        //   235: invokeinterface java/lang/Runnable.run:()V
        //   240: aload_0        
        //   241: invokespecial   net/rbgrn/opengl/GLThread.isDone:()Z
        //   244: istore          17
        //   246: iload           17
        //   248: ifeq            222
        //   251: aload_0        
        //   252: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   255: astore          18
        //   257: aload           18
        //   259: monitorenter   
        //   260: aload_0        
        //   261: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //   264: aload           18
        //   266: monitorexit    
        //   267: return         
        //   268: astore          19
        //   270: aload           18
        //   272: monitorexit    
        //   273: aload           19
        //   275: athrow         
        //   276: aload_0        
        //   277: getfield        net/rbgrn/opengl/GLThread.mPaused:Z
        //   280: ifne            432
        //   283: aload_0        
        //   284: getfield        net/rbgrn/opengl/GLThread.mHasSurface:Z
        //   287: ifeq            432
        //   290: aload_0        
        //   291: getfield        net/rbgrn/opengl/GLThread.mHaveEgl:Z
        //   294: ifeq            432
        //   297: aload_0        
        //   298: getfield        net/rbgrn/opengl/GLThread.mWidth:I
        //   301: ifle            432
        //   304: aload_0        
        //   305: getfield        net/rbgrn/opengl/GLThread.mHeight:I
        //   308: ifle            432
        //   311: aload_0        
        //   312: getfield        net/rbgrn/opengl/GLThread.mRequestRender:Z
        //   315: ifne            326
        //   318: aload_0        
        //   319: getfield        net/rbgrn/opengl/GLThread.mRenderMode:I
        //   322: iconst_1       
        //   323: if_icmpne       432
        //   326: aload_0        
        //   327: getfield        net/rbgrn/opengl/GLThread.mSizeChanged:Z
        //   330: istore          10
        //   332: aload_0        
        //   333: getfield        net/rbgrn/opengl/GLThread.mWidth:I
        //   336: istore          8
        //   338: aload_0        
        //   339: getfield        net/rbgrn/opengl/GLThread.mHeight:I
        //   342: istore          9
        //   344: aload_0        
        //   345: iconst_0       
        //   346: putfield        net/rbgrn/opengl/GLThread.mSizeChanged:Z
        //   349: aload_0        
        //   350: iconst_0       
        //   351: putfield        net/rbgrn/opengl/GLThread.mRequestRender:Z
        //   354: aload_0        
        //   355: getfield        net/rbgrn/opengl/GLThread.mHasSurface:Z
        //   358: istore          20
        //   360: iconst_0       
        //   361: istore          14
        //   363: iload           20
        //   365: ifeq            214
        //   368: aload_0        
        //   369: getfield        net/rbgrn/opengl/GLThread.mWaitingForSurface:Z
        //   372: istore          21
        //   374: iconst_0       
        //   375: istore          14
        //   377: iload           21
        //   379: ifeq            214
        //   382: iconst_1       
        //   383: istore          10
        //   385: aload_0        
        //   386: iconst_0       
        //   387: putfield        net/rbgrn/opengl/GLThread.mWaitingForSurface:Z
        //   390: aload_0        
        //   391: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   394: invokevirtual   java/lang/Object.notifyAll:()V
        //   397: iconst_0       
        //   398: istore          14
        //   400: goto            214
        //   403: astore          13
        //   405: aload           12
        //   407: monitorexit    
        //   408: aload           13
        //   410: athrow         
        //   411: astore          4
        //   413: aload_0        
        //   414: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   417: astore          5
        //   419: aload           5
        //   421: monitorenter   
        //   422: aload_0        
        //   423: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //   426: aload           5
        //   428: monitorexit    
        //   429: aload           4
        //   431: athrow         
        //   432: aload_0        
        //   433: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   436: invokevirtual   java/lang/Object.wait:()V
        //   439: goto            82
        //   442: iload           11
        //   444: ifeq            452
        //   447: iconst_1       
        //   448: istore_2       
        //   449: iconst_1       
        //   450: istore          10
        //   452: iload           10
        //   454: ifeq            474
        //   457: aload_0        
        //   458: getfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //   461: aload_0        
        //   462: getfield        net/rbgrn/opengl/GLThread.mHolder:Landroid/view/SurfaceHolder;
        //   465: invokevirtual   net/rbgrn/opengl/EglHelper.createSurface:(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;
        //   468: checkcast       Ljavax/microedition/khronos/opengles/GL10;
        //   471: astore_1       
        //   472: iconst_1       
        //   473: istore_3       
        //   474: iload_2        
        //   475: ifeq            497
        //   478: aload_0        
        //   479: getfield        net/rbgrn/opengl/GLThread.mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
        //   482: aload_1        
        //   483: aload_0        
        //   484: getfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //   487: getfield        net/rbgrn/opengl/EglHelper.mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;
        //   490: invokeinterface org/anddev/andengine/opengl/view/GLSurfaceView$Renderer.onSurfaceCreated:(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
        //   495: iconst_0       
        //   496: istore_2       
        //   497: iload_3        
        //   498: ifeq            517
        //   501: aload_0        
        //   502: getfield        net/rbgrn/opengl/GLThread.mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
        //   505: aload_1        
        //   506: iload           8
        //   508: iload           9
        //   510: invokeinterface org/anddev/andengine/opengl/view/GLSurfaceView$Renderer.onSurfaceChanged:(Ljavax/microedition/khronos/opengles/GL10;II)V
        //   515: iconst_0       
        //   516: istore_3       
        //   517: iload           8
        //   519: ifle            33
        //   522: iload           9
        //   524: ifle            33
        //   527: aload_0        
        //   528: getfield        net/rbgrn/opengl/GLThread.mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
        //   531: aload_1        
        //   532: invokeinterface org/anddev/andengine/opengl/view/GLSurfaceView$Renderer.onDrawFrame:(Ljavax/microedition/khronos/opengles/GL10;)V
        //   537: aload_0        
        //   538: getfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //   541: invokevirtual   net/rbgrn/opengl/EglHelper.swap:()Z
        //   544: pop            
        //   545: goto            33
        //   548: astore          6
        //   550: aload           5
        //   552: monitorexit    
        //   553: aload           6
        //   555: athrow         
        //   556: astore          25
        //   558: aload           24
        //   560: monitorexit    
        //   561: aload           25
        //   563: athrow         
        //    Exceptions:
        //  throws java.lang.InterruptedException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  33     39     411    556    Any
        //  53     60     556    564    Any
        //  73     82     411    556    Any
        //  82     93     403    411    Any
        //  93     123    403    411    Any
        //  123    133    403    411    Any
        //  142    149    150    158    Any
        //  152    155    150    158    Any
        //  158    193    403    411    Any
        //  199    206    403    411    Any
        //  209    214    403    411    Any
        //  214    217    403    411    Any
        //  222    228    411    556    Any
        //  233    246    411    556    Any
        //  260    267    268    276    Any
        //  270    273    268    276    Any
        //  276    326    403    411    Any
        //  326    360    403    411    Any
        //  368    374    403    411    Any
        //  385    397    403    411    Any
        //  405    408    403    411    Any
        //  408    411    411    556    Any
        //  422    429    548    556    Any
        //  432    439    403    411    Any
        //  457    472    411    556    Any
        //  478    495    411    556    Any
        //  501    515    411    556    Any
        //  527    545    411    556    Any
        //  550    553    548    556    Any
        //  558    561    556    564    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0061:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:654)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:531)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
        // 
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     0: aload_0        
        //     1: new             Lnet/rbgrn/opengl/EglHelper;
        //     4: dup            
        //     5: aload_0        
        //     6: getfield        net/rbgrn/opengl/GLThread.mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;
        //     9: aload_0        
        //    10: getfield        net/rbgrn/opengl/GLThread.mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;
        //    13: aload_0        
        //    14: getfield        net/rbgrn/opengl/GLThread.mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;
        //    17: aload_0        
        //    18: getfield        net/rbgrn/opengl/GLThread.mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;
        //    21: invokespecial   net/rbgrn/opengl/EglHelper.<init>:(Landroid/opengl/GLSurfaceView$EGLConfigChooser;Landroid/opengl/GLSurfaceView$EGLContextFactory;Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;Landroid/opengl/GLSurfaceView$GLWrapper;)V
        //    24: putfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //    27: aconst_null    
        //    28: astore_1       
        //    29: iconst_1       
        //    30: istore_2       
        //    31: iconst_1       
        //    32: istore_3       
        //    33: aload_0        
        //    34: invokespecial   net/rbgrn/opengl/GLThread.isDone:()Z
        //    37: istore          7
        //    39: iload           7
        //    41: ifeq            61
        //    44: aload_0        
        //    45: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //    48: astore          24
        //    50: aload           24
        //    52: monitorenter   
        //    53: aload_0        
        //    54: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //    57: aload           24
        //    59: monitorexit    
        //    60: return         
        //    61: iconst_0       
        //    62: istore          8
        //    64: iconst_0       
        //    65: istore          9
        //    67: iconst_0       
        //    68: istore          10
        //    70: iconst_0       
        //    71: istore          11
        //    73: aload_0        
        //    74: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //    77: astore          12
        //    79: aload           12
        //    81: monitorenter   
        //    82: aload_0        
        //    83: getfield        net/rbgrn/opengl/GLThread.mPaused:Z
        //    86: ifeq            93
        //    89: aload_0        
        //    90: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //    93: aload_0        
        //    94: getfield        net/rbgrn/opengl/GLThread.mHasSurface:Z
        //    97: ifne            158
        //   100: aload_0        
        //   101: getfield        net/rbgrn/opengl/GLThread.mWaitingForSurface:Z
        //   104: ifne            123
        //   107: aload_0        
        //   108: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //   111: aload_0        
        //   112: iconst_1       
        //   113: putfield        net/rbgrn/opengl/GLThread.mWaitingForSurface:Z
        //   116: aload_0        
        //   117: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   120: invokevirtual   java/lang/Object.notifyAll:()V
        //   123: aload_0        
        //   124: getfield        net/rbgrn/opengl/GLThread.mDone:Z
        //   127: ifeq            199
        //   130: aload           12
        //   132: monitorexit    
        //   133: aload_0        
        //   134: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   137: astore          22
        //   139: aload           22
        //   141: monitorenter   
        //   142: aload_0        
        //   143: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //   146: aload           22
        //   148: monitorexit    
        //   149: return         
        //   150: astore          23
        //   152: aload           22
        //   154: monitorexit    
        //   155: aload           23
        //   157: athrow         
        //   158: aload_0        
        //   159: getfield        net/rbgrn/opengl/GLThread.mHaveEgl:Z
        //   162: ifne            123
        //   165: aload_0        
        //   166: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   169: aload_0        
        //   170: invokevirtual   net/rbgrn/opengl/GLThread$GLThreadManager.tryAcquireEglSurface:(Lnet/rbgrn/opengl/GLThread;)Z
        //   173: ifeq            123
        //   176: aload_0        
        //   177: iconst_1       
        //   178: putfield        net/rbgrn/opengl/GLThread.mHaveEgl:Z
        //   181: aload_0        
        //   182: getfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //   185: invokevirtual   net/rbgrn/opengl/EglHelper.start:()V
        //   188: aload_0        
        //   189: iconst_1       
        //   190: putfield        net/rbgrn/opengl/GLThread.mRequestRender:Z
        //   193: iconst_1       
        //   194: istore          11
        //   196: goto            123
        //   199: aload_0        
        //   200: getfield        net/rbgrn/opengl/GLThread.mEventsWaiting:Z
        //   203: ifeq            276
        //   206: iconst_1       
        //   207: istore          14
        //   209: aload_0        
        //   210: iconst_0       
        //   211: putfield        net/rbgrn/opengl/GLThread.mEventsWaiting:Z
        //   214: aload           12
        //   216: monitorexit    
        //   217: iload           14
        //   219: ifeq            442
        //   222: aload_0        
        //   223: invokespecial   net/rbgrn/opengl/GLThread.getEvent:()Ljava/lang/Runnable;
        //   226: astore          16
        //   228: aload           16
        //   230: ifnull          33
        //   233: aload           16
        //   235: invokeinterface java/lang/Runnable.run:()V
        //   240: aload_0        
        //   241: invokespecial   net/rbgrn/opengl/GLThread.isDone:()Z
        //   244: istore          17
        //   246: iload           17
        //   248: ifeq            222
        //   251: aload_0        
        //   252: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   255: astore          18
        //   257: aload           18
        //   259: monitorenter   
        //   260: aload_0        
        //   261: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //   264: aload           18
        //   266: monitorexit    
        //   267: return         
        //   268: astore          19
        //   270: aload           18
        //   272: monitorexit    
        //   273: aload           19
        //   275: athrow         
        //   276: aload_0        
        //   277: getfield        net/rbgrn/opengl/GLThread.mPaused:Z
        //   280: ifne            432
        //   283: aload_0        
        //   284: getfield        net/rbgrn/opengl/GLThread.mHasSurface:Z
        //   287: ifeq            432
        //   290: aload_0        
        //   291: getfield        net/rbgrn/opengl/GLThread.mHaveEgl:Z
        //   294: ifeq            432
        //   297: aload_0        
        //   298: getfield        net/rbgrn/opengl/GLThread.mWidth:I
        //   301: ifle            432
        //   304: aload_0        
        //   305: getfield        net/rbgrn/opengl/GLThread.mHeight:I
        //   308: ifle            432
        //   311: aload_0        
        //   312: getfield        net/rbgrn/opengl/GLThread.mRequestRender:Z
        //   315: ifne            326
        //   318: aload_0        
        //   319: getfield        net/rbgrn/opengl/GLThread.mRenderMode:I
        //   322: iconst_1       
        //   323: if_icmpne       432
        //   326: aload_0        
        //   327: getfield        net/rbgrn/opengl/GLThread.mSizeChanged:Z
        //   330: istore          10
        //   332: aload_0        
        //   333: getfield        net/rbgrn/opengl/GLThread.mWidth:I
        //   336: istore          8
        //   338: aload_0        
        //   339: getfield        net/rbgrn/opengl/GLThread.mHeight:I
        //   342: istore          9
        //   344: aload_0        
        //   345: iconst_0       
        //   346: putfield        net/rbgrn/opengl/GLThread.mSizeChanged:Z
        //   349: aload_0        
        //   350: iconst_0       
        //   351: putfield        net/rbgrn/opengl/GLThread.mRequestRender:Z
        //   354: aload_0        
        //   355: getfield        net/rbgrn/opengl/GLThread.mHasSurface:Z
        //   358: istore          20
        //   360: iconst_0       
        //   361: istore          14
        //   363: iload           20
        //   365: ifeq            214
        //   368: aload_0        
        //   369: getfield        net/rbgrn/opengl/GLThread.mWaitingForSurface:Z
        //   372: istore          21
        //   374: iconst_0       
        //   375: istore          14
        //   377: iload           21
        //   379: ifeq            214
        //   382: iconst_1       
        //   383: istore          10
        //   385: aload_0        
        //   386: iconst_0       
        //   387: putfield        net/rbgrn/opengl/GLThread.mWaitingForSurface:Z
        //   390: aload_0        
        //   391: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   394: invokevirtual   java/lang/Object.notifyAll:()V
        //   397: iconst_0       
        //   398: istore          14
        //   400: goto            214
        //   403: astore          13
        //   405: aload           12
        //   407: monitorexit    
        //   408: aload           13
        //   410: athrow         
        //   411: astore          4
        //   413: aload_0        
        //   414: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   417: astore          5
        //   419: aload           5
        //   421: monitorenter   
        //   422: aload_0        
        //   423: invokespecial   net/rbgrn/opengl/GLThread.stopEglLocked:()V
        //   426: aload           5
        //   428: monitorexit    
        //   429: aload           4
        //   431: athrow         
        //   432: aload_0        
        //   433: getfield        net/rbgrn/opengl/GLThread.sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;
        //   436: invokevirtual   java/lang/Object.wait:()V
        //   439: goto            82
        //   442: iload           11
        //   444: ifeq            452
        //   447: iconst_1       
        //   448: istore_2       
        //   449: iconst_1       
        //   450: istore          10
        //   452: iload           10
        //   454: ifeq            474
        //   457: aload_0        
        //   458: getfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //   461: aload_0        
        //   462: getfield        net/rbgrn/opengl/GLThread.mHolder:Landroid/view/SurfaceHolder;
        //   465: invokevirtual   net/rbgrn/opengl/EglHelper.createSurface:(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;
        //   468: checkcast       Ljavax/microedition/khronos/opengles/GL10;
        //   471: astore_1       
        //   472: iconst_1       
        //   473: istore_3       
        //   474: iload_2        
        //   475: ifeq            497
        //   478: aload_0        
        //   479: getfield        net/rbgrn/opengl/GLThread.mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
        //   482: aload_1        
        //   483: aload_0        
        //   484: getfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //   487: getfield        net/rbgrn/opengl/EglHelper.mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;
        //   490: invokeinterface org/anddev/andengine/opengl/view/GLSurfaceView$Renderer.onSurfaceCreated:(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
        //   495: iconst_0       
        //   496: istore_2       
        //   497: iload_3        
        //   498: ifeq            517
        //   501: aload_0        
        //   502: getfield        net/rbgrn/opengl/GLThread.mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
        //   505: aload_1        
        //   506: iload           8
        //   508: iload           9
        //   510: invokeinterface org/anddev/andengine/opengl/view/GLSurfaceView$Renderer.onSurfaceChanged:(Ljavax/microedition/khronos/opengles/GL10;II)V
        //   515: iconst_0       
        //   516: istore_3       
        //   517: iload           8
        //   519: ifle            33
        //   522: iload           9
        //   524: ifle            33
        //   527: aload_0        
        //   528: getfield        net/rbgrn/opengl/GLThread.mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;
        //   531: aload_1        
        //   532: invokeinterface org/anddev/andengine/opengl/view/GLSurfaceView$Renderer.onDrawFrame:(Ljavax/microedition/khronos/opengles/GL10;)V
        //   537: aload_0        
        //   538: getfield        net/rbgrn/opengl/GLThread.mEglHelper:Lnet/rbgrn/opengl/EglHelper;
        //   541: invokevirtual   net/rbgrn/opengl/EglHelper.swap:()Z
        //   544: pop            
        //   545: goto            33
        //   548: astore          6
        //   550: aload           5
        //   552: monitorexit    
        //   553: aload           6
        //   555: athrow         
        //   556: astore          25
        //   558: aload           24
        //   560: monitorexit    
        //   561: aload           25
        //   563: athrow         
        //    Exceptions:
        //  throws java.lang.InterruptedException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  33     39     411    556    Any
        //  53     60     556    564    Any
        //  73     82     411    556    Any
        //  82     93     403    411    Any
        //  93     123    403    411    Any
        //  123    133    403    411    Any
        //  142    149    150    158    Any
        //  152    155    150    158    Any
        //  158    193    403    411    Any
        //  199    206    403    411    Any
        //  209    214    403    411    Any
        //  214    217    403    411    Any
        //  222    228    411    556    Any
        //  233    246    411    556    Any
        //  260    267    268    276    Any
        //  270    273    268    276    Any
        //  276    326    403    411    Any
        //  326    360    403    411    Any
        //  368    374    403    411    Any
        //  385    397    403    411    Any
        //  405    408    403    411    Any
        //  408    411    411    556    Any
        //  422    429    548    556    Any
        //  432    439    403    411    Any
        //  457    472    411    556    Any
        //  478    495    411    556    Any
        //  501    515    411    556    Any
        //  527    545    411    556    Any
        //  550    553    548    556    Any
        //  558    561    556    564    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0061:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:654)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:531)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    private boolean isDone() {
        synchronized (this.sGLThreadManager) {
            return this.mDone;
        }
    }
    
    private void stopEglLocked() {
        if (this.mHaveEgl) {
            this.mHaveEgl = false;
            this.mEglHelper.destroySurface();
            this.mEglHelper.finish();
            this.sGLThreadManager.releaseEglSurface(this);
        }
    }
    
    public int getRenderMode() {
        synchronized (this.sGLThreadManager) {
            return this.mRenderMode;
        }
    }
    
    public void onPause() {
        synchronized (this.sGLThreadManager) {
            this.mPaused = true;
            this.sGLThreadManager.notifyAll();
        }
    }
    
    public void onResume() {
        synchronized (this.sGLThreadManager) {
            this.mPaused = false;
            this.mRequestRender = true;
            this.sGLThreadManager.notifyAll();
        }
    }
    
    public void onWindowResize(final int mWidth, final int mHeight) {
        synchronized (this.sGLThreadManager) {
            this.mWidth = mWidth;
            this.mHeight = mHeight;
            this.mSizeChanged = true;
            this.sGLThreadManager.notifyAll();
        }
    }
    
    public void queueEvent(final Runnable runnable) {
        synchronized (this) {
            this.mEventQueue.add(runnable);
            synchronized (this.sGLThreadManager) {
                this.mEventsWaiting = true;
                this.sGLThreadManager.notifyAll();
            }
        }
    }
    
    public void requestExitAndWait() {
        final GLThreadManager sglThreadManager = this.sGLThreadManager;
        synchronized (sglThreadManager) {
            this.mDone = true;
            this.sGLThreadManager.notifyAll();
            // monitorexit(sglThreadManager)
            final GLThread glThread = this;
            glThread.join();
            return;
        }
        try {
            final GLThread glThread = this;
            glThread.join();
        }
        catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
    }
    
    public void requestRender() {
        synchronized (this.sGLThreadManager) {
            this.mRequestRender = true;
            this.sGLThreadManager.notifyAll();
        }
    }
    
    @Override
    public void run() {
        this.setName("GLThread " + this.getId());
        try {
            this.guardedRun();
        }
        catch (InterruptedException ex) {}
        finally {
            this.sGLThreadManager.threadExiting(this);
        }
    }
    
    public void setRenderMode(final int mRenderMode) {
        if (mRenderMode < 0 || mRenderMode > 1) {
            throw new IllegalArgumentException("renderMode");
        }
        synchronized (this.sGLThreadManager) {
            this.mRenderMode = mRenderMode;
            if (mRenderMode == 1) {
                this.sGLThreadManager.notifyAll();
            }
        }
    }
    
    public void surfaceCreated(final SurfaceHolder mHolder) {
        this.mHolder = mHolder;
        synchronized (this.sGLThreadManager) {
            this.mHasSurface = true;
            this.sGLThreadManager.notifyAll();
        }
    }
    
    public void surfaceDestroyed() {
        synchronized (this.sGLThreadManager) {
            this.mHasSurface = false;
            this.sGLThreadManager.notifyAll();
            while (!this.mWaitingForSurface && this.isAlive() && !this.mDone) {
                try {
                    this.sGLThreadManager.wait();
                }
                catch (InterruptedException ex) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }
    
    private class GLThreadManager
    {
        public void releaseEglSurface(final GLThread glThread) {
            synchronized (this) {
                if (GLThread.this.mEglOwner == glThread) {
                    GLThread.access$1(GLThread.this, null);
                }
                this.notifyAll();
            }
        }
        
        public void threadExiting(final GLThread glThread) {
            synchronized (this) {
                glThread.mDone = true;
                if (GLThread.this.mEglOwner == glThread) {
                    GLThread.access$1(GLThread.this, null);
                }
                this.notifyAll();
            }
        }
        
        public boolean tryAcquireEglSurface(final GLThread glThread) {
            synchronized (this) {
                boolean b;
                if (GLThread.this.mEglOwner == glThread || GLThread.this.mEglOwner == null) {
                    GLThread.access$1(GLThread.this, glThread);
                    this.notifyAll();
                    b = true;
                }
                else {
                    b = false;
                }
                return b;
            }
        }
    }
}
