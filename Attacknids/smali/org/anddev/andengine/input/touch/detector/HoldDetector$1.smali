.class Lorg/anddev/andengine/input/touch/detector/HoldDetector$1;
.super Ljava/lang/Object;
.source "HoldDetector.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/timer/ITimerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/input/touch/detector/HoldDetector;-><init>(JFFLorg/anddev/andengine/input/touch/detector/HoldDetector$IHoldDetectorListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/input/touch/detector/HoldDetector;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/input/touch/detector/HoldDetector;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector$1;->this$0:Lorg/anddev/andengine/input/touch/detector/HoldDetector;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTimePassed(Lorg/anddev/andengine/engine/handler/timer/TimerHandler;)V
    .locals 1
    .parameter "pTimerHandler"

    .prologue
    .line 68
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/detector/HoldDetector$1;->this$0:Lorg/anddev/andengine/input/touch/detector/HoldDetector;

    invoke-virtual {v0}, Lorg/anddev/andengine/input/touch/detector/HoldDetector;->fireListener()V

    .line 69
    return-void
.end method
