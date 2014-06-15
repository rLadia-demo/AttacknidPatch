.class public Lorg/anddev/andengine/entity/particle/modifier/ColorInitializer;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;
.source "ColorInitializer.java"


# direct methods
.method public constructor <init>(FFF)V
    .locals 7
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 24
    move-object v0, p0

    move v1, p1

    move v2, p1

    move v3, p2

    move v4, p2

    move v5, p3

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;-><init>(FFFFFF)V

    .line 25
    return-void
.end method

.method public constructor <init>(FFFFFF)V
    .locals 0
    .parameter "pMinRed"
    .parameter "pMaxRed"
    .parameter "pMinGreen"
    .parameter "pMaxGreen"
    .parameter "pMinBlue"
    .parameter "pMaxBlue"

    .prologue
    .line 28
    invoke-direct/range {p0 .. p6}, Lorg/anddev/andengine/entity/particle/modifier/BaseTripleValueInitializer;-><init>(FFFFFF)V

    .line 29
    return-void
.end method


# virtual methods
.method protected onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;FFF)V
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
