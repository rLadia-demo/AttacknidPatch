.class public Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;
.super Lorg/anddev/andengine/input/touch/detector/BaseDetector;
.source "PinchZoomDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;
    }
.end annotation


# static fields
.field private static final TRIGGER_PINCHZOOM_MINIMUM_DISTANCE_DEFAULT:F = 10.0f


# instance fields
.field private mCurrentDistance:F

.field private mInitialDistance:F

.field private final mPinchZoomDetectorListener:Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;

.field private mPinchZooming:Z


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;)V
    .locals 1
    .parameter "pPinchZoomDetectorListener"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/anddev/andengine/input/touch/detector/BaseDetector;-><init>()V

    .line 38
    invoke-static {}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->isSupportedByAndroidVersion()Z

    move-result v0

    if-nez v0, :cond_0

    .line 39
    new-instance v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException;-><init>()V

    throw v0

    .line 41
    :cond_0
    iput-object p1, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZoomDetectorListener:Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;

    .line 42
    return-void
.end method

.method private calculatePointerDistance(Landroid/view/MotionEvent;)F
    .locals 6
    .parameter "pMotionEvent"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 103
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float v0, v2, v3

    .line 104
    .local v0, x:F
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    sub-float v1, v2, v3

    .line 105
    .local v1, y:F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    invoke-static {v2}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v2

    return v2
.end method

.method private getZoomFactor()F
    .locals 2

    .prologue
    .line 92
    iget v0, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mCurrentDistance:F

    iget v1, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mInitialDistance:F

    div-float/2addr v0, v1

    return v0
.end method


# virtual methods
.method public isZooming()Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZooming:Z

    return v0
.end method

.method public onManagedTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 5
    .parameter "pSceneTouchEvent"

    .prologue
    const/4 v4, 0x1

    const/high16 v3, 0x4120

    .line 58
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getMotionEvent()Landroid/view/MotionEvent;

    move-result-object v1

    .line 60
    .local v1, motionEvent:Landroid/view/MotionEvent;
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    and-int/lit16 v0, v2, 0xff

    .line 62
    .local v0, action:I
    packed-switch v0, :pswitch_data_0

    .line 88
    :cond_0
    :goto_0
    :pswitch_0
    return v4

    .line 64
    :pswitch_1
    iget-boolean v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZooming:Z

    if-nez v2, :cond_0

    .line 65
    invoke-direct {p0, v1}, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->calculatePointerDistance(Landroid/view/MotionEvent;)F

    move-result v2

    iput v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mInitialDistance:F

    .line 66
    iget v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mInitialDistance:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 67
    iput-boolean v4, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZooming:Z

    .line 68
    iget-object v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZoomDetectorListener:Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;

    invoke-interface {v2, p0, p1}, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;->onPinchZoomStarted(Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;Lorg/anddev/andengine/input/touch/TouchEvent;)V

    goto :goto_0

    .line 74
    :pswitch_2
    iget-boolean v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZooming:Z

    if-eqz v2, :cond_0

    .line 75
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZooming:Z

    .line 76
    iget-object v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZoomDetectorListener:Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;

    invoke-direct {p0}, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->getZoomFactor()F

    move-result v3

    invoke-interface {v2, p0, p1, v3}, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;->onPinchZoomFinished(Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;Lorg/anddev/andengine/input/touch/TouchEvent;F)V

    goto :goto_0

    .line 80
    :pswitch_3
    iget-boolean v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZooming:Z

    if-eqz v2, :cond_0

    .line 81
    invoke-direct {p0, v1}, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->calculatePointerDistance(Landroid/view/MotionEvent;)F

    move-result v2

    iput v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mCurrentDistance:F

    .line 82
    iget v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mCurrentDistance:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 83
    iget-object v2, p0, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->mPinchZoomDetectorListener:Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;

    invoke-direct {p0}, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;->getZoomFactor()F

    move-result v3

    invoke-interface {v2, p0, p1, v3}, Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector$IPinchZoomDetectorListener;->onPinchZoom(Lorg/anddev/andengine/extension/input/touch/detector/PinchZoomDetector;Lorg/anddev/andengine/input/touch/TouchEvent;F)V

    goto :goto_0

    .line 62
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
