.class public Lorg/anddev/andengine/input/touch/detector/ScrollDetector;
.super Lorg/anddev/andengine/input/touch/detector/BaseDetector;
.source "ScrollDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;
    }
.end annotation


# static fields
.field private static final TRIGGER_SCROLL_MINIMUM_DISTANCE_DEFAULT:F = 10.0f


# instance fields
.field private mLastX:F

.field private mLastY:F

.field private final mScrollDetectorListener:Lorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;

.field private mTriggerScrollMinimumDistance:F

.field private mTriggered:Z


# direct methods
.method public constructor <init>(FLorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;)V
    .locals 0
    .parameter "pTriggerScrollMinimumDistance"
    .parameter "pScrollDetectorListener"

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/anddev/andengine/input/touch/detector/BaseDetector;-><init>()V

    .line 40
    iput p1, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mTriggerScrollMinimumDistance:F

    .line 41
    iput-object p2, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mScrollDetectorListener:Lorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;

    .line 42
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;)V
    .locals 1
    .parameter "pScrollDetectorListener"

    .prologue
    .line 36
    const/high16 v0, 0x4120

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;-><init>(FLorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;)V

    .line 37
    return-void
.end method


# virtual methods
.method public getTriggerScrollMinimumDistance()F
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mTriggerScrollMinimumDistance:F

    return v0
.end method

.method protected getX(Lorg/anddev/andengine/input/touch/TouchEvent;)F
    .locals 1
    .parameter "pTouchEvent"

    .prologue
    .line 95
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v0

    return v0
.end method

.method protected getY(Lorg/anddev/andengine/input/touch/TouchEvent;)F
    .locals 1
    .parameter "pTouchEvent"

    .prologue
    .line 99
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v0

    return v0
.end method

.method public onManagedTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 8
    .parameter "pSceneTouchEvent"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 62
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->getX(Lorg/anddev/andengine/input/touch/TouchEvent;)F

    move-result v2

    .line 63
    .local v2, touchX:F
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->getY(Lorg/anddev/andengine/input/touch/TouchEvent;)F

    move-result v3

    .line 65
    .local v3, touchY:F
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getAction()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    move v5, v6

    .line 86
    :cond_0
    :goto_0
    return v5

    .line 67
    :pswitch_0
    iput v2, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mLastX:F

    .line 68
    iput v3, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mLastY:F

    .line 69
    iput-boolean v6, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mTriggered:Z

    goto :goto_0

    .line 74
    :pswitch_1
    iget v6, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mLastX:F

    sub-float v0, v2, v6

    .line 75
    .local v0, distanceX:F
    iget v6, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mLastY:F

    sub-float v1, v3, v6

    .line 77
    .local v1, distanceY:F
    iget v4, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mTriggerScrollMinimumDistance:F

    .line 78
    .local v4, triggerScrollMinimumDistance:F
    iget-boolean v6, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mTriggered:Z

    if-nez v6, :cond_1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v6, v6, v4

    if-gtz v6, :cond_1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v6, v6, v4

    if-lez v6, :cond_0

    .line 79
    :cond_1
    iget-object v6, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mScrollDetectorListener:Lorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;

    invoke-interface {v6, p0, p1, v0, v1}, Lorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;->onScroll(Lorg/anddev/andengine/input/touch/detector/ScrollDetector;Lorg/anddev/andengine/input/touch/TouchEvent;FF)V

    .line 80
    iput v2, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mLastX:F

    .line 81
    iput v3, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mLastY:F

    .line 82
    iput-boolean v5, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mTriggered:Z

    goto :goto_0

    .line 65
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public setTriggerScrollMinimumDistance(F)V
    .locals 0
    .parameter "pTriggerScrollMinimumDistance"

    .prologue
    .line 53
    iput p1, p0, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;->mTriggerScrollMinimumDistance:F

    .line 54
    return-void
.end method
