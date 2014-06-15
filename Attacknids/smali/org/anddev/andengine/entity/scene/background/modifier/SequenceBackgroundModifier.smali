.class public Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;
.super Lorg/anddev/andengine/util/modifier/SequenceModifier;
.source "SequenceBackgroundModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/scene/background/modifier/IBackgroundModifier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier$ISubSequenceBackgroundModifierListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/SequenceModifier",
        "<",
        "Lorg/anddev/andengine/entity/scene/background/IBackground;",
        ">;",
        "Lorg/anddev/andengine/entity/scene/background/modifier/IBackgroundModifier;"
    }
.end annotation


# direct methods
.method public varargs constructor <init>(Lorg/anddev/andengine/entity/scene/background/modifier/IBackgroundModifier$IBackgroundModifierListener;Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier$ISubSequenceBackgroundModifierListener;[Lorg/anddev/andengine/entity/scene/background/modifier/IBackgroundModifier;)V
    .locals 0
    .parameter "pBackgroundModifierListener"
    .parameter "pSubSequenceBackgroundModifierListener"
    .parameter "pBackgroundModifiers"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/util/modifier/SequenceModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/SequenceModifier$ISubSequenceModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 33
    return-void
.end method

.method public varargs constructor <init>(Lorg/anddev/andengine/entity/scene/background/modifier/IBackgroundModifier$IBackgroundModifierListener;[Lorg/anddev/andengine/entity/scene/background/modifier/IBackgroundModifier;)V
    .locals 0
    .parameter "pBackgroundModifierListener"
    .parameter "pBackgroundModifiers"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/util/modifier/SequenceModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;)V
    .locals 0
    .parameter "pSequenceBackgroundModifier"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/SequenceModifier;-><init>(Lorg/anddev/andengine/util/modifier/SequenceModifier;)V

    .line 37
    return-void
.end method

.method public varargs constructor <init>([Lorg/anddev/andengine/entity/scene/background/modifier/IBackgroundModifier;)V
    .locals 0
    .parameter "pBackgroundModifiers"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/SequenceModifier;-><init>([Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 25
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;-><init>(Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;->clone()Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/SequenceModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;->clone()Lorg/anddev/andengine/entity/scene/background/modifier/SequenceBackgroundModifier;

    move-result-object v0

    return-object v0
.end method
