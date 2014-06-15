.class public Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;
.source "MoveModifier.java"


# direct methods
.method public constructor <init>(FFFFF)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromX"
    .parameter "pToX"
    .parameter "pFromY"
    .parameter "pToY"

    .prologue
    .line 24
    const/4 v6, 0x0

    sget-object v7, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 25
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromX"
    .parameter "pToX"
    .parameter "pFromY"
    .parameter "pToY"
    .parameter "pShapeModifierListener"

    .prologue
    .line 32
    sget-object v7, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 33
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromX"
    .parameter "pToX"
    .parameter "pFromY"
    .parameter "pToY"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 36
    invoke-direct/range {p0 .. p7}, Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 37
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromX"
    .parameter "pToX"
    .parameter "pFromY"
    .parameter "pToY"
    .parameter "pEaseFunction"

    .prologue
    .line 28
    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;)V
    .locals 0
    .parameter "pMoveModifier"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;)V

    .line 41
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onSetInitialValues(Ljava/lang/Object;FF)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;->onSetInitialValues(Lorg/anddev/andengine/entity/shape/IShape;FF)V

    return-void
.end method

.method protected onSetInitialValues(Lorg/anddev/andengine/entity/shape/IShape;FF)V
    .locals 0
    .parameter "pShape"
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 58
    invoke-interface {p1, p2, p3}, Lorg/anddev/andengine/entity/shape/IShape;->setPosition(FF)V

    .line 59
    return-void
.end method

.method protected bridge synthetic onSetValues(Ljava/lang/Object;FFF)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/shape/modifier/MoveModifier;->onSetValues(Lorg/anddev/andengine/entity/shape/IShape;FFF)V

    return-void
.end method

.method protected onSetValues(Lorg/anddev/andengine/entity/shape/IShape;FFF)V
    .locals 0
    .parameter "pShape"
    .parameter "pPercentageDone"
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 63
    invoke-interface {p1, p3, p4}, Lorg/anddev/andengine/entity/shape/IShape;->setPosition(FF)V

    .line 64
    return-void
.end method
