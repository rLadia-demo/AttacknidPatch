.class public Lorg/anddev/andengine/entity/particle/modifier/ColorModifier;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;
.source "ColorModifier.java"


# direct methods
.method public constructor <init>(FFFFFFFF)V
    .locals 0
    .parameter "pFromRed"
    .parameter "pToRed"
    .parameter "pFromGreen"
    .parameter "pToGreen"
    .parameter "pFromBlue"
    .parameter "pToBlue"
    .parameter "pFromTime"
    .parameter "pToTime"

    .prologue
    .line 23
    invoke-direct/range {p0 .. p8}, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueSpanModifier;-><init>(FFFFFFFF)V

    .line 24
    return-void
.end method


# virtual methods
.method protected onSetInitialValues(Lorg/anddev/andengine/entity/particle/Particle;FFF)V
    .locals 0
    .parameter "pParticle"
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 36
    invoke-virtual {p1, p2, p3, p4}, Lorg/anddev/andengine/entity/particle/Particle;->setColor(FFF)V

    .line 37
    return-void
.end method

.method protected onSetValues(Lorg/anddev/andengine/entity/particle/Particle;FFF)V
    .locals 0
    .parameter "pParticle"
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 41
    invoke-virtual {p1, p2, p3, p4}, Lorg/anddev/andengine/entity/particle/Particle;->setColor(FFF)V

    .line 42
    return-void
.end method
