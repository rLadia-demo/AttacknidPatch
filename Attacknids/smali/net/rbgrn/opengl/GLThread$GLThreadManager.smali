.class Lnet/rbgrn/opengl/GLThread$GLThreadManager;
.super Ljava/lang/Object;
.source "GLThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/rbgrn/opengl/GLThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GLThreadManager"
.end annotation


# instance fields
.field final synthetic this$0:Lnet/rbgrn/opengl/GLThread;


# direct methods
.method private constructor <init>(Lnet/rbgrn/opengl/GLThread;)V
    .locals 0
    .parameter

    .prologue
    .line 381
    iput-object p1, p0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->this$0:Lnet/rbgrn/opengl/GLThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnet/rbgrn/opengl/GLThread;Lnet/rbgrn/opengl/GLThread$GLThreadManager;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 381
    invoke-direct {p0, p1}, Lnet/rbgrn/opengl/GLThread$GLThreadManager;-><init>(Lnet/rbgrn/opengl/GLThread;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized releaseEglSurface(Lnet/rbgrn/opengl/GLThread;)V
    .locals 2
    .parameter "thread"

    .prologue
    .line 410
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->this$0:Lnet/rbgrn/opengl/GLThread;

    #getter for: Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;
    invoke-static {v0}, Lnet/rbgrn/opengl/GLThread;->access$0(Lnet/rbgrn/opengl/GLThread;)Lnet/rbgrn/opengl/GLThread;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 411
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->this$0:Lnet/rbgrn/opengl/GLThread;

    const/4 v1, 0x0

    #setter for: Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;
    invoke-static {v0, v1}, Lnet/rbgrn/opengl/GLThread;->access$1(Lnet/rbgrn/opengl/GLThread;Lnet/rbgrn/opengl/GLThread;)V

    .line 413
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 414
    monitor-exit p0

    return-void

    .line 410
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized threadExiting(Lnet/rbgrn/opengl/GLThread;)V
    .locals 2
    .parameter "thread"

    .prologue
    .line 387
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p1, Lnet/rbgrn/opengl/GLThread;->mDone:Z

    .line 388
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->this$0:Lnet/rbgrn/opengl/GLThread;

    #getter for: Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;
    invoke-static {v0}, Lnet/rbgrn/opengl/GLThread;->access$0(Lnet/rbgrn/opengl/GLThread;)Lnet/rbgrn/opengl/GLThread;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 389
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->this$0:Lnet/rbgrn/opengl/GLThread;

    const/4 v1, 0x0

    #setter for: Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;
    invoke-static {v0, v1}, Lnet/rbgrn/opengl/GLThread;->access$1(Lnet/rbgrn/opengl/GLThread;Lnet/rbgrn/opengl/GLThread;)V

    .line 391
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 392
    monitor-exit p0

    return-void

    .line 387
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tryAcquireEglSurface(Lnet/rbgrn/opengl/GLThread;)Z
    .locals 1
    .parameter "thread"

    .prologue
    .line 401
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->this$0:Lnet/rbgrn/opengl/GLThread;

    #getter for: Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;
    invoke-static {v0}, Lnet/rbgrn/opengl/GLThread;->access$0(Lnet/rbgrn/opengl/GLThread;)Lnet/rbgrn/opengl/GLThread;

    move-result-object v0

    if-eq v0, p1, :cond_0

    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->this$0:Lnet/rbgrn/opengl/GLThread;

    #getter for: Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;
    invoke-static {v0}, Lnet/rbgrn/opengl/GLThread;->access$0(Lnet/rbgrn/opengl/GLThread;)Lnet/rbgrn/opengl/GLThread;

    move-result-object v0

    if-nez v0, :cond_1

    .line 402
    :cond_0
    iget-object v0, p0, Lnet/rbgrn/opengl/GLThread$GLThreadManager;->this$0:Lnet/rbgrn/opengl/GLThread;

    #setter for: Lnet/rbgrn/opengl/GLThread;->mEglOwner:Lnet/rbgrn/opengl/GLThread;
    invoke-static {v0, p1}, Lnet/rbgrn/opengl/GLThread;->access$1(Lnet/rbgrn/opengl/GLThread;Lnet/rbgrn/opengl/GLThread;)V

    .line 403
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 404
    const/4 v0, 0x1

    .line 406
    :goto_0
    monitor-exit p0

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 401
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
