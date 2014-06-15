.class Lorg/anddev/andengine/input/touch/controller/BaseTouchController$1;
.super Lorg/anddev/andengine/util/pool/RunnablePoolUpdateHandler;
.source "BaseTouchController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/input/touch/controller/BaseTouchController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/pool/RunnablePoolUpdateHandler",
        "<",
        "Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/input/touch/controller/BaseTouchController;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/input/touch/controller/BaseTouchController;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$1;->this$0:Lorg/anddev/andengine/input/touch/controller/BaseTouchController;

    .line 27
    invoke-direct {p0}, Lorg/anddev/andengine/util/pool/RunnablePoolUpdateHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected onAllocatePoolItem()Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;
    .locals 2

    .prologue
    .line 30
    new-instance v0, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;

    iget-object v1, p0, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$1;->this$0:Lorg/anddev/andengine/input/touch/controller/BaseTouchController;

    invoke-direct {v0, v1}, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;-><init>(Lorg/anddev/andengine/input/touch/controller/BaseTouchController;)V

    return-object v0
.end method

.method protected bridge synthetic onAllocatePoolItem()Lorg/anddev/andengine/util/pool/RunnablePoolItem;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$1;->onAllocatePoolItem()Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;

    move-result-object v0

    return-object v0
.end method
