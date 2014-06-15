.class public Lorg/anddev/andengine/entity/particle/modifier/AlphaModifier;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;
.source "AlphaModifier.java"


# direct methods
.method public constructor <init>(FFFF)V
    .locals 0
    .parameter "pFromAlpha"
    .parameter "pToAlpha"
    .parameter "pFromTime"
    .parameter "pToTime"

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueSpanModifier;-><init>(FFFF)V

    .line 24
    return-void
.end method


# virtual methods
.method protected onSetInitialValue(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 0
    .parameter "pParticle"
    .parameter "pAlpha"

    .prologue
    .line 36
    invoke-virtual {p1, p2}, Lorg/anddev/andengine/entity/particle/Particle;->setAlpha(F)V

    .line 37
    return-void
.end method

.method protected onSetValue(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 0
    .parameter "pParticle"
    .parameter "pAlpha"

    .prologue
    .line 41
    invoke-virtual {p1, p2}, Lorg/anddev/andengine/entity/particle/Particle;->setAlpha(F)V

    .line 42
    return-void
.end method
