.class public Lorg/anddev/andengine/entity/scene/background/SpriteBackground;
.super Lorg/anddev/andengine/entity/scene/background/EntityBackground;
.source "SpriteBackground.java"


# direct methods
.method public constructor <init>(FFFLorg/anddev/andengine/entity/sprite/BaseSprite;)V
    .locals 0
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"
    .parameter "pBaseSprite"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/scene/background/EntityBackground;-><init>(FFFLorg/anddev/andengine/entity/IEntity;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/sprite/BaseSprite;)V
    .locals 0
    .parameter "pBaseSprite"

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/background/EntityBackground;-><init>(Lorg/anddev/andengine/entity/IEntity;)V

    .line 24
    return-void
.end method
