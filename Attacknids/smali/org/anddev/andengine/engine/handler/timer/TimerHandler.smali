.class public Lorg/anddev/andengine/engine/handler/timer/TimerHandler;
.super Ljava/lang/Object;
.source "TimerHandler.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# instance fields
.field private mAutoReset:Z

.field private mCallbackTriggered:Z

.field private final mTimerCallback:Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;

.field private mTimerSeconds:F

.field private mTimerSecondsElapsed:F


# direct methods
.method public constructor <init>(FLorg/anddev/andengine/engine/handler/timer/ITimerCallback;)V
    .locals 1
    .parameter "pTimerSeconds"
    .parameter "pTimerCallback"

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;-><init>(FZLorg/anddev/andengine/engine/handler/timer/ITimerCallback;)V

    .line 30
    return-void
.end method

.method public constructor <init>(FZLorg/anddev/andengine/engine/handler/timer/ITimerCallback;)V
    .locals 1
    .parameter "pTimerSeconds"
    .parameter "pAutoReset"
    .parameter "pTimerCallback"

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mCallbackTriggered:Z

    .line 33
    iput p1, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSeconds:F

    .line 34
    iput-boolean p2, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mAutoReset:Z

    .line 35
    iput-object p3, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerCallback:Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;

    .line 36
    return-void
.end method


# virtual methods
.method public getTimerSeconds()F
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSeconds:F

    return v0
.end method

.method public getTimerSecondsElapsed()F
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    return v0
.end method

.method public isAutoReset()Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mAutoReset:Z

    return v0
.end method

.method public onUpdate(F)V
    .locals 2
    .parameter "pSecondsElapsed"

    .prologue
    .line 72
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mAutoReset:Z

    if-eqz v0, :cond_2

    .line 73
    iget v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    add-float/2addr v0, p1

    iput v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    .line 74
    :goto_0
    iget v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    iget v1, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSeconds:F

    cmpl-float v0, v0, v1

    if-gez v0, :cond_1

    .line 87
    :cond_0
    :goto_1
    return-void

    .line 75
    :cond_1
    iget v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    iget v1, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSeconds:F

    sub-float/2addr v0, v1

    iput v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    .line 76
    iget-object v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerCallback:Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;

    invoke-interface {v0, p0}, Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;->onTimePassed(Lorg/anddev/andengine/engine/handler/timer/TimerHandler;)V

    goto :goto_0

    .line 79
    :cond_2
    iget-boolean v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mCallbackTriggered:Z

    if-nez v0, :cond_0

    .line 80
    iget v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    add-float/2addr v0, p1

    iput v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    .line 81
    iget v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    iget v1, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSeconds:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mCallbackTriggered:Z

    .line 83
    iget-object v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerCallback:Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;

    invoke-interface {v0, p0}, Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;->onTimePassed(Lorg/anddev/andengine/engine/handler/timer/TimerHandler;)V

    goto :goto_1
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mCallbackTriggered:Z

    .line 92
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSecondsElapsed:F

    .line 93
    return-void
.end method

.method public setAutoReset(Z)V
    .locals 0
    .parameter "pAutoReset"

    .prologue
    .line 47
    iput-boolean p1, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mAutoReset:Z

    .line 48
    return-void
.end method

.method public setTimerSeconds(F)V
    .locals 0
    .parameter "pTimerSeconds"

    .prologue
    .line 55
    iput p1, p0, Lorg/anddev/andengine/engine/handler/timer/TimerHandler;->mTimerSeconds:F

    .line 56
    return-void
.end method
