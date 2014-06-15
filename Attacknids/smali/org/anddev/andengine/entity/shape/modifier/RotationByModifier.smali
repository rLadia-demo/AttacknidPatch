.class public Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/SingleValueChangeShapeModifier;
.source "RotationByModifier.java"


# direct methods
.method public constructor <init>(FF)V
    .locals 0
    .parameter "pDuration"
    .parameter "pRotation"

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/modifier/SingleValueChangeShapeModifier;-><init>(FF)V

    .line 24
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;)V
    .locals 0
    .parameter "pRotationByModifier"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/SingleValueChangeShapeModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/SingleValueChangeShapeModifier;)V

    .line 28
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;
    .locals 1

    .prologue
    .line 32
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onChangeValue(Ljava/lang/Object;F)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/modifier/RotationByModifier;->onChangeValue(Lorg/anddev/andengine/entity/shape/IShape;F)V

    return-void
.end method

.method protected onChangeValue(Lorg/anddev/andengine/entity/shape/IShape;F)V
    .locals 1
    .parameter "pShape"
    .parameter "pValue"

    .prologue
    .line 45
    invoke-interface {p1}, Lorg/anddev/andengine/entity/shape/IShape;->getRotation()F

    move-result v0

    add-float/2addr v0, p2

    invoke-interface {p1, v0}, Lorg/anddev/andengine/entity/shape/IShape;->setRotation(F)V

    .line 46
    return-void
.end method
