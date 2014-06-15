.class public Lorg/anddev/andengine/input/touch/detector/ClickDetector;
.super Lorg/anddev/andengine/input/touch/detector/BaseDetector;
.source "ClickDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;
    }
.end annotation


# static fields
.field private static final TRIGGER_CLICK_MAXIMUM_MILLISECONDS_DEFAULT:J = 0xc8L


# instance fields
.field private final mClickDetectorListener:Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;

.field private mDownTimeMilliseconds:J

.field private mTriggerClickMaximumMilliseconds:J


# direct methods
.method public constructor <init>(JLorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;)V
    .locals 2
    .parameter "pTriggerClickMaximumMilliseconds"
    .parameter "pClickDetectorListener"

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/anddev/andengine/input/touch/detector/BaseDetector;-><init>()V

    .line 25
    const-wide/high16 v0, -0x8000

    iput-wide v0, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mDownTimeMilliseconds:J

    .line 36
    iput-wide p1, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mTriggerClickMaximumMilliseconds:J

    .line 37
    iput-object p3, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mClickDetectorListener:Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;)V
    .locals 2
    .parameter "pClickDetectorListener"

    .prologue
    .line 32
    const-wide/16 v0, 0xc8

    invoke-direct {p0, v0, v1, p1}, Lorg/anddev/andengine/input/touch/detector/ClickDetector;-><init>(JLorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;)V

    .line 33
    return-void
.end method


# virtual methods
.method public getTriggerClickMaximumMilliseconds()J
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mTriggerClickMaximumMilliseconds:J

    return-wide v0
.end method

.method public onManagedTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 7
    .parameter "pSceneTouchEvent"

    .prologue
    const/4 v2, 0x1

    .line 58
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 72
    :pswitch_0
    const/4 v2, 0x0

    :cond_0
    :goto_0
    return v2

    .line 60
    :pswitch_1
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getMotionEvent()Landroid/view/MotionEvent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mDownTimeMilliseconds:J

    goto :goto_0

    .line 64
    :pswitch_2
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getMotionEvent()Landroid/view/MotionEvent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    .line 66
    .local v0, upTimeMilliseconds:J
    iget-wide v3, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mDownTimeMilliseconds:J

    sub-long v3, v0, v3

    iget-wide v5, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mTriggerClickMaximumMilliseconds:J

    cmp-long v3, v3, v5

    if-gtz v3, :cond_0

    .line 67
    const-wide/high16 v3, -0x8000

    iput-wide v3, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mDownTimeMilliseconds:J

    .line 68
    iget-object v3, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mClickDetectorListener:Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;

    invoke-interface {v3, p0, p1}, Lorg/anddev/andengine/input/touch/detector/ClickDetector$IClickDetectorListener;->onClick(Lorg/anddev/andengine/input/touch/detector/ClickDetector;Lorg/anddev/andengine/input/touch/TouchEvent;)V

    goto :goto_0

    .line 58
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public setTriggerClickMaximumMilliseconds(J)V
    .locals 0
    .parameter "pClickMaximumMilliseconds"

    .prologue
    .line 49
    iput-wide p1, p0, Lorg/anddev/andengine/input/touch/detector/ClickDetector;->mTriggerClickMaximumMilliseconds:J

    .line 50
    return-void
.end method
