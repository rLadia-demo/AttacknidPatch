.class public abstract Lorg/anddev/andengine/audio/BaseAudioManager;
.super Ljava/lang/Object;
.source "BaseAudioManager.java"

# interfaces
.implements Lorg/anddev/andengine/audio/IAudioManager;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/anddev/andengine/audio/IAudioEntity;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/audio/IAudioManager",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final mAudioEntities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected mMasterVolume:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    .local p0, this:Lorg/anddev/andengine/audio/BaseAudioManager;,"Lorg/anddev/andengine/audio/BaseAudioManager<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/audio/BaseAudioManager;->mAudioEntities:Ljava/util/ArrayList;

    .line 20
    const/high16 v0, 0x3f80

    iput v0, p0, Lorg/anddev/andengine/audio/BaseAudioManager;->mMasterVolume:F

    .line 9
    return-void
.end method


# virtual methods
.method public add(Lorg/anddev/andengine/audio/IAudioEntity;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, this:Lorg/anddev/andengine/audio/BaseAudioManager;,"Lorg/anddev/andengine/audio/BaseAudioManager<TT;>;"
    .local p1, pAudioEntity:Lorg/anddev/andengine/audio/IAudioEntity;,"TT;"
    iget-object v0, p0, Lorg/anddev/andengine/audio/BaseAudioManager;->mAudioEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public getMasterVolume()F
    .locals 1

    .prologue
    .line 35
    .local p0, this:Lorg/anddev/andengine/audio/BaseAudioManager;,"Lorg/anddev/andengine/audio/BaseAudioManager<TT;>;"
    iget v0, p0, Lorg/anddev/andengine/audio/BaseAudioManager;->mMasterVolume:F

    return v0
.end method

.method public releaseAll()V
    .locals 4

    .prologue
    .line 55
    .local p0, this:Lorg/anddev/andengine/audio/BaseAudioManager;,"Lorg/anddev/andengine/audio/BaseAudioManager<TT;>;"
    iget-object v0, p0, Lorg/anddev/andengine/audio/BaseAudioManager;->mAudioEntities:Ljava/util/ArrayList;

    .line 56
    .local v0, audioEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TT;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_0

    .line 62
    return-void

    .line 57
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/audio/IAudioEntity;

    .line 59
    .local v1, audioEntity:Lorg/anddev/andengine/audio/IAudioEntity;,"TT;"
    invoke-interface {v1}, Lorg/anddev/andengine/audio/IAudioEntity;->stop()V

    .line 60
    invoke-interface {v1}, Lorg/anddev/andengine/audio/IAudioEntity;->release()V

    .line 56
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method

.method public setMasterVolume(F)V
    .locals 4
    .parameter "pMasterVolume"

    .prologue
    .line 39
    .local p0, this:Lorg/anddev/andengine/audio/BaseAudioManager;,"Lorg/anddev/andengine/audio/BaseAudioManager<TT;>;"
    iput p1, p0, Lorg/anddev/andengine/audio/BaseAudioManager;->mMasterVolume:F

    .line 41
    iget-object v0, p0, Lorg/anddev/andengine/audio/BaseAudioManager;->mAudioEntities:Ljava/util/ArrayList;

    .line 42
    .local v0, audioEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<TT;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_0

    .line 47
    return-void

    .line 43
    :cond_0
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/audio/IAudioEntity;

    .line 45
    .local v1, audioEntity:Lorg/anddev/andengine/audio/IAudioEntity;,"TT;"
    invoke-interface {v1, p1}, Lorg/anddev/andengine/audio/IAudioEntity;->onMasterVolumeChanged(F)V

    .line 42
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method
