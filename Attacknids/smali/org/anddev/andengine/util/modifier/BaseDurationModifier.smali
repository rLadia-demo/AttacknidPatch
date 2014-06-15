.class public abstract Lorg/anddev/andengine/util/modifier/BaseDurationModifier;
.super Lorg/anddev/andengine/util/modifier/BaseModifier;
.source "BaseDurationModifier.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/anddev/andengine/util/modifier/BaseModifier",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final mDuration:F

.field private mTotalSecondsElapsed:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 26
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    const/high16 v0, -0x4080

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>(FLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 27
    return-void
.end method

.method public constructor <init>(F)V
    .locals 1
    .parameter "pDuration"

    .prologue
    .line 30
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>(FLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 31
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V
    .locals 0
    .parameter "pDuration"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    .local p2, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    invoke-direct {p0, p2}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 35
    iput p1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mDuration:F

    .line 36
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/util/modifier/BaseDurationModifier;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/BaseDurationModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    .local p1, pBaseModifier:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    iget v0, p1, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mDuration:F

    iget-object v1, p1, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    invoke-direct {p0, v0, v1}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>(FLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 40
    return-void
.end method


# virtual methods
.method public getDuration()F
    .locals 1

    .prologue
    .line 55
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    iget v0, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mDuration:F

    return v0
.end method

.method protected getTotalSecondsElapsed()F
    .locals 1

    .prologue
    .line 47
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    iget v0, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    return v0
.end method

.method protected abstract onManagedInitialize(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method protected abstract onManagedUpdate(FLjava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FTT;)V"
        }
    .end annotation
.end method

.method public final onUpdate(FLjava/lang/Object;)V
    .locals 3
    .parameter "pSecondsElapsed"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FTT;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    .local p2, pItem:Ljava/lang/Object;,"TT;"
    iget-boolean v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mFinished:Z

    if-nez v1, :cond_1

    .line 65
    iget v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    .line 66
    invoke-virtual {p0, p2}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->onManagedInitialize(Ljava/lang/Object;)V

    .line 70
    :cond_0
    iget v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    add-float/2addr v1, p1

    iget v2, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mDuration:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2

    .line 71
    move v0, p1

    .line 76
    .local v0, secondsToElapse:F
    :goto_0
    iget v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    add-float/2addr v1, v0

    iput v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    .line 77
    invoke-virtual {p0, v0, p2}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->onManagedUpdate(FLjava/lang/Object;)V

    .line 79
    iget v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mDuration:F

    const/high16 v2, -0x4080

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    iget v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    iget v2, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mDuration:F

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_1

    .line 80
    iget v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mDuration:F

    iput v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    .line 81
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mFinished:Z

    .line 82
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    if-eqz v1, :cond_1

    .line 83
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;

    invoke-interface {v1, p0, p2}, Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;->onModifierFinished(Lorg/anddev/andengine/util/modifier/IModifier;Ljava/lang/Object;)V

    .line 87
    .end local v0           #secondsToElapse:F
    :cond_1
    return-void

    .line 73
    :cond_2
    iget v1, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mDuration:F

    iget v2, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    sub-float v0, v1, v2

    .restart local v0       #secondsToElapse:F
    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 90
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseDurationModifier;,"Lorg/anddev/andengine/util/modifier/BaseDurationModifier<TT;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mFinished:Z

    .line 91
    const/4 v0, 0x0

    iput v0, p0, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;->mTotalSecondsElapsed:F

    .line 92
    return-void
.end method
