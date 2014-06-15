.class public Lorg/anddev/andengine/entity/particle/modifier/AlphaInitializer;
.super Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;
.source "AlphaInitializer.java"


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .parameter "pAlpha"

    .prologue
    .line 24
    invoke-direct {p0, p1, p1}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;-><init>(FF)V

    .line 25
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0
    .parameter "pMinAlpha"
    .parameter "pMaxAlpha"

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/particle/modifier/BaseSingleValueInitializer;-><init>(FF)V

    .line 29
    return-void
.end method


# virtual methods
.method protected onInitializeParticle(Lorg/anddev/andengine/entity/particle/Particle;F)V
    .locals 0
    .parameter "pParticle"
    .parameter "pAlpha"

    .prologue
    .line 41
    invoke-virtual {p1, p2}, Lorg/anddev/andengine/entity/particle/Particle;->setAlpha(F)V

    .line 42
    return-void
.end method
