.class Lorg/anddev/andengine/util/pool/PoolUpdateHandler$2;
.super Lorg/anddev/andengine/util/pool/Pool;
.source "PoolUpdateHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/util/pool/PoolUpdateHandler;-><init>(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/pool/Pool",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/util/pool/PoolUpdateHandler;I)V
    .locals 0
    .parameter
    .parameter "$anonymous0"

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$2;->this$0:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;

    .line 40
    invoke-direct {p0, p2}, Lorg/anddev/andengine/util/pool/Pool;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic onAllocatePoolItem()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$2;->onAllocatePoolItem()Lorg/anddev/andengine/util/pool/PoolItem;

    move-result-object v0

    return-object v0
.end method

.method protected onAllocatePoolItem()Lorg/anddev/andengine/util/pool/PoolItem;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lorg/anddev/andengine/util/pool/PoolUpdateHandler$2;->this$0:Lorg/anddev/andengine/util/pool/PoolUpdateHandler;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/pool/PoolUpdateHandler;->onAllocatePoolItem()Lorg/anddev/andengine/util/pool/PoolItem;

    move-result-object v0

    return-object v0
.end method
