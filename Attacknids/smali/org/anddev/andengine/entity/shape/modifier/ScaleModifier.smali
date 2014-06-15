.class public Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;
.source "ScaleModifier.java"


# direct methods
.method public constructor <init>(FFF)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromScale"
    .parameter "pToScale"

    .prologue
    .line 24
    const/4 v4, 0x0

    sget-object v5, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 25
    return-void
.end method

.method public constructor <init>(FFFFF)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"

    .prologue
    .line 40
    const/4 v6, 0x0

    sget-object v7, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 41
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"
    .parameter "pShapeModifierListener"

    .prologue
    .line 48
    sget-object v7, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 49
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 52
    invoke-direct/range {p0 .. p7}, Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 53
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"
    .parameter "pEaseFunction"

    .prologue
    .line 44
    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 45
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromScale"
    .parameter "pToScale"
    .parameter "pShapeModifierListener"

    .prologue
    .line 32
    sget-object v7, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 33
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromScale"
    .parameter "pToScale"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 36
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p2

    move v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 37
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromScale"
    .parameter "pToScale"
    .parameter "pEaseFunction"

    .prologue
    .line 28
    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;)V
    .locals 0
    .parameter "pScaleModifier"

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;)V

    .line 57
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;

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

    invoke-virtual {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;->onSetInitialValues(Lorg/anddev/andengine/entity/shape/IShape;FF)V

    return-void
.end method

.method protected onSetInitialValues(Lorg/anddev/andengine/entity/shape/IShape;FF)V
    .locals 0
    .parameter "pShape"
    .parameter "pScaleA"
    .parameter "pScaleB"

    .prologue
    .line 74
    invoke-interface {p1, p2, p3}, Lorg/anddev/andengine/entity/shape/IShape;->setScale(FF)V

    .line 75
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

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;->onSetValues(Lorg/anddev/andengine/entity/shape/IShape;FFF)V

    return-void
.end method

.method protected onSetValues(Lorg/anddev/andengine/entity/shape/IShape;FFF)V
    .locals 0
    .parameter "pShape"
    .parameter "pPercentageDone"
    .parameter "pScaleA"
    .parameter "pScaleB"

    .prologue
    .line 79
    invoke-interface {p1, p3, p4}, Lorg/anddev/andengine/entity/shape/IShape;->setScale(FF)V

    .line 80
    return-void
.end method
