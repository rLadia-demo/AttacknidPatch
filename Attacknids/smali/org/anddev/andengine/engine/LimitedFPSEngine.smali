.class public Lorg/anddev/andengine/engine/LimitedFPSEngine;
.super Lorg/anddev/andengine/engine/Engine;
.source "LimitedFPSEngine.java"


# instance fields
.field private final mPreferredFrameLengthNanoseconds:J


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/engine/options/EngineOptions;I)V
    .locals 4
    .parameter "pEngineOptions"
    .parameter "pFramesPerSecond"

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lorg/anddev/andengine/engine/Engine;-><init>(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    .line 30
    const-wide/32 v0, 0x3b9aca00

    int-to-long v2, p2

    div-long/2addr v0, v2

    iput-wide v0, p0, Lorg/anddev/andengine/engine/LimitedFPSEngine;->mPreferredFrameLengthNanoseconds:J

    .line 31
    return-void
.end method


# virtual methods
.method public onUpdate(J)V
    .locals 7
    .parameter "pNanosecondsElapsed"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 43
    iget-wide v2, p0, Lorg/anddev/andengine/engine/LimitedFPSEngine;->mPreferredFrameLengthNanoseconds:J

    .line 44
    .local v2, preferredFrameLengthNanoseconds:J
    sub-long v0, v2, p1

    .line 46
    .local v0, deltaFrameLengthNanoseconds:J
    const-wide/16 v5, 0x0

    cmp-long v5, v0, v5

    if-gtz v5, :cond_0

    .line 47
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/engine/Engine;->onUpdate(J)V

    .line 54
    :goto_0
    return-void

    .line 49
    :cond_0
    const-wide/32 v5, 0xf4240

    div-long v5, v0, v5

    long-to-int v4, v5

    .line 51
    .local v4, sleepTimeMilliseconds:I
    int-to-long v5, v4

    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V

    .line 52
    add-long v5, p1, v0

    invoke-super {p0, v5, v6}, Lorg/anddev/andengine/engine/Engine;->onUpdate(J)V

    goto :goto_0
.end method
