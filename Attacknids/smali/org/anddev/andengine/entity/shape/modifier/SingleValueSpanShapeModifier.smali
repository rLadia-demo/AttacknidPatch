.class public abstract Lorg/anddev/andengine/entity/shape/modifier/SingleValueSpanShapeModifier;
.super Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;
.source "SingleValueSpanShapeModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier",
        "<",
        "Lorg/anddev/andengine/entity/shape/IShape;",
        ">;",
        "Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;"
    }
.end annotation


# direct methods
.method public constructor <init>(FFF)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValue"
    .parameter "pToValue"

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;-><init>(FFF)V

    .line 26
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValue"
    .parameter "pToValue"
    .parameter "pShapeModifierListener"

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 34
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValue"
    .parameter "pToValue"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 37
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 38
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValue"
    .parameter "pToValue"
    .parameter "pEaseFunction"

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 30
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/SingleValueSpanShapeModifier;)V
    .locals 0
    .parameter "pSingleValueSpanShapeModifier"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;-><init>(Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;)V

    .line 42
    return-void
.end method
