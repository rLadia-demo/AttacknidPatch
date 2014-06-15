.class public interface abstract Lorg/anddev/andengine/util/modifier/IModifier;
.super Ljava/lang/Object;
.source "IModifier.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# virtual methods
.method public abstract clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<TT;>;"
        }
    .end annotation
.end method

.method public abstract getDuration()F
.end method

.method public abstract getModifierListener()Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;"
        }
    .end annotation
.end method

.method public abstract isFinished()Z
.end method

.method public abstract isRemoveWhenFinished()Z
.end method

.method public abstract onUpdate(FLjava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FTT;)V"
        }
    .end annotation
.end method

.method public abstract reset()V
.end method

.method public abstract setModifierListener(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;)V"
        }
    .end annotation
.end method

.method public abstract setRemoveWhenFinished(Z)V
.end method
