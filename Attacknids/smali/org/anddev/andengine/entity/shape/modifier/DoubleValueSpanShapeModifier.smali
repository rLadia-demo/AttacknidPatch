.class public abstract Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;
.super Lorg/anddev/andengine/util/modifier/BaseDoubleValueSpanModifier;
.source "DoubleValueSpanShapeModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/BaseDoubleValueSpanModifier",
        "<",
        "Lorg/anddev/andengine/entity/shape/IShape;",
        ">;",
        "Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;"
    }
.end annotation


# direct methods
.method public constructor <init>(FFFFF)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValueA"
    .parameter "pToValueA"
    .parameter "pFromValueB"
    .parameter "pToValueB"

    .prologue
    .line 25
    invoke-direct/range {p0 .. p5}, Lorg/anddev/andengine/util/modifier/BaseDoubleValueSpanModifier;-><init>(FFFFF)V

    .line 26
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValueA"
    .parameter "pToValueA"
    .parameter "pFromValueB"
    .parameter "pToValueB"
    .parameter "pShapeModifierListener"

    .prologue
    .line 33
    invoke-direct/range {p0 .. p6}, Lorg/anddev/andengine/util/modifier/BaseDoubleValueSpanModifier;-><init>(FFFFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 34
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValueA"
    .parameter "pToValueA"
    .parameter "pFromValueB"
    .parameter "pToValueB"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 37
    invoke-direct/range {p0 .. p7}, Lorg/anddev/andengine/util/modifier/BaseDoubleValueSpanModifier;-><init>(FFFFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 38
    return-void
.end method

.method public constructor <init>(FFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValueA"
    .parameter "pToValueA"
    .parameter "pFromValueB"
    .parameter "pToValueB"
    .parameter "pEaseFunction"

    .prologue
    .line 29
    invoke-direct/range {p0 .. p6}, Lorg/anddev/andengine/util/modifier/BaseDoubleValueSpanModifier;-><init>(FFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 30
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/DoubleValueSpanShapeModifier;)V
    .locals 0
    .parameter "pDoubleValueSpanModifier"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseDoubleValueSpanModifier;-><init>(Lorg/anddev/andengine/util/modifier/BaseDoubleValueSpanModifier;)V

    .line 42
    return-void
.end method
