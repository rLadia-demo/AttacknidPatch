.class public abstract Lorg/anddev/andengine/entity/shape/modifier/TripleValueSpanShapeModifier;
.super Lorg/anddev/andengine/util/modifier/BaseTripleValueSpanModifier;
.source "TripleValueSpanShapeModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/BaseTripleValueSpanModifier",
        "<",
        "Lorg/anddev/andengine/entity/shape/IShape;",
        ">;",
        "Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;"
    }
.end annotation


# direct methods
.method public constructor <init>(FFFFFFFLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValueA"
    .parameter "pToValueA"
    .parameter "pFromValueB"
    .parameter "pToValueB"
    .parameter "pFromValueC"
    .parameter "pToValueC"
    .parameter "pShapeModifierListener"
    .parameter "pEaseFunction"

    .prologue
    .line 29
    invoke-direct/range {p0 .. p9}, Lorg/anddev/andengine/util/modifier/BaseTripleValueSpanModifier;-><init>(FFFFFFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 30
    return-void
.end method

.method public constructor <init>(FFFFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pFromValueA"
    .parameter "pToValueA"
    .parameter "pFromValueB"
    .parameter "pToValueB"
    .parameter "pFromValueC"
    .parameter "pToValueC"
    .parameter "pEaseFunction"

    .prologue
    .line 25
    invoke-direct/range {p0 .. p8}, Lorg/anddev/andengine/util/modifier/BaseTripleValueSpanModifier;-><init>(FFFFFFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 26
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/TripleValueSpanShapeModifier;)V
    .locals 0
    .parameter "pTripleValueSpanModifier"

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseTripleValueSpanModifier;-><init>(Lorg/anddev/andengine/util/modifier/BaseTripleValueSpanModifier;)V

    .line 34
    return-void
.end method
