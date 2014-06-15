.class Lnet/rbgrn/opengl/GLThread;
.super Ljava/lang/Thread;
.source "GLThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/rbgrn/opengl/GLThread$GLThreadManager;
    }
.end annotation


# static fields
.field public static final DEBUG_CHECK_GL_ERROR:I = 0x1

.field public static final DEBUG_LOG_GL_CALLS:I = 0x2

.field private static final LOG_THREADS:Z


# instance fields
.field public mDone:Z

.field private final mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

.field private final mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

.field private final mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

.field private mEglHelper:Lnet/rbgrn/opengl/EglHelper;

.field private mEglOwner:Lnet/rbgrn/opengl/GLThread;

.field private final mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mEventsWaiting:Z

.field private final mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

.field private mHasSurface:Z

.field private mHaveEgl:Z

.field private mHeight:I

.field public mHolder:Landroid/view/SurfaceHolder;

.field private mPaused:Z

.field private mRenderMode:I

.field private final mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

.field private mRequestRender:Z

.field private mSizeChanged:Z

.field private mWaitingForSurface:Z

.field private mWidth:I

.field private final sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;Landroid/opengl/GLSurfaceView$EGLConfigChooser;Landroid/opengl/GLSurfaceView$EGLContextFactory;Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;Landroid/opengl/GLSurfaceView$GLWrapper;)V
    .locals 4
    .parameter "renderer"
    .parameter "chooser"
    .parameter "contextFactory"
    .parameter "surfaceFactory"
    .parameter "wrapper"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 65
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 31
    new-instance v0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lnet/rbgrn/opengl/GLThread$GLThreadManager;-><init>(Lnet/rbgrn/opengl/GLThread;Lnet/rbgrn/opengl/GLThread$GLThreadManager;)V

    iput-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    .line 40
    iput-boolean v3, p0, Lnet/rbgrn/opengl/GLThread;->mSizeChanged:Z

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnet/rbgrn/opengl/GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 66
    iput-boolean v2, p0, Lnet/rbgrn/opengl/GLThread;->mDone:Z

    .line 67
    iput v2, p0, Lnet/rbgrn/opengl/GLThread;->mWidth:I

    .line 68
    iput v2, p0, Lnet/rbgrn/opengl/GLThread;->mHeight:I

    .line 69
    iput-boolean v3, p0, Lnet/rbgrn/opengl/GLThread;->mRequestRender:Z

    .line 70
    iput v3, p0, Lnet/rbgrn/opengl/GLThread;->mRenderMode:I

    .line 71
    iput-object p1, p0, Lnet/rbgrn/opengl/GLThread;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    .line 72
    iput-object p2, p0, Lnet/rbgrn/opengl/GLThread;->mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    .line 73
    iput-object p3, p0, Lnet/rbgrn/opengl/GLThread;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    .line 74
    iput-object p4, p0, Lnet/rbgrn/opengl/GLThread;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    .line 75
    iput-object p5, p0, Lnet/rbgrn/opengl/GLThread;->mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

    .line 76
    return-void
.end method

.method static synthetic access$0(Lnet/rbgrn/opengl/GLThread;)Lnet/rbgrn/opengl/GLThread;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;

    return-object v0
.end method

.method static synthetic access$1(Lnet/rbgrn/opengl/GLThread;Lnet/rbgrn/opengl/GLThread;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 32
    iput-object p1, p0, Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;

    return-void
.end method

.method private getEvent()Ljava/lang/Runnable;
    .locals 2

    .prologue
    .line 368
    monitor-enter p0

    .line 369
    :try_start_0
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 370
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->mEventQueue:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    monitor-exit p0

    .line 374
    :goto_0
    return-object v0

    .line 368
    :cond_0
    monitor-exit p0

    .line 374
    const/4 v0, 0x0

    goto :goto_0

    .line 368
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private guardedRun()V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v15, 0x1

    .line 120
    new-instance v10, Lnet/rbgrn/opengl/EglHelper;

    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/rbgrn/opengl/GLThread;->mEGLConfigChooser:Landroid/opengl/GLSurfaceView$EGLConfigChooser;

    move-object/from16 v0, p0

    iget-object v12, v0, Lnet/rbgrn/opengl/GLThread;->mEGLContextFactory:Landroid/opengl/GLSurfaceView$EGLContextFactory;

    move-object/from16 v0, p0

    iget-object v13, v0, Lnet/rbgrn/opengl/GLThread;->mEGLWindowSurfaceFactory:Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;

    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/rbgrn/opengl/GLThread;->mGLWrapper:Landroid/opengl/GLSurfaceView$GLWrapper;

    invoke-direct {v10, v11, v12, v13, v14}, Lnet/rbgrn/opengl/EglHelper;-><init>(Landroid/opengl/GLSurfaceView$EGLConfigChooser;Landroid/opengl/GLSurfaceView$EGLContextFactory;Landroid/opengl/GLSurfaceView$EGLWindowSurfaceFactory;Landroid/opengl/GLSurfaceView$GLWrapper;)V

    move-object/from16 v0, p0

    iput-object v10, v0, Lnet/rbgrn/opengl/GLThread;->mEglHelper:Lnet/rbgrn/opengl/EglHelper;

    .line 122
    const/4 v3, 0x0

    .line 123
    .local v3, gl:Ljavax/microedition/khronos/opengles/GL10;
    const/4 v8, 0x1

    .line 124
    .local v8, tellRendererSurfaceCreated:Z
    const/4 v7, 0x1

    .line 130
    .local v7, tellRendererSurfaceChanged:Z
    :cond_0
    :goto_0
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->isDone()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    move-result v10

    if-eqz v10, :cond_1

    .line 248
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v11

    .line 249
    :try_start_1
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->stopEglLocked()V

    .line 248
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 252
    :goto_1
    return-void

    .line 134
    :cond_1
    const/4 v9, 0x0

    .line 135
    .local v9, w:I
    const/4 v4, 0x0

    .line 136
    .local v4, h:I
    const/4 v1, 0x0

    .line 137
    .local v1, changed:Z
    const/4 v5, 0x0

    .line 138
    .local v5, needStart:Z
    const/4 v2, 0x0

    .line 140
    .local v2, eventsWaiting:Z
    :try_start_2
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 144
    :goto_2
    :try_start_3
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mPaused:Z

    if-eqz v10, :cond_2

    .line 145
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->stopEglLocked()V

    .line 147
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mHasSurface:Z

    if-nez v10, :cond_4

    .line 148
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mWaitingForSurface:Z

    if-nez v10, :cond_3

    .line 149
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->stopEglLocked()V

    .line 150
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mWaitingForSurface:Z

    .line 151
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v10}, Ljava/lang/Object;->notifyAll()V

    .line 169
    :cond_3
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mDone:Z

    if-eqz v10, :cond_5

    .line 170
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 248
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v11

    .line 249
    :try_start_4
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->stopEglLocked()V

    .line 248
    monitor-exit v11

    goto :goto_1

    :catchall_0
    move-exception v10

    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v10

    .line 154
    :cond_4
    :try_start_5
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mHaveEgl:Z

    if-nez v10, :cond_3

    .line 155
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    move-object/from16 v0, p0

    invoke-virtual {v10, v0}, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->tryAcquireEglSurface(Lnet/rbgrn/opengl/GLThread;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 156
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mHaveEgl:Z

    .line 157
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->mEglHelper:Lnet/rbgrn/opengl/EglHelper;

    invoke-virtual {v10}, Lnet/rbgrn/opengl/EglHelper;->start()V

    .line 158
    const/4 v10, 0x1

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mRequestRender:Z

    .line 159
    const/4 v5, 0x1

    goto :goto_3

    .line 173
    :cond_5
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mEventsWaiting:Z

    if-eqz v10, :cond_8

    .line 174
    const/4 v2, 0x1

    .line 175
    const/4 v10, 0x0

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mEventsWaiting:Z

    .line 140
    :cond_6
    :goto_4
    monitor-exit v11
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 205
    if-eqz v2, :cond_b

    .line 207
    :cond_7
    :try_start_6
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->getEvent()Ljava/lang/Runnable;

    move-result-object v6

    .local v6, r:Ljava/lang/Runnable;
    if-eqz v6, :cond_0

    .line 208
    invoke-interface {v6}, Ljava/lang/Runnable;->run()V

    .line 209
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->isDone()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    move-result v10

    if-eqz v10, :cond_7

    .line 248
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v11

    .line 249
    :try_start_7
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->stopEglLocked()V

    .line 248
    monitor-exit v11

    goto/16 :goto_1

    :catchall_1
    move-exception v10

    monitor-exit v11
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw v10

    .line 179
    .end local v6           #r:Ljava/lang/Runnable;
    :cond_8
    :try_start_8
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mPaused:Z

    if-nez v10, :cond_a

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mHasSurface:Z

    if-eqz v10, :cond_a

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mHaveEgl:Z

    if-eqz v10, :cond_a

    move-object/from16 v0, p0

    iget v10, v0, Lnet/rbgrn/opengl/GLThread;->mWidth:I

    if-lez v10, :cond_a

    move-object/from16 v0, p0

    iget v10, v0, Lnet/rbgrn/opengl/GLThread;->mHeight:I

    if-lez v10, :cond_a

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mRequestRender:Z

    if-nez v10, :cond_9

    move-object/from16 v0, p0

    iget v10, v0, Lnet/rbgrn/opengl/GLThread;->mRenderMode:I

    if-ne v10, v15, :cond_a

    .line 180
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lnet/rbgrn/opengl/GLThread;->mSizeChanged:Z

    .line 181
    move-object/from16 v0, p0

    iget v9, v0, Lnet/rbgrn/opengl/GLThread;->mWidth:I

    .line 182
    move-object/from16 v0, p0

    iget v4, v0, Lnet/rbgrn/opengl/GLThread;->mHeight:I

    .line 183
    const/4 v10, 0x0

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mSizeChanged:Z

    .line 184
    const/4 v10, 0x0

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mRequestRender:Z

    .line 185
    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mHasSurface:Z

    if-eqz v10, :cond_6

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mWaitingForSurface:Z

    if-eqz v10, :cond_6

    .line 186
    const/4 v1, 0x1

    .line 187
    const/4 v10, 0x0

    move-object/from16 v0, p0

    iput-boolean v10, v0, Lnet/rbgrn/opengl/GLThread;->mWaitingForSurface:Z

    .line 188
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v10}, Ljava/lang/Object;->notifyAll()V

    goto :goto_4

    .line 140
    :catchall_2
    move-exception v10

    monitor-exit v11
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :try_start_9
    throw v10
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 244
    .end local v1           #changed:Z
    .end local v2           #eventsWaiting:Z
    .end local v4           #h:I
    .end local v5           #needStart:Z
    .end local v9           #w:I
    :catchall_3
    move-exception v10

    .line 248
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v11

    .line 249
    :try_start_a
    invoke-direct/range {p0 .. p0}, Lnet/rbgrn/opengl/GLThread;->stopEglLocked()V

    .line 248
    monitor-exit v11
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 251
    throw v10

    .line 198
    .restart local v1       #changed:Z
    .restart local v2       #eventsWaiting:Z
    .restart local v4       #h:I
    .restart local v5       #needStart:Z
    .restart local v9       #w:I
    :cond_a
    :try_start_b
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v10}, Ljava/lang/Object;->wait()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    goto/16 :goto_2

    .line 217
    :cond_b
    if-eqz v5, :cond_c

    .line 218
    const/4 v8, 0x1

    .line 219
    const/4 v1, 0x1

    .line 221
    :cond_c
    if-eqz v1, :cond_d

    .line 222
    :try_start_c
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->mEglHelper:Lnet/rbgrn/opengl/EglHelper;

    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/rbgrn/opengl/GLThread;->mHolder:Landroid/view/SurfaceHolder;

    invoke-virtual {v10, v11}, Lnet/rbgrn/opengl/EglHelper;->createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    move-object v3, v0

    .line 223
    const/4 v7, 0x1

    .line 225
    :cond_d
    if-eqz v8, :cond_e

    .line 226
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/rbgrn/opengl/GLThread;->mEglHelper:Lnet/rbgrn/opengl/EglHelper;

    iget-object v11, v11, Lnet/rbgrn/opengl/EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v10, v3, v11}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 227
    const/4 v8, 0x0

    .line 229
    :cond_e
    if-eqz v7, :cond_f

    .line 230
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    invoke-interface {v10, v3, v9, v4}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 231
    const/4 v7, 0x0

    .line 233
    :cond_f
    if-lez v9, :cond_0

    if-lez v4, :cond_0

    .line 235
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    invoke-interface {v10, v3}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 241
    move-object/from16 v0, p0

    iget-object v10, v0, Lnet/rbgrn/opengl/GLThread;->mEglHelper:Lnet/rbgrn/opengl/EglHelper;

    invoke-virtual {v10}, Lnet/rbgrn/opengl/EglHelper;->swap()Z
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    goto/16 :goto_0

    .line 248
    .end local v1           #changed:Z
    .end local v2           #eventsWaiting:Z
    .end local v4           #h:I
    .end local v5           #needStart:Z
    .end local v9           #w:I
    :catchall_4
    move-exception v10

    :try_start_d
    monitor-exit v11
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    throw v10

    :catchall_5
    move-exception v10

    :try_start_e
    monitor-exit v11
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    throw v10
.end method

.method private isDone()Z
    .locals 2

    .prologue
    .line 255
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1

    .line 256
    :try_start_0
    iget-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mDone:Z

    monitor-exit v1

    return v0

    .line 255
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private stopEglLocked()V
    .locals 1

    .prologue
    .line 111
    iget-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mHaveEgl:Z

    if-eqz v0, :cond_0

    .line 112
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mHaveEgl:Z

    .line 113
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->mEglHelper:Lnet/rbgrn/opengl/EglHelper;

    invoke-virtual {v0}, Lnet/rbgrn/opengl/EglHelper;->destroySurface()V

    .line 114
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->mEglHelper:Lnet/rbgrn/opengl/EglHelper;

    invoke-virtual {v0}, Lnet/rbgrn/opengl/EglHelper;->finish()V

    .line 115
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0, p0}, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->releaseEglSurface(Lnet/rbgrn/opengl/GLThread;)V

    .line 117
    :cond_0
    return-void
.end method


# virtual methods
.method public getRenderMode()I
    .locals 2

    .prologue
    .line 273
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1

    .line 274
    :try_start_0
    iget v0, p0, Lnet/rbgrn/opengl/GLThread;->mRenderMode:I

    monitor-exit v1

    return v0

    .line 273
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 314
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1

    .line 315
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mPaused:Z

    .line 316
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 314
    monitor-exit v1

    .line 318
    return-void

    .line 314
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 321
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1

    .line 322
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mPaused:Z

    .line 323
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mRequestRender:Z

    .line 324
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 321
    monitor-exit v1

    .line 326
    return-void

    .line 321
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onWindowResize(II)V
    .locals 2
    .parameter "w"
    .parameter "h"

    .prologue
    .line 329
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1

    .line 330
    :try_start_0
    iput p1, p0, Lnet/rbgrn/opengl/GLThread;->mWidth:I

    .line 331
    iput p2, p0, Lnet/rbgrn/opengl/GLThread;->mHeight:I

    .line 332
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mSizeChanged:Z

    .line 333
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 329
    monitor-exit v1

    .line 335
    return-void

    .line 329
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 2
    .parameter "r"

    .prologue
    .line 358
    monitor-enter p0

    .line 359
    :try_start_0
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 360
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 361
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mEventsWaiting:Z

    .line 362
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 360
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 358
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 365
    return-void

    .line 360
    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0

    .line 358
    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0
.end method

.method public requestExitAndWait()V
    .locals 3

    .prologue
    .line 340
    iget-object v2, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v2

    .line 341
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lnet/rbgrn/opengl/GLThread;->mDone:Z

    .line 342
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 340
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 345
    :try_start_1
    invoke-virtual {p0}, Lnet/rbgrn/opengl/GLThread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 349
    :goto_0
    return-void

    .line 340
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 346
    :catch_0
    move-exception v0

    .line 347
    .local v0, ex:Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0
.end method

.method public requestRender()V
    .locals 2

    .prologue
    .line 279
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1

    .line 280
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mRequestRender:Z

    .line 281
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 279
    monitor-exit v1

    .line 283
    return-void

    .line 279
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "GLThread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnet/rbgrn/opengl/GLThread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnet/rbgrn/opengl/GLThread;->setName(Ljava/lang/String;)V

    .line 94
    :try_start_0
    invoke-direct {p0}, Lnet/rbgrn/opengl/GLThread;->guardedRun()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0, p0}, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->threadExiting(Lnet/rbgrn/opengl/GLThread;)V

    .line 100
    :goto_0
    return-void

    .line 95
    :catch_0
    move-exception v0

    .line 98
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0, p0}, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->threadExiting(Lnet/rbgrn/opengl/GLThread;)V

    goto :goto_0

    .line 97
    :catchall_0
    move-exception v0

    .line 98
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v1, p0}, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->threadExiting(Lnet/rbgrn/opengl/GLThread;)V

    .line 99
    throw v0
.end method

.method public setRenderMode(I)V
    .locals 2
    .parameter "renderMode"

    .prologue
    const/4 v0, 0x1

    .line 261
    if-ltz p1, :cond_0

    if-le p1, v0, :cond_1

    .line 262
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "renderMode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 264
    :cond_1
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1

    .line 265
    :try_start_0
    iput p1, p0, Lnet/rbgrn/opengl/GLThread;->mRenderMode:I

    .line 266
    if-ne p1, v0, :cond_2

    .line 267
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 264
    :cond_2
    monitor-exit v1

    .line 270
    return-void

    .line 264
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .parameter "holder"

    .prologue
    .line 286
    iput-object p1, p0, Lnet/rbgrn/opengl/GLThread;->mHolder:Landroid/view/SurfaceHolder;

    .line 287
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v1

    .line 291
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnet/rbgrn/opengl/GLThread;->mHasSurface:Z

    .line 292
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 287
    monitor-exit v1

    .line 294
    return-void

    .line 287
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceDestroyed()V
    .locals 3

    .prologue
    .line 297
    iget-object v2, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    monitor-enter v2

    .line 301
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lnet/rbgrn/opengl/GLThread;->mHasSurface:Z

    .line 302
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 303
    :goto_0
    iget-boolean v1, p0, Lnet/rbgrn/opengl/GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lnet/rbgrn/opengl/GLThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lnet/rbgrn/opengl/GLThread;->mDone:Z

    if-eqz v1, :cond_1

    .line 297
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 311
    return-void

    .line 305
    :cond_1
    :try_start_1
    iget-object v1, p0, Lnet/rbgrn/opengl/GLThread;->sGLThreadManager:Lnet/rbgrn/opengl/GLThread$GLThreadManager;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 306
    :catch_0
    move-exception v0

    .line 307
    .local v0, e:Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 297
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
