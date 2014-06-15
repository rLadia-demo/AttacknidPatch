.class public Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolUpdateHandler;
.super Lorg/anddev/andengine/util/pool/RunnablePoolUpdateHandler;
.source "EntityRemoveRunnablePoolUpdateHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/pool/RunnablePoolUpdateHandler",
        "<",
        "Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lorg/anddev/andengine/util/pool/RunnablePoolUpdateHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected onAllocatePoolItem()Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;
    .locals 1

    .prologue
    .line 30
    new-instance v0, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;

    invoke-direct {v0}, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic onAllocatePoolItem()Lorg/anddev/andengine/util/pool/RunnablePoolItem;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolUpdateHandler;->onAllocatePoolItem()Lorg/anddev/andengine/util/pool/EntityRemoveRunnablePoolItem;

    move-result-object v0

    return-object v0
.end method
