.class public Lorg/anddev/andengine/audio/sound/Sound;
.super Lorg/anddev/andengine/audio/BaseAudioEntity;
.source "Sound.java"


# instance fields
.field private mLoopCount:I

.field private mRate:F

.field private final mSoundID:I

.field private mStreamID:I


# direct methods
.method constructor <init>(Lorg/anddev/andengine/audio/sound/SoundManager;I)V
    .locals 1
    .parameter "pSoundManager"
    .parameter "pSoundID"

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1}, Lorg/anddev/andengine/audio/BaseAudioEntity;-><init>(Lorg/anddev/andengine/audio/IAudioManager;)V

    .line 19
    iput v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    .line 21
    iput v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mLoopCount:I

    .line 22
    const/high16 v0, 0x3f80

    iput v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mRate:F

    .line 30
    iput p2, p0, Lorg/anddev/andengine/audio/sound/Sound;->mSoundID:I

    .line 31
    return-void
.end method


# virtual methods
.method protected bridge synthetic getAudioManager()Lorg/anddev/andengine/audio/IAudioManager;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    return-object v0
.end method

.method protected getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;
    .locals 1

    .prologue
    .line 61
    invoke-super {p0}, Lorg/anddev/andengine/audio/BaseAudioEntity;->getAudioManager()Lorg/anddev/andengine/audio/IAudioManager;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/audio/sound/SoundManager;

    return-object v0
.end method

.method public onMasterVolumeChanged(F)V
    .locals 2
    .parameter "pMasterVolume"

    .prologue
    .line 116
    iget v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mLeftVolume:F

    iget v1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mRightVolume:F

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/audio/sound/Sound;->setVolume(FF)V

    .line 117
    return-void
.end method

.method public pause()V
    .locals 2

    .prologue
    .line 88
    iget v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->pause(I)V

    .line 91
    :cond_0
    return-void
.end method

.method public play()V
    .locals 8

    .prologue
    .line 66
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getMasterVolume()F

    move-result v7

    .line 67
    .local v7, masterVolume:F
    iget v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mLeftVolume:F

    mul-float v2, v0, v7

    .line 68
    .local v2, leftVolume:F
    iget v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mRightVolume:F

    mul-float v3, v0, v7

    .line 69
    .local v3, rightVolume:F
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mSoundID:I

    const/4 v4, 0x1

    iget v5, p0, Lorg/anddev/andengine/audio/sound/Sound;->mLoopCount:I

    iget v6, p0, Lorg/anddev/andengine/audio/sound/Sound;->mRate:F

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    .line 70
    return-void
.end method

.method public release()V
    .locals 0

    .prologue
    .line 96
    return-void
.end method

.method public resume()V
    .locals 2

    .prologue
    .line 81
    iget v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->resume(I)V

    .line 84
    :cond_0
    return-void
.end method

.method public setLoopCount(I)V
    .locals 2
    .parameter "pLoopCount"

    .prologue
    .line 38
    iput p1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mLoopCount:I

    .line 39
    iget v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    if-eqz v0, :cond_0

    .line 40
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    invoke-virtual {v0, v1, p1}, Landroid/media/SoundPool;->setLoop(II)V

    .line 42
    :cond_0
    return-void
.end method

.method public setLooping(Z)V
    .locals 1
    .parameter "pLooping"

    .prologue
    .line 99
    if-eqz p1, :cond_0

    const/4 v0, -0x1

    :goto_0
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/audio/sound/Sound;->setLoopCount(I)V

    .line 100
    return-void

    .line 99
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setRate(F)V
    .locals 2
    .parameter "pRate"

    .prologue
    .line 45
    iput p1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mRate:F

    .line 46
    iget v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    invoke-virtual {v0, v1, p1}, Landroid/media/SoundPool;->setRate(IF)V

    .line 49
    :cond_0
    return-void
.end method

.method public setVolume(FF)V
    .locals 5
    .parameter "pLeftVolume"
    .parameter "pRightVolume"

    .prologue
    .line 104
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/audio/BaseAudioEntity;->setVolume(FF)V

    .line 105
    iget v3, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    if-eqz v3, :cond_0

    .line 106
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getMasterVolume()F

    move-result v1

    .line 107
    .local v1, masterVolume:F
    iget v3, p0, Lorg/anddev/andengine/audio/sound/Sound;->mLeftVolume:F

    mul-float v0, v3, v1

    .line 108
    .local v0, leftVolume:F
    iget v3, p0, Lorg/anddev/andengine/audio/sound/Sound;->mRightVolume:F

    mul-float v2, v3, v1

    .line 110
    .local v2, rightVolume:F
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v3

    invoke-virtual {v3}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v3

    iget v4, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    invoke-virtual {v3, v4, v0, v2}, Landroid/media/SoundPool;->setVolume(IFF)V

    .line 112
    .end local v0           #leftVolume:F
    .end local v1           #masterVolume:F
    .end local v2           #rightVolume:F
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 74
    iget v0, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/Sound;->getAudioManager()Lorg/anddev/andengine/audio/sound/SoundManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/audio/sound/Sound;->mStreamID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    .line 77
    :cond_0
    return-void
.end method
