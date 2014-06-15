.class public Lorg/anddev/andengine/audio/music/Music;
.super Lorg/anddev/andengine/audio/BaseAudioEntity;
.source "Music.java"


# instance fields
.field private final mMediaPlayer:Landroid/media/MediaPlayer;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/audio/music/MusicManager;Landroid/media/MediaPlayer;)V
    .locals 0
    .parameter "pMusicManager"
    .parameter "pMediaPlayer"

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/anddev/andengine/audio/BaseAudioEntity;-><init>(Lorg/anddev/andengine/audio/IAudioManager;)V

    .line 29
    iput-object p2, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 30
    return-void
.end method


# virtual methods
.method protected bridge synthetic getAudioManager()Lorg/anddev/andengine/audio/IAudioManager;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/music/Music;->getAudioManager()Lorg/anddev/andengine/audio/music/MusicManager;

    move-result-object v0

    return-object v0
.end method

.method protected getAudioManager()Lorg/anddev/andengine/audio/music/MusicManager;
    .locals 1

    .prologue
    .line 50
    invoke-super {p0}, Lorg/anddev/andengine/audio/BaseAudioEntity;->getAudioManager()Lorg/anddev/andengine/audio/IAudioManager;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/audio/music/MusicManager;

    return-object v0
.end method

.method public getMediaPlayer()Landroid/media/MediaPlayer;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    return v0
.end method

.method public onMasterVolumeChanged(F)V
    .locals 2
    .parameter "pMasterVolume"

    .prologue
    .line 96
    iget v0, p0, Lorg/anddev/andengine/audio/music/Music;->mLeftVolume:F

    iget v1, p0, Lorg/anddev/andengine/audio/music/Music;->mRightVolume:F

    invoke-virtual {p0, v0, v1}, Lorg/anddev/andengine/audio/music/Music;->setVolume(FF)V

    .line 97
    return-void
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 71
    return-void
.end method

.method public play()V
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 56
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 76
    return-void
.end method

.method public resume()V
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 66
    return-void
.end method

.method public seekTo(I)V
    .locals 1
    .parameter "pMilliseconds"

    .prologue
    .line 104
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 105
    return-void
.end method

.method public setLooping(Z)V
    .locals 1
    .parameter "pLooping"

    .prologue
    .line 80
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 81
    return-void
.end method

.method public setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 1
    .parameter "pOnCompletionListener"

    .prologue
    .line 108
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 109
    return-void
.end method

.method public setVolume(FF)V
    .locals 4
    .parameter "pLeftVolume"
    .parameter "pRightVolume"

    .prologue
    .line 85
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/audio/BaseAudioEntity;->setVolume(FF)V

    .line 87
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/music/Music;->getAudioManager()Lorg/anddev/andengine/audio/music/MusicManager;

    move-result-object v3

    invoke-virtual {v3}, Lorg/anddev/andengine/audio/music/MusicManager;->getMasterVolume()F

    move-result v2

    .line 88
    .local v2, masterVolume:F
    mul-float v0, p1, v2

    .line 89
    .local v0, actualLeftVolume:F
    mul-float v1, p2, v2

    .line 91
    .local v1, actualRightVolume:F
    iget-object v3, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3, v0, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 92
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/anddev/andengine/audio/music/Music;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 61
    return-void
.end method
