.class public interface abstract Lorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;
.super Ljava/lang/Object;
.source "LoopModifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/util/modifier/LoopModifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ILoopModifierListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onLoopFinished(Lorg/anddev/andengine/util/modifier/LoopModifier;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/LoopModifier",
            "<TT;>;I)V"
        }
    .end annotation
.end method
