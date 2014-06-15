.class public abstract Lorg/anddev/andengine/entity/shape/modifier/SingleValueChangeShapeModifier;
.super Lorg/anddev/andengine/util/modifier/BaseSingleValueChangeModifier;
.source "SingleValueChangeShapeModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/BaseSingleValueChangeModifier",
        "<",
        "Lorg/anddev/andengine/entity/shape/IShape;",
        ">;",
        "Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;"
    }
.end annotation


# direct methods
.method public constructor <init>(FF)V
    .locals 0
    .parameter "pDuration"
    .parameter "pValueChange"

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/util/modifier/BaseSingleValueChangeModifier;-><init>(FF)V

    .line 25
    return-void
.end method

.method public constructor <init>(FFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pValueChange"
    .parameter "pShapeModifierListener"

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/util/modifier/BaseSingleValueChangeModifier;-><init>(FFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/SingleValueChangeShapeModifier;)V
    .locals 0
    .parameter "pSingleValueChangeShapeModifier"

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseSingleValueChangeModifier;-><init>(Lorg/anddev/andengine/util/modifier/BaseSingleValueChangeModifier;)V

    .line 33
    return-void
.end method
