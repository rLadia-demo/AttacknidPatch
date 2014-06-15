.class public Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/TripleValueSpanShapeModifier;
.source "ColorModifier.java"


# direct methods
.method public constructor <init>(FFFFFFF)V
    .locals 10
    .parameter "pDuration"
    .parameter "pFromRed"
    .parameter "pToRed"
    .parameter "pFromGreen"
    .parameter "pToGreen"
    .parameter "pFromBlue"
    .parameter "pToBlue"

    .prologue
    .line 24
    const/4 v8, 0x0

    sget-object v9, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;-><init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 25
    return-void
.end method

.method public constructor <init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 10
    .parameter "pDuration"
    .parameter "pFromRed"
    .parameter "pToRed"
    .parameter "pFromGreen"
    .parameter "pToGreen"
    .parameter "pFromBlue"
    .parameter "pToBlue"
    .parameter "pShapeModifierListener"

    .prologue
    .line 32
    sget-object v9, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/entity/shape/modifier/TripleValueSpanShapeModifier;-><init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 33
    return-void
.end method

.method public constructor <init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromRed"
    .parameter "pToRed"
    .parameter "pFromGreen"
    .parameter "pToGreen"
    .parameter "pFromBlue"
    .parameter "pToBlue"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 36
    invoke-direct/range {p0 .. p9}, Lorg/anddev/andengine/entity/shape/modifier/TripleValueSpanShapeModifier;-><init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 37
    return-void
.end method

.method public constructor <init>(FFFFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 10
    .parameter "pDuration"
    .parameter "pFromRed"
    .parameter "pToRed"
    .parameter "pFromGreen"
    .parameter "pToGreen"
    .parameter "pFromBlue"
    .parameter "pToBlue"
    .parameter "pEaseFunction"

    .prologue
    .line 28
    const/4 v8, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v9, p8

    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;-><init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;)V
    .locals 0
    .parameter "pColorModifier"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/TripleValueSpanShapeModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/TripleValueSpanShapeModifier;)V

    .line 41
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onSetInitialValues(Ljava/lang/Object;FFF)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;->onSetInitialValues(Lorg/anddev/andengine/entity/shape/IShape;FFF)V

    return-void
.end method

.method protected onSetInitialValues(Lorg/anddev/andengine/entity/shape/IShape;FFF)V
    .locals 0
    .parameter "pShape"
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 58
    invoke-interface {p1, p2, p3, p4}, Lorg/anddev/andengine/entity/shape/IShape;->setColor(FFF)V

    .line 59
    return-void
.end method

.method protected bridge synthetic onSetValues(Ljava/lang/Object;FFFF)V
    .locals 6
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    move-object v1, p1

    check-cast v1, Lorg/anddev/andengine/entity/shape/IShape;

    move-object v0, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/ColorModifier;->onSetValues(Lorg/anddev/andengine/entity/shape/IShape;FFFF)V

    return-void
.end method

.method protected onSetValues(Lorg/anddev/andengine/entity/shape/IShape;FFFF)V
    .locals 0
    .parameter "pShape"
    .parameter "pPerctentageDone"
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 63
    invoke-interface {p1, p3, p4, p5}, Lorg/anddev/andengine/entity/shape/IShape;->setColor(FFF)V

    .line 64
    return-void
.end method
