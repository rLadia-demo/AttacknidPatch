.class public interface abstract Lorg/anddev/andengine/audio/IAudioManager;
.super Ljava/lang/Object;
.source "IAudioManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/anddev/andengine/audio/IAudioEntity;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract add(Lorg/anddev/andengine/audio/IAudioEntity;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public abstract getMasterVolume()F
.end method

.method public abstract releaseAll()V
.end method

.method public abstract setMasterVolume(F)V
.end method
