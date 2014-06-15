.class public Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;
.super Lorg/anddev/andengine/input/touch/controller/BaseTouchController;
.source "MultiTouchController.java"


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/anddev/andengine/input/touch/controller/BaseTouchController;-><init>()V

    .line 25
    invoke-static {}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->isSupportedByAndroidVersion()Z

    move-result v0

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException;-><init>()V

    throw v0

    .line 28
    :cond_0
    return-void
.end method

.method private getPointerIndex(Landroid/view/MotionEvent;)I
    .locals 2
    .parameter "pMotionEvent"

    .prologue
    .line 80
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const v1, 0xff00

    and-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x8

    return v0
.end method

.method private onHandleTouchAction(ILandroid/view/MotionEvent;)Z
    .locals 7
    .parameter "pAction"
    .parameter "pMotionEvent"

    .prologue
    .line 74
    invoke-direct {p0, p2}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;->getPointerIndex(Landroid/view/MotionEvent;)I

    move-result v6

    .line 75
    .local v6, pointerIndex:I
    invoke-virtual {p2, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    .line 76
    .local v4, pointerID:I
    invoke-virtual {p2, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p2, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    move-object v0, p0

    move v3, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;->fireTouchEvent(FFIILandroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method private onHandleTouchMove(Landroid/view/MotionEvent;)Z
    .locals 10
    .parameter "pMotionEvent"

    .prologue
    .line 63
    const/4 v6, 0x0

    .line 64
    .local v6, handled:Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    add-int/lit8 v8, v0, -0x1

    .local v8, i:I
    :goto_0
    if-gez v8, :cond_0

    .line 70
    return v6

    .line 65
    :cond_0
    move v9, v8

    .line 66
    .local v9, pointerIndex:I
    invoke-virtual {p1, v9}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    .line 67
    .local v4, pointerID:I
    invoke-virtual {p1, v9}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v9}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    const/4 v3, 0x2

    move-object v0, p0

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;->fireTouchEvent(FFIILandroid/view/MotionEvent;)Z

    move-result v7

    .line 68
    .local v7, handledInner:Z
    if-nez v6, :cond_1

    if-nez v7, :cond_1

    const/4 v6, 0x0

    .line 64
    :goto_1
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .line 68
    :cond_1
    const/4 v6, 0x1

    goto :goto_1
.end method


# virtual methods
.method public onHandleMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "pMotionEvent"

    .prologue
    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 41
    .local v0, action:I
    packed-switch v0, :pswitch_data_0

    .line 54
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid Action detected: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :pswitch_0
    const/4 v1, 0x0

    invoke-direct {p0, v1, p1}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;->onHandleTouchAction(ILandroid/view/MotionEvent;)Z

    move-result v1

    .line 52
    :goto_0
    return v1

    .line 47
    :pswitch_1
    const/4 v1, 0x1

    invoke-direct {p0, v1, p1}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;->onHandleTouchAction(ILandroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_0

    .line 50
    :pswitch_2
    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;->onHandleTouchAction(ILandroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_0

    .line 52
    :pswitch_3
    invoke-direct {p0, p1}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;->onHandleTouchMove(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_0

    .line 41
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
