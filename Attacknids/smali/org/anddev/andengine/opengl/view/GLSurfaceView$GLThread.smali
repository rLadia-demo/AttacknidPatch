.class Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;
.super Ljava/lang/Thread;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/opengl/view/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GLThread"
.end annotation


# instance fields
.field private mDone:Z

.field private mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

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

.field private mHasSurface:Z

.field private mHeight:I

.field private mPaused:Z

.field private mRenderMode:I

.field private final mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

.field private mRequestRender:Z

.field private mSizeChanged:Z

.field private mWidth:I

.field final synthetic this$0:Lorg/anddev/andengine/opengl/view/GLSurfaceView;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/opengl/view/GLSurfaceView;Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;)V
    .locals 3
    .parameter
    .parameter "renderer"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 518
    iput-object p1, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->this$0:Lorg/anddev/andengine/opengl/view/GLSurfaceView;

    .line 519
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 751
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 520
    iput-boolean v1, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mDone:Z

    .line 521
    iput v1, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mWidth:I

    .line 522
    iput v1, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mHeight:I

    .line 523
    iput-boolean v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 524
    iput v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRenderMode:I

    .line 525
    iput-object p2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    .line 526
    iput-boolean v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mSizeChanged:Z

    .line 527
    const-string v0, "GLThread"

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->setName(Ljava/lang/String;)V

    .line 528
    return-void
.end method

.method private getEvent()Ljava/lang/Runnable;
    .locals 2

    .prologue
    .line 734
    monitor-enter p0

    .line 735
    :try_start_0
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 736
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    monitor-exit p0

    .line 740
    :goto_0
    return-object v0

    .line 734
    :cond_0
    monitor-exit p0

    .line 740
    const/4 v0, 0x0

    goto :goto_0

    .line 734
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private guardedRun()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 555
    new-instance v8, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    iget-object v9, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->this$0:Lorg/anddev/andengine/opengl/view/GLSurfaceView;

    invoke-direct {v8, v9}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;-><init>(Lorg/anddev/andengine/opengl/view/GLSurfaceView;)V

    iput-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    .line 556
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    invoke-virtual {v8}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;->start()V

    .line 558
    const/4 v1, 0x0

    .line 559
    .local v1, gl:Ljavax/microedition/khronos/opengles/GL10;
    const/4 v6, 0x1

    .line 560
    .local v6, tellRendererSurfaceCreated:Z
    const/4 v5, 0x1

    .line 566
    .local v5, tellRendererSurfaceChanged:Z
    :cond_0
    :goto_0
    iget-boolean v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mDone:Z

    if-eqz v8, :cond_1

    .line 627
    :goto_1
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    invoke-virtual {v8}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;->finish()V

    .line 628
    return-void

    .line 573
    :cond_1
    const/4 v3, 0x0

    .line 574
    .local v3, needStart:Z
    monitor-enter p0

    .line 576
    :goto_2
    :try_start_0
    invoke-direct {p0}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->getEvent()Ljava/lang/Runnable;

    move-result-object v4

    .local v4, r:Ljava/lang/Runnable;
    if-nez v4, :cond_3

    .line 579
    iget-boolean v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mPaused:Z

    if-eqz v8, :cond_2

    .line 580
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    invoke-virtual {v8}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;->finish()V

    .line 581
    const/4 v3, 0x1

    .line 583
    :cond_2
    :goto_3
    invoke-direct {p0}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->needToWait()Z

    move-result v8

    if-nez v8, :cond_4

    .line 586
    iget-boolean v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mDone:Z

    if-eqz v8, :cond_5

    .line 587
    monitor-exit p0

    goto :goto_1

    .line 574
    .end local v4           #r:Ljava/lang/Runnable;
    :catchall_0
    move-exception v8

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8

    .line 577
    .restart local v4       #r:Ljava/lang/Runnable;
    :cond_3
    :try_start_1
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    goto :goto_2

    .line 584
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    goto :goto_3

    .line 589
    :cond_5
    iget-boolean v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mSizeChanged:Z

    .line 590
    .local v0, changed:Z
    iget v7, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mWidth:I

    .line 591
    .local v7, w:I
    iget v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mHeight:I

    .line 592
    .local v2, h:I
    const/4 v8, 0x0

    iput-boolean v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mSizeChanged:Z

    .line 593
    const/4 v8, 0x0

    iput-boolean v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 574
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 595
    if-eqz v3, :cond_6

    .line 596
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    invoke-virtual {v8}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;->start()V

    .line 597
    const/4 v6, 0x1

    .line 598
    const/4 v0, 0x1

    .line 600
    :cond_6
    if-eqz v0, :cond_7

    .line 601
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    iget-object v9, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->this$0:Lorg/anddev/andengine/opengl/view/GLSurfaceView;

    invoke-virtual {v9}, Lorg/anddev/andengine/opengl/view/GLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;->createSurface(Landroid/view/SurfaceHolder;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v1

    .end local v1           #gl:Ljavax/microedition/khronos/opengles/GL10;
    check-cast v1, Ljavax/microedition/khronos/opengles/GL10;

    .line 602
    .restart local v1       #gl:Ljavax/microedition/khronos/opengles/GL10;
    const/4 v5, 0x1

    .line 604
    :cond_7
    if-eqz v6, :cond_8

    .line 605
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    iget-object v9, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    iget-object v9, v9, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v8, v1, v9}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 606
    const/4 v6, 0x0

    .line 608
    :cond_8
    if-eqz v5, :cond_9

    .line 609
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    invoke-interface {v8, v1, v7, v2}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 610
    const/4 v5, 0x0

    .line 612
    :cond_9
    if-lez v7, :cond_0

    if-lez v2, :cond_0

    .line 614
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRenderer:Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;

    invoke-interface {v8, v1}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 620
    iget-object v8, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEglHelper:Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;

    invoke-virtual {v8}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$EglHelper;->swap()Z

    goto :goto_0
.end method

.method private needToWait()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 631
    iget-boolean v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mDone:Z

    if-eqz v2, :cond_1

    .line 643
    :cond_0
    :goto_0
    return v0

    .line 635
    :cond_1
    iget-boolean v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mPaused:Z

    if-nez v2, :cond_2

    iget-boolean v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mHasSurface:Z

    if-nez v2, :cond_3

    :cond_2
    move v0, v1

    .line 636
    goto :goto_0

    .line 639
    :cond_3
    iget v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mWidth:I

    if-lez v2, :cond_4

    iget v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mHeight:I

    if-lez v2, :cond_4

    iget-boolean v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRequestRender:Z

    if-nez v2, :cond_0

    iget v2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRenderMode:I

    if-eq v2, v1, :cond_0

    :cond_4
    move v0, v1

    .line 643
    goto :goto_0
.end method


# virtual methods
.method public getRenderMode()I
    .locals 1

    .prologue
    .line 659
    monitor-enter p0

    .line 660
    :try_start_0
    iget v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRenderMode:I

    monitor-exit p0

    return v0

    .line 659
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 686
    monitor-enter p0

    .line 687
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mPaused:Z

    .line 686
    monitor-exit p0

    .line 689
    return-void

    .line 686
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 692
    monitor-enter p0

    .line 693
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mPaused:Z

    .line 694
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 692
    monitor-exit p0

    .line 696
    return-void

    .line 692
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onWindowResize(II)V
    .locals 1
    .parameter "w"
    .parameter "h"

    .prologue
    .line 699
    monitor-enter p0

    .line 700
    :try_start_0
    iput p1, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mWidth:I

    .line 701
    iput p2, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mHeight:I

    .line 702
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mSizeChanged:Z

    .line 703
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 699
    monitor-exit p0

    .line 705
    return-void

    .line 699
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "r"

    .prologue
    .line 728
    monitor-enter p0

    .line 729
    :try_start_0
    iget-object v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 728
    monitor-exit p0

    .line 731
    return-void

    .line 728
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public requestExitAndWait()V
    .locals 2

    .prologue
    .line 710
    monitor-enter p0

    .line 711
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mDone:Z

    .line 712
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 710
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 715
    :try_start_1
    invoke-virtual {p0}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 719
    :goto_0
    return-void

    .line 710
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 716
    :catch_0
    move-exception v0

    .line 717
    .local v0, ex:Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0
.end method

.method public requestRender()V
    .locals 1

    .prologue
    .line 665
    monitor-enter p0

    .line 666
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRequestRender:Z

    .line 667
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 665
    monitor-exit p0

    .line 669
    return-void

    .line 665
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 3

    .prologue
    .line 542
    :try_start_0
    invoke-static {}, Lorg/anddev/andengine/opengl/view/GLSurfaceView;->access$0()Ljava/util/concurrent/Semaphore;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 546
    :try_start_1
    invoke-direct {p0}, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->guardedRun()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 550
    invoke-static {}, Lorg/anddev/andengine/opengl/view/GLSurfaceView;->access$0()Ljava/util/concurrent/Semaphore;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    .line 552
    :goto_0
    return-void

    .line 543
    :catch_0
    move-exception v0

    .line 550
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-static {}, Lorg/anddev/andengine/opengl/view/GLSurfaceView;->access$0()Ljava/util/concurrent/Semaphore;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0

    .line 547
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catch_1
    move-exception v1

    .line 550
    invoke-static {}, Lorg/anddev/andengine/opengl/view/GLSurfaceView;->access$0()Ljava/util/concurrent/Semaphore;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_0

    .line 549
    :catchall_0
    move-exception v1

    .line 550
    invoke-static {}, Lorg/anddev/andengine/opengl/view/GLSurfaceView;->access$0()Ljava/util/concurrent/Semaphore;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/Semaphore;->release()V

    .line 551
    throw v1
.end method

.method public setRenderMode(I)V
    .locals 2
    .parameter "renderMode"

    .prologue
    const/4 v0, 0x1

    .line 647
    if-ltz p1, :cond_0

    if-le p1, v0, :cond_1

    .line 648
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "renderMode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 650
    :cond_1
    monitor-enter p0

    .line 651
    :try_start_0
    iput p1, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mRenderMode:I

    .line 652
    if-ne p1, v0, :cond_2

    .line 653
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 650
    :cond_2
    monitor-exit p0

    .line 656
    return-void

    .line 650
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceCreated()V
    .locals 1

    .prologue
    .line 672
    monitor-enter p0

    .line 673
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 674
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 672
    monitor-exit p0

    .line 676
    return-void

    .line 672
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceDestroyed()V
    .locals 1

    .prologue
    .line 679
    monitor-enter p0

    .line 680
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lorg/anddev/andengine/opengl/view/GLSurfaceView$GLThread;->mHasSurface:Z

    .line 681
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 679
    monitor-exit p0

    .line 683
    return-void

    .line 679
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
