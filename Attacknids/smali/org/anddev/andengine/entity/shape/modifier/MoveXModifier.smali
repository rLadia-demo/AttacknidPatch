.class public Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/SingleValueSpanShapeModifier;
.source "MoveXModifier.java"


# direct methods
.method public constructor <init>(FFF)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromX"
    .parameter "pToX"

    .prologue
    .line 24
    const/4 v4, 0x0

    sget-object v5, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 25
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromX"
    .parameter "pToX"
    .parameter "pShapeModifierListener"

    .prologue
    .line 32
    sget-object v5, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/SingleValueSpanShapeModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 33
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromX"
    .parameter "pToX"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 36
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/entity/shape/modifier/SingleValueSpanShapeModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 37
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromX"
    .parameter "pToX"
    .parameter "pEaseFunction"

    .prologue
    .line 28
    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;)V
    .locals 0
    .parameter "pMoveXModifier"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/SingleValueSpanShapeModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/SingleValueSpanShapeModifier;)V

    .line 41
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onSetInitialValue(Ljava/lang/Object;F)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;->onSetInitialValue(Lorg/anddev/andengine/entity/shape/IShape;F)V

    return-void
.end method

.method protected onSetInitialValue(Lorg/anddev/andengine/entity/shape/IShape;F)V
    .locals 1
    .parameter "pShape"
    .parameter "pX"

    .prologue
    .line 58
    invoke-interface {p1}, Lorg/anddev/andengine/entity/shape/IShape;->getY()F

    move-result v0

    invoke-interface {p1, p2, v0}, Lorg/anddev/andengine/entity/shape/IShape;->setPosition(FF)V

    .line 59
    return-void
.end method

.method protected bridge synthetic onSetValue(Ljava/lang/Object;FF)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/shape/modifier/MoveXModifier;->onSetValue(Lorg/anddev/andengine/entity/shape/IShape;FF)V

    return-void
.end method

.method protected onSetValue(Lorg/anddev/andengine/entity/shape/IShape;FF)V
    .locals 1
    .parameter "pShape"
    .parameter "pPercentageDone"
    .parameter "pX"

    .prologue
    .line 63
    invoke-interface {p1}, Lorg/anddev/andengine/entity/shape/IShape;->getY()F

    move-result v0

    invoke-interface {p1, p3, v0}, Lorg/anddev/andengine/entity/shape/IShape;->setPosition(FF)V

    .line 64
    return-void
.end method
