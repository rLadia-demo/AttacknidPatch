.class public Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;
.source "FadeInModifier.java"


# direct methods
.method public constructor <init>(F)V
    .locals 3
    .parameter "pDuration"

    .prologue
    .line 24
    const/4 v0, 0x0

    const/high16 v1, 0x3f80

    sget-object v2, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 25
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pShapeModifierListener"

    .prologue
    .line 32
    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    sget-object v5, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 33
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 36
    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    move-object v0, p0

    move v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 37
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 2
    .parameter "pDuration"
    .parameter "pEaseFunction"

    .prologue
    .line 28
    const/4 v0, 0x0

    const/high16 v1, 0x3f80

    invoke-direct {p0, p1, v0, v1, p2}, Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;)V
    .locals 0
    .parameter "pFadeInModifier"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;)V

    .line 41
    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/FadeInModifier;

    move-result-object v0

    return-object v0
.end method
