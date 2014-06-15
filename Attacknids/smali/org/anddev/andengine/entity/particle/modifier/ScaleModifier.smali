.class public Lorg/anddev/andengine/entity/particle/modifier/ScaleModifier;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;
.source "ScaleModifier.java"


# direct methods
.method public constructor <init>(FFFF)V
    .locals 7
    .parameter "pFromScale"
    .parameter "pToScale"
    .parameter "pFromTime"
    .parameter "pToTime"

    .prologue
    .line 23
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/entity/particle/modifier/ScaleModifier;-><init>(FFFFFF)V

    .line 24
    return-void
.end method

.method public constructor <init>(FFFFFF)V
    .locals 0
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"
    .parameter "pFromTime"
    .parameter "pToTime"

    .prologue
    .line 27
    invoke-direct/range {p0 .. p6}, Lorg/anddev/andengine/entity/particle/modifier/BaseDoubleValueSpanModifier;-><init>(FFFFFF)V

    .line 28
    return-void
.end method


# virtual methods
.method protected onSetInitialValues(Lorg/anddev/andengine/entity/particle/Particle;FF)V
    .locals 0
    .parameter "pParticle"
    .parameter "pScaleX"
    .parameter "pScaleY"

    .prologue
    .line 40
    invoke-virtual {p1, p2, p3}, Lorg/anddev/andengine/entity/particle/Particle;->setScale(FF)V

    .line 41
    return-void
.end method

.method protected onSetValues(Lorg/anddev/andengine/entity/particle/Particle;FF)V
    .locals 0
    .parameter "pParticle"
    .parameter "pScaleX"
    .parameter "pScaleY"

    .prologue
    .line 45
    invoke-virtual {p1, p2, p3}, Lorg/anddev/andengine/entity/particle/Particle;->setScale(FF)V

    .line 46
    return-void
.end method
