.class public Lorg/anddev/andengine/entity/util/FPSLogger;
.super Lorg/anddev/andengine/entity/util/AverageFPSCounter;
.source "FPSLogger.java"


# instance fields
.field protected mLongestFrame:F

.field protected mShortestFrame:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/anddev/andengine/entity/util/AverageFPSCounter;-><init>()V

    .line 18
    const v0, 0x7f7fffff

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mShortestFrame:F

    .line 19
    const/4 v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mLongestFrame:F

    .line 27
    return-void
.end method

.method public constructor <init>(F)V
    .locals 1
    .parameter "pAverageDuration"

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/util/AverageFPSCounter;-><init>(F)V

    .line 18
    const v0, 0x7f7fffff

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mShortestFrame:F

    .line 19
    const/4 v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mLongestFrame:F

    .line 31
    return-void
.end method


# virtual methods
.method protected onHandleAverageDurationElapsed(F)V
    .locals 1
    .parameter "pFPS"

    .prologue
    .line 43
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/util/FPSLogger;->onLogFPS()V

    .line 45
    const/4 v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mLongestFrame:F

    .line 46
    const v0, 0x7f7fffff

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mShortestFrame:F

    .line 47
    return-void
.end method

.method protected onLogFPS()V
    .locals 6

    .prologue
    const/high16 v5, 0x447a

    .line 70
    const-string v0, "FPS: %.2f (MIN: %.0f ms | MAX: %.0f ms)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 71
    iget v3, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mFrames:I

    int-to-float v3, v3

    iget v4, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mSecondsElapsed:F

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    .line 72
    iget v3, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mShortestFrame:F

    mul-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    .line 73
    iget v3, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mLongestFrame:F

    mul-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    .line 70
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public onUpdate(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 51
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/util/AverageFPSCounter;->onUpdate(F)V

    .line 53
    iget v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mShortestFrame:F

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mShortestFrame:F

    .line 54
    iget v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mLongestFrame:F

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mLongestFrame:F

    .line 55
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 59
    invoke-super {p0}, Lorg/anddev/andengine/entity/util/AverageFPSCounter;->reset()V

    .line 61
    const v0, 0x7f7fffff

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mShortestFrame:F

    .line 62
    const/4 v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/util/FPSLogger;->mLongestFrame:F

    .line 63
    return-void
.end method
