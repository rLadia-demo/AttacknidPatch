.class public Lorg/anddev/andengine/input/touch/detector/HoldDetector;
.super Lorg/anddev/andengine/input/touch/detector/BaseDetector;
.source "HoldDetector.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;
    }
.end annotation


# static fields
.field private static final TIME_BETWEEN_UPDATES_DEFAULT:F = 0.1f

.field private static final TRIGGER_HOLD_MAXIMUM_DISTANCE_DEFAULT:F = 10.0f

.field private static final TRIGGER_HOLD_MINIMUM_MILLISECONDS_DEFAULT:J = 0xc8L


# instance fields
.field private mDownTimeMilliseconds:J

.field private mDownX:F

.field private mDownY:F

.field private final mHoldDetectorListener:Lorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;

.field private mHoldX:F

.field private mHoldY:F

.field private mMaximumDistanceExceeded:Z

.field private final mTimerHandler:Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

.field private mTriggerHoldMaximumDistance:F

.field private mTriggerHoldMinimumMilliseconds:J

.field private mTriggerOnHold:Z

.field private mTriggerOnHoldFinished:Z


# direct methods
.method public constructor <init>(JFFLorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;)V
    .locals 3
    .parameter "pTriggerHoldMinimumMilliseconds"
    .parameter "pTriggerHoldMaximumDistance"
    .parameter "pTimeBetweenUpdates"
    .parameter "pClickDetectorListener"

    .prologue
    const/4 v2, 0x0

    .line 60
    invoke-direct {p0}, Lorg/anddev/andengine/input/touch/detector/BaseDetector;-><init>()V

    .line 37
    const-wide/high16 v0, -0x8000

    iput-wide v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownTimeMilliseconds:J

    .line 45
    iput-boolean v2, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mMaximumDistanceExceeded:Z

    .line 47
    iput-boolean v2, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHold:Z

    .line 48
    iput-boolean v2, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHoldFinished:Z

    .line 61
    iput-wide p1, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMinimumMilliseconds:J

    .line 62
    iput p3, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMaximumDistance:F

    .line 63
    iput-object p5, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldDetectorListener:Lorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;

    .line 65
    new-instance v0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

    const/4 v1, 0x1

    new-instance v2, Lorg/anddev/andengine/input/touch/detector/HoldDetector$1;

    invoke-direct {v2, p0}, Lorg/anddev/andengine/input/touch/detector/HoldDetector$1;-><init>(Lorg/anddev/andengine/input/touch/detector/HoldDetector;)V

    invoke-direct {v0, p4, v1, v2}, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;-><init>(FZLorg/anddev/andengine/engine/handler/timer/ITimerCallback;)V

    iput-object v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTimerHandler:Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

    .line 71
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;)V
    .locals 6
    .parameter "pClickDetectorListener"

    .prologue
    .line 57
    const-wide/16 v1, 0xc8

    const/high16 v3, 0x4120

    const v4, 0x3dcccccd

    move-object v0, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/input/touch/detector/HoldDetector;-><init>(JFFLorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;)V

    .line 58
    return-void
.end method


# virtual methods
.method protected fireListener()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 164
    iget-boolean v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHoldFinished:Z

    if-eqz v0, :cond_1

    .line 165
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldDetectorListener:Lorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownTimeMilliseconds:J

    sub-long v2, v1, v3

    iget v4, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldX:F

    iget v5, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldY:F

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;->onHoldFinished(Lorg/anddev/andengine/input/touch/detector/HoldDetector;JFF)V

    .line 166
    iput-boolean v6, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHoldFinished:Z

    .line 167
    iput-boolean v6, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHold:Z

    .line 171
    :cond_0
    :goto_0
    return-void

    .line 168
    :cond_1
    iget-boolean v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHold:Z

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldDetectorListener:Lorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownTimeMilliseconds:J

    sub-long v2, v1, v3

    iget v4, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldX:F

    iget v5, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldY:F

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Lorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;->onHold(Lorg/anddev/andengine/input/touch/detector/HoldDetector;JFF)V

    goto :goto_0
.end method

.method public getTriggerHoldMaximumDistance()F
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMaximumDistance:F

    return v0
.end method

.method public getTriggerHoldMinimumMilliseconds()J
    .locals 2

    .prologue
    .line 78
    iget-wide v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMinimumMilliseconds:J

    return-wide v0
.end method

.method public isHolding()Z
    .locals 1

    .prologue
    .line 94
    iget-boolean v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHold:Z

    return v0
.end method

.method public onManagedTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 12
    .parameter "pSceneTouchEvent"

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 113
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getMotionEvent()Landroid/view/MotionEvent;

    move-result-object v4

    .line 115
    .local v4, motionEvent:Landroid/view/MotionEvent;
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v10

    iput v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldX:F

    .line 116
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v10

    iput v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mHoldY:F

    .line 118
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getAction()I

    move-result v10

    packed-switch v10, :pswitch_data_0

    move v9, v8

    .line 155
    :cond_0
    :goto_0
    return v9

    .line 120
    :pswitch_0
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v10

    iput-wide v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownTimeMilliseconds:J

    .line 121
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    iput v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownX:F

    .line 122
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    iput v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownY:F

    .line 123
    iput-boolean v8, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mMaximumDistanceExceeded:Z

    goto :goto_0

    .line 127
    :pswitch_1
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    .line 129
    .local v0, currentTimeMilliseconds:J
    iget v5, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMaximumDistance:F

    .line 130
    .local v5, triggerHoldMaximumDistance:F
    iget-boolean v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mMaximumDistanceExceeded:Z

    if-nez v10, :cond_2

    iget v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownX:F

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    cmpl-float v10, v10, v5

    if-gtz v10, :cond_2

    iget v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownY:F

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    cmpl-float v10, v10, v5

    if-gtz v10, :cond_2

    :goto_1
    iput-boolean v8, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mMaximumDistanceExceeded:Z

    .line 131
    iget-boolean v8, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHold:Z

    if-nez v8, :cond_1

    iget-boolean v8, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mMaximumDistanceExceeded:Z

    if-nez v8, :cond_0

    .line 132
    :cond_1
    iget-wide v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownTimeMilliseconds:J

    sub-long v2, v0, v10

    .line 133
    .local v2, holdTimeMilliseconds:J
    iget-wide v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMinimumMilliseconds:J

    cmp-long v8, v2, v10

    if-ltz v8, :cond_0

    .line 134
    iput-boolean v9, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHold:Z

    goto :goto_0

    .end local v2           #holdTimeMilliseconds:J
    :cond_2
    move v8, v9

    .line 130
    goto :goto_1

    .line 142
    .end local v0           #currentTimeMilliseconds:J
    .end local v5           #triggerHoldMaximumDistance:F
    :pswitch_2
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v6

    .line 144
    .local v6, upTimeMilliseconds:J
    iget v5, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMaximumDistance:F

    .line 145
    .restart local v5       #triggerHoldMaximumDistance:F
    iget-boolean v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mMaximumDistanceExceeded:Z

    if-nez v10, :cond_4

    iget v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownX:F

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    cmpl-float v10, v10, v5

    if-gtz v10, :cond_4

    iget v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownY:F

    invoke-virtual {v4}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    cmpl-float v10, v10, v5

    if-gtz v10, :cond_4

    :goto_2
    iput-boolean v8, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mMaximumDistanceExceeded:Z

    .line 146
    iget-boolean v8, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHold:Z

    if-nez v8, :cond_3

    iget-boolean v8, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mMaximumDistanceExceeded:Z

    if-nez v8, :cond_0

    .line 147
    :cond_3
    iget-wide v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mDownTimeMilliseconds:J

    sub-long v2, v6, v10

    .line 148
    .restart local v2       #holdTimeMilliseconds:J
    iget-wide v10, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMinimumMilliseconds:J

    cmp-long v8, v2, v10

    if-ltz v8, :cond_0

    .line 149
    iput-boolean v9, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerOnHoldFinished:Z

    goto/16 :goto_0

    .end local v2           #holdTimeMilliseconds:J
    :cond_4
    move v8, v9

    .line 145
    goto :goto_2

    .line 118
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onUpdate(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 103
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTimerHandler:Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->onUpdate(F)V

    .line 104
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTimerHandler:Lorg/anddev/andengine/engine/handler/timer/TimerHandler;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->reset()V

    .line 109
    return-void
.end method

.method public setTriggerHoldMaximumDistance(F)V
    .locals 0
    .parameter "pTriggerHoldMaximumDistance"

    .prologue
    .line 90
    iput p1, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMaximumDistance:F

    .line 91
    return-void
.end method

.method public setTriggerHoldMinimumMilliseconds(J)V
    .locals 0
    .parameter "pTriggerHoldMinimumMilliseconds"

    .prologue
    .line 82
    iput-wide p1, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->mTriggerHoldMinimumMilliseconds:J

    .line 83
    return-void
.end method
