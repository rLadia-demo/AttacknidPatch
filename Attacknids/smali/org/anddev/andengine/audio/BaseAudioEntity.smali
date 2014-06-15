.class public abstract Lorg/anddev/andengine/audio/BaseAudioEntity;
.super Ljava/lang/Object;
.source "BaseAudioEntity.java"

# interfaces
.implements Lorg/anddev/andengine/audio/IAudioEntity;


# instance fields
.field private final mAudioManager:Lorg/anddev/andengine/audio/IAudioManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/audio/IAudioManager",
            "<+",
            "Lorg/anddev/andengine/audio/IAudioEntity;",
            ">;"
        }
    .end annotation
.end field

.field protected mLeftVolume:F

.field protected mRightVolume:F


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/audio/IAudioManager;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/audio/IAudioManager",
            "<+",
            "Lorg/anddev/andengine/audio/IAudioEntity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, pAudioManager:Lorg/anddev/andengine/audio/IAudioManager;,"Lorg/anddev/andengine/audio/IAudioManager<+Lorg/anddev/andengine/audio/IAudioEntity;>;"
    const/high16 v0, 0x3f80

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mLeftVolume:F

    .line 19
    iput v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mRightVolume:F

    .line 26
    iput-object p1, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mAudioManager:Lorg/anddev/andengine/audio/IAudioManager;

    .line 27
    return-void
.end method


# virtual methods
.method public getActualLeftVolume()F
    .locals 2

    .prologue
    .line 38
    iget v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mLeftVolume:F

    invoke-virtual {p0}, Lorg/anddev/andengine/audio/BaseAudioEntity;->getMasterVolume()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method public getActualRightVolume()F
    .locals 2

    .prologue
    .line 42
    iget v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mRightVolume:F

    invoke-virtual {p0}, Lorg/anddev/andengine/audio/BaseAudioEntity;->getMasterVolume()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method protected getAudioManager()Lorg/anddev/andengine/audio/IAudioManager;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/audio/IAudioManager",
            "<+",
            "Lorg/anddev/andengine/audio/IAudioEntity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    iget-object v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mAudioManager:Lorg/anddev/andengine/audio/IAudioManager;

    return-object v0
.end method

.method public getLeftVolume()F
    .locals 1

    .prologue
    .line 60
    iget v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mLeftVolume:F

    return v0
.end method

.method protected getMasterVolume()F
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mAudioManager:Lorg/anddev/andengine/audio/IAudioManager;

    invoke-interface {v0}, Lorg/anddev/andengine/audio/IAudioManager;->getMasterVolume()F

    move-result v0

    return v0
.end method

.method public getRightVolume()F
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mRightVolume:F

    return v0
.end method

.method public getVolume()F
    .locals 2

    .prologue
    .line 55
    iget v0, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mLeftVolume:F

    iget v1, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mRightVolume:F

    add-float/2addr v0, v1

    const/high16 v1, 0x3f00

    mul-float/2addr v0, v1

    return v0
.end method

.method public final setVolume(F)V
    .locals 0
    .parameter "pVolume"

    .prologue
    .line 70
    invoke-virtual {p0, p1, p1}, Lorg/anddev/andengine/audio/BaseAudioEntity;->setVolume(FF)V

    .line 71
    return-void
.end method

.method public setVolume(FF)V
    .locals 0
    .parameter "pLeftVolume"
    .parameter "pRightVolume"

    .prologue
    .line 75
    iput p1, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mLeftVolume:F

    .line 76
    iput p2, p0, Lorg/anddev/andengine/audio/BaseAudioEntity;->mRightVolume:F

    .line 77
    return-void
.end method
