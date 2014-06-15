.class public Lorg/anddev/andengine/audio/sound/SoundManager;
.super Lorg/anddev/andengine/audio/BaseAudioManager;
.source "SoundManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/audio/BaseAudioManager",
        "<",
        "Lorg/anddev/andengine/audio/sound/Sound;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_SIMULTANEOUS_STREAMS_DEFAULT:I = 0x5


# instance fields
.field private final mSoundPool:Landroid/media/SoundPool;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lorg/anddev/andengine/audio/sound/SoundManager;-><init>(I)V

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .parameter "pMaxSimultaneousStreams"

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/anddev/andengine/audio/BaseAudioManager;-><init>()V

    .line 34
    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lorg/anddev/andengine/audio/sound/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    .line 35
    return-void
.end method


# virtual methods
.method getSoundPool()Landroid/media/SoundPool;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lorg/anddev/andengine/audio/sound/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    return-object v0
.end method

.method public releaseAll()V
    .locals 1

    .prologue
    .line 55
    invoke-super {p0}, Lorg/anddev/andengine/audio/BaseAudioManager;->releaseAll()V

    .line 57
    iget-object v0, p0, Lorg/anddev/andengine/audio/sound/SoundManager;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 58
    return-void
.end method
