.class public Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;
.source "RotationAtModifier.java"


# instance fields
.field private final mRotationCenterX:F

.field private final mRotationCenterY:F


# direct methods
.method public constructor <init>(FFFFF)V
    .locals 1
    .parameter "pDuration"
    .parameter "pFromRotation"
    .parameter "pToRotation"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"

    .prologue
    .line 28
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 29
    iput p4, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterX:F

    .line 30
    iput p5, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterY:F

    .line 31
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromRotation"
    .parameter "pToRotation"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"
    .parameter "pShapeModifierListener"

    .prologue
    .line 40
    sget-object v5, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p6

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 41
    iput p4, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterX:F

    .line 42
    iput p5, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterY:F

    .line 43
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromRotation"
    .parameter "pToRotation"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 46
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p6

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;-><init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 47
    iput p4, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterX:F

    .line 48
    iput p5, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterY:F

    .line 49
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromRotation"
    .parameter "pToRotation"
    .parameter "pRotationCenterX"
    .parameter "pRotationCenterY"
    .parameter "pEaseFunction"

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3, p6}, Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 35
    iput p4, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterX:F

    .line 36
    iput p5, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterY:F

    .line 37
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;)V
    .locals 1
    .parameter "pRotationAtModifier"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;)V

    .line 53
    iget v0, p1, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterX:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterX:F

    .line 54
    iget v0, p1, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterY:F

    iput v0, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterY:F

    .line 55
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;
    .locals 1

    .prologue
    .line 59
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onManagedInitialize(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->onManagedInitialize(Lorg/anddev/andengine/entity/shape/IShape;)V

    return-void
.end method

.method protected onManagedInitialize(Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 2
    .parameter "pShape"

    .prologue
    .line 72
    invoke-super {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/RotationModifier;->onManagedInitialize(Ljava/lang/Object;)V

    .line 73
    iget v0, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterX:F

    iget v1, p0, Lorg/anddev/andengine/entity/shape/modifier/RotationAtModifier;->mRotationCenterY:F

    invoke-interface {p1, v0, v1}, Lorg/anddev/andengine/entity/shape/IShape;->setRotationCenter(FF)V

    .line 74
    return-void
.end method
