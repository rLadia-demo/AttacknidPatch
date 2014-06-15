.class public abstract Lorg/anddev/andengine/util/pool/PoolUpdateHandler;
.super Ljava/lang/Object;
.source "PoolUpdateHandler.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/anddev/andengine/util/pool/PoolItem;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/engine/handler/IUpdateHandler;"
    }
.end annotation


# instance fields
.field private final mPool:Lorg/anddev/andengine/util/pool/Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/pool/Pool",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mScheduledPoolItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    .local p0, this:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;,"Lorg/anddev/andengine/util/pool/PoolUpdateHandler<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mScheduledPoolItems:Ljava/util/ArrayList;

    .line 31
    new-instance v0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$1;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$1;-><init>(Lorg/anddev/andengine/util/pool/PoolUpdateHandler;)V

    iput-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mPool:Lorg/anddev/andengine/util/pool/Pool;

    .line 37
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "pInitialPoolSize"

    .prologue
    .line 39
    .local p0, this:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;,"Lorg/anddev/andengine/util/pool/PoolUpdateHandler<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mScheduledPoolItems:Ljava/util/ArrayList;

    .line 40
    new-instance v0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$2;

    invoke-direct {v0, p0, p1}, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$2;-><init>(Lorg/anddev/andengine/util/pool/PoolUpdateHandler;I)V

    iput-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mPool:Lorg/anddev/andengine/util/pool/Pool;

    .line 46
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .parameter "pInitialPoolSize"
    .parameter "pGrowth"

    .prologue
    .line 48
    .local p0, this:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;,"Lorg/anddev/andengine/util/pool/PoolUpdateHandler<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mScheduledPoolItems:Ljava/util/ArrayList;

    .line 49
    new-instance v0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$3;

    invoke-direct {v0, p0, p1, p2}, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$3;-><init>(Lorg/anddev/andengine/util/pool/PoolUpdateHandler;II)V

    iput-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mPool:Lorg/anddev/andengine/util/pool/Pool;

    .line 55
    return-void
.end method


# virtual methods
.method public obtainPoolItem()Lorg/anddev/andengine/util/pool/PoolItem;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, this:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;,"Lorg/anddev/andengine/util/pool/PoolUpdateHandler<TT;>;"
    iget-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mPool:Lorg/anddev/andengine/util/pool/Pool;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/pool/Pool;->obtainPoolItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/util/pool/PoolItem;

    return-object v0
.end method

.method protected abstract onAllocatePoolItem()Lorg/anddev/andengine/util/pool/PoolItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method protected abstract onHandlePoolItem(Lorg/anddev/andengine/util/pool/PoolItem;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public onUpdate(F)V
    .locals 6
    .parameter "pSecondsElapsed"

    .prologue
    .line 71
    .local p0, this:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;,"Lorg/anddev/andengine/util/pool/PoolUpdateHandler<TT;>;"
    iget-object v4, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mScheduledPoolItems:Ljava/util/ArrayList;

    .line 73
    .local v4, scheduledPoolItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TT;>;"
    monitor-enter v4

    .line 74
    :try_start_0
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 76
    .local v0, count:I
    if-lez v0, :cond_0

    .line 77
    iget-object v3, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mPool:Lorg/anddev/andengine/util/pool/Pool;

    .line 80
    .local v3, pool:Lorg/anddev/andengine/util/pool/Pool;,"Lorg/anddev/andengine/util/pool/Pool<TT;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-lt v1, v0, :cond_1

    .line 86
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 73
    .end local v1           #i:I
    .end local v3           #pool:Lorg/anddev/andengine/util/pool/Pool;,"Lorg/anddev/andengine/util/pool/Pool<TT;>;"
    :cond_0
    monitor-exit v4

    .line 89
    return-void

    .line 81
    .restart local v1       #i:I
    .restart local v3       #pool:Lorg/anddev/andengine/util/pool/Pool;,"Lorg/anddev/andengine/util/pool/Pool<TT;>;"
    :cond_1
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/util/pool/PoolItem;

    .line 82
    .local v2, item:Lorg/anddev/andengine/util/pool/PoolItem;,"TT;"
    invoke-virtual {p0, v2}, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->onHandlePoolItem(Lorg/anddev/andengine/util/pool/PoolItem;)V

    .line 83
    invoke-virtual {v3, v2}, Lorg/anddev/andengine/util/pool/Pool;->recyclePoolItem(Lorg/anddev/andengine/util/pool/PoolItem;)V

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 73
    .end local v0           #count:I
    .end local v1           #i:I
    .end local v2           #item:Lorg/anddev/andengine/util/pool/PoolItem;,"TT;"
    .end local v3           #pool:Lorg/anddev/andengine/util/pool/Pool;,"Lorg/anddev/andengine/util/pool/Pool<TT;>;"
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method

.method public postPoolItem(Lorg/anddev/andengine/util/pool/PoolItem;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, this:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;,"Lorg/anddev/andengine/util/pool/PoolUpdateHandler<TT;>;"
    .local p1, pPoolItem:Lorg/anddev/andengine/util/pool/PoolItem;,"TT;"
    iget-object v1, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mScheduledPoolItems:Ljava/util/ArrayList;

    monitor-enter v1

    .line 116
    if-nez p1, :cond_0

    .line 117
    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "PoolItem already recycled!"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 118
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mPool:Lorg/anddev/andengine/util/pool/Pool;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/util/pool/Pool;->ownsPoolItem(Lorg/anddev/andengine/util/pool/PoolItem;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 119
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "PoolItem from another pool!"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_1
    iget-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mScheduledPoolItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    return-void
.end method

.method public reset()V
    .locals 5

    .prologue
    .line 93
    .local p0, this:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;,"Lorg/anddev/andengine/util/pool/PoolUpdateHandler<TT;>;"
    iget-object v3, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mScheduledPoolItems:Ljava/util/ArrayList;

    .line 94
    .local v3, scheduledPoolItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TT;>;"
    monitor-enter v3

    .line 95
    :try_start_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 97
    .local v0, count:I
    iget-object v2, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->mPool:Lorg/anddev/andengine/util/pool/Pool;

    .line 98
    .local v2, pool:Lorg/anddev/andengine/util/pool/Pool;,"Lorg/anddev/andengine/util/pool/Pool<TT;>;"
    add-int/lit8 v1, v0, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 102
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 94
    monitor-exit v3

    .line 104
    return-void

    .line 99
    :cond_0
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/anddev/andengine/util/pool/PoolItem;

    invoke-virtual {v2, v4}, Lorg/anddev/andengine/util/pool/Pool;->recyclePoolItem(Lorg/anddev/andengine/util/pool/PoolItem;)V

    .line 98
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 94
    .end local v0           #count:I
    .end local v1           #i:I
    .end local v2           #pool:Lorg/anddev/andengine/util/pool/Pool;,"Lorg/anddev/andengine/util/pool/Pool<TT;>;"
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method
