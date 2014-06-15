.class Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;
.super Lorg/anddev/andengine/util/pool/RunnablePoolItem;
.source "BaseTouchController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/input/touch/controller/BaseTouchController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TouchEventRunnablePoolItem"
.end annotation


# instance fields
.field private mTouchEvent:Lorg/anddev/andengine/input/touch/TouchEvent;

.field final synthetic this$0:Lorg/anddev/andengine/input/touch/controller/BaseTouchController;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/input/touch/controller/BaseTouchController;)V
    .locals 0
    .parameter

    .prologue
    .line 101
    iput-object p1, p0, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;->this$0:Lorg/anddev/andengine/input/touch/controller/BaseTouchController;

    invoke-direct {p0}, Lorg/anddev/andengine/util/pool/RunnablePoolItem;-><init>()V

    return-void
.end method


# virtual methods
.method protected onRecycle()V
    .locals 2

    .prologue
    .line 126
    invoke-super {p0}, Lorg/anddev/andengine/util/pool/RunnablePoolItem;->onRecycle()V

    .line 127
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;->mTouchEvent:Lorg/anddev/andengine/input/touch/TouchEvent;

    .line 128
    .local v0, touchEvent:Lorg/anddev/andengine/input/touch/TouchEvent;
    invoke-virtual {v0}, Lorg/anddev/andengine/input/touch/TouchEvent;->getMotionEvent()Landroid/view/MotionEvent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 129
    invoke-virtual {v0}, Lorg/anddev/andengine/input/touch/TouchEvent;->recycle()V

    .line 130
    return-void
.end method

.method public run()V
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;->this$0:Lorg/anddev/andengine/input/touch/controller/BaseTouchController;

    #getter for: Lorg/anddev/andengine/input/touch/controller/BaseTouchController;->mTouchEventCallback:Lorg/anddev/andengine/input/touch/controller/ITouchController$ITouchEventCallback;
    invoke-static {v0}, Lorg/anddev/andengine/input/touch/controller/BaseTouchController;->access$0(Lorg/anddev/andengine/input/touch/controller/BaseTouchController;)Lorg/anddev/andengine/input/touch/controller/ITouchController$ITouchEventCallback;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;->mTouchEvent:Lorg/anddev/andengine/input/touch/TouchEvent;

    invoke-interface {v0, v1}, Lorg/anddev/andengine/input/touch/controller/ITouchController$ITouchEventCallback;->onTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    .line 122
    return-void
.end method

.method public set(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 0
    .parameter "pTouchEvent"

    .prologue
    .line 113
    iput-object p1, p0, Lorg/anddev/andengine/input/touch/controller/BaseTouchController$TouchEventRunnablePoolItem;->mTouchEvent:Lorg/anddev/andengine/input/touch/TouchEvent;

    .line 114
    return-void
.end method
