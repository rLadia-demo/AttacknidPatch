.class public Lorg/anddev/andengine/input/touch/detector/SurfaceScrollDetector;
.super Lorg/anddev/andengine/input/touch/detector/ScrollDetector;
.source "SurfaceScrollDetector.java"


# direct methods
.method public constructor <init>(FLorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;)V
    .locals 0
    .parameter "pTriggerScrollMinimumDistance"
    .parameter "pScrollDetectorListener"

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;-><init>(FLorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;)V
    .locals 0
    .parameter "pScrollDetectorListener"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lorg/anddev/andengine/input/touch/detector/ScrollDetector;-><init>(Lorg/anddev/andengine/input/touch/detector/ScrollDetector$IScrollDetectorListener;)V

    .line 28
    return-void
.end method


# virtual methods
.method protected getX(Lorg/anddev/andengine/input/touch/TouchEvent;)F
    .locals 1
    .parameter "pTouchEvent"

    .prologue
    .line 40
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getMotionEvent()Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    return v0
.end method

.method protected getY(Lorg/anddev/andengine/input/touch/TouchEvent;)F
    .locals 1
    .parameter "pTouchEvent"

    .prologue
    .line 45
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getMotionEvent()Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    return v0
.end method
