.class Lorg/anddev/andengine/engine/Engine$State;
.super Ljava/lang/Object;
.source "Engine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/engine/Engine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "State"
.end annotation


# instance fields
.field mDrawing:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 691
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 692
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/Engine$State;->mDrawing:Z

    .line 691
    return-void
.end method

.method synthetic constructor <init>(Lorg/anddev/andengine/engine/Engine$State;)V
    .locals 0
    .parameter

    .prologue
    .line 691
    invoke-direct {p0}, Lorg/anddev/andengine/engine/Engine$State;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized notifyCanDraw()V
    .locals 1

    .prologue
    .line 696
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/anddev/andengine/engine/Engine$State;->mDrawing:Z

    .line 697
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 699
    monitor-exit p0

    return-void

    .line 696
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized notifyCanUpdate()V
    .locals 1

    .prologue
    .line 703
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lorg/anddev/andengine/engine/Engine$State;->mDrawing:Z

    .line 704
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 706
    monitor-exit p0

    return-void

    .line 703
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized waitUntilCanDraw()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 710
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine$State;->mDrawing:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 714
    monitor-exit p0

    return-void

    .line 711
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 710
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized waitUntilCanUpdate()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 718
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/Engine$State;->mDrawing:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 722
    monitor-exit p0

    return-void

    .line 719
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 718
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
