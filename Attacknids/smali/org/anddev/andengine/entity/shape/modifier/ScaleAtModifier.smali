.class public Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;
.source "ScaleAtModifier.java"


# instance fields
.field private final mScaleCenterX:F

.field private final mScaleCenterY:F


# direct methods
.method public constructor <init>(FFFFF)V
    .locals 7
    .parameter "pDuration"
    .parameter "pFromScale"
    .parameter "pToScale"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"

    .prologue
    .line 28
    sget-object v6, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;-><init>(FFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 29
    return-void
.end method

.method public constructor <init>(FFFFFFF)V
    .locals 9
    .parameter "pDuration"
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"

    .prologue
    .line 44
    sget-object v8, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v8}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;-><init>(FFFFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 45
    return-void
.end method

.method public constructor <init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 10
    .parameter "pDuration"
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"
    .parameter "pShapeModifierListener"

    .prologue
    .line 52
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

    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;-><init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 53
    return-void
.end method

.method public constructor <init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 56
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object/from16 v6, p8

    move-object/from16 v7, p9

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 57
    iput p6, p0, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->mScaleCenterX:F

    .line 58
    iput p7, p0, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->mScaleCenterY:F

    .line 59
    return-void
.end method

.method public constructor <init>(FFFFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 10
    .parameter "pDuration"
    .parameter "pFromScaleX"
    .parameter "pToScaleX"
    .parameter "pFromScaleY"
    .parameter "pToScaleY"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"
    .parameter "pEaseFunction"

    .prologue
    .line 48
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

    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;-><init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 49
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromScale"
    .parameter "pToScale"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"
    .parameter "pShapeModifierListener"

    .prologue
    .line 36
    sget-object v7, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 37
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 10
    .parameter "pDuration"
    .parameter "pFromScale"
    .parameter "pToScale"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 40
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;-><init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 41
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 8
    .parameter "pDuration"
    .parameter "pFromScale"
    .parameter "pToScale"
    .parameter "pScaleCenterX"
    .parameter "pScaleCenterY"
    .parameter "pEaseFunction"

    .prologue
    .line 32
    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;-><init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 33
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;)V
    .locals 1
    .parameter "pScaleAtModifier"

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;)V

    .line 63
    iget v0, p1, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->mScaleCenterX:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->mScaleCenterX:F

    .line 64
    iget v0, p1, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->mScaleCenterY:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->mScaleCenterY:F

    .line 65
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;
    .locals 1

    .prologue
    .line 69
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onManagedInitialize(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->onManagedInitialize(Lorg/anddev/andengine/entity/shape/IShape;)V

    return-void
.end method

.method protected onManagedInitialize(Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 2
    .parameter "pShape"

    .prologue
    .line 82
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/ScaleModifier;->onManagedInitialize(Ljava/lang/Object;)V

    .line 83
    iget v0, p0, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->mScaleCenterX:F

    iget v1, p0, Lorg/anddev/andengine/entity/shape/modifier/ScaleAtModifier;->mScaleCenterY:F

    invoke-interface {p1, v0, v1}, Lorg/anddev/andengine/entity/shape/IShape;->setScaleCenter(FF)V

    .line 84
    return-void
.end method
