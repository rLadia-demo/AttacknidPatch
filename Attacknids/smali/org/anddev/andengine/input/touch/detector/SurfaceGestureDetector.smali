.class public abstract Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector;
.super Lorg/anddev/andengine/input/touch/detector/BaseDetector;
.source "SurfaceGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector$InnerOnGestureDetectorListener;,
        Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector$SurfaceGestureDetectorAdapter;
    }
.end annotation


# static fields
.field private static final SWIPE_MIN_DISTANCE_DEFAULT:F = 120.0f


# instance fields
.field private final mGestureDetector:Landroid/view/GestureDetector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    const/high16 v0, 0x42f0

    invoke-direct {p0, v0}, Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector;-><init>(F)V

    .line 33
    return-void
.end method

.method public constructor <init>(F)V
    .locals 2
    .parameter "pSwipeMinDistance"

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/anddev/andengine/input/touch/detector/BaseDetector;-><init>()V

    .line 36
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector$InnerOnGestureDetectorListener;

    invoke-direct {v1, p0, p1}, Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector$InnerOnGestureDetectorListener;-><init>(Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector;F)V

    invoke-direct {v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector;->mGestureDetector:Landroid/view/GestureDetector;

    .line 37
    return-void
.end method


# virtual methods
.method protected abstract onDoubleTap()Z
.end method

.method public onManagedTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 2
    .parameter "pSceneTouchEvent"

    .prologue
    .line 56
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/detector/SurfaceGestureDetector;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getMotionEvent()Landroid/view/MotionEvent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected abstract onSingleTap()Z
.end method

.method protected abstract onSwipeDown()Z
.end method

.method protected abstract onSwipeLeft()Z
.end method

.method protected abstract onSwipeRight()Z
.end method

.method protected abstract onSwipeUp()Z
.end method
