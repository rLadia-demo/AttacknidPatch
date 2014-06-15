.class public abstract Lorg/anddev/andengine/entity/shape/modifier/ShapeModifier;
.super Lorg/anddev/andengine/util/modifier/BaseModifier;
.source "ShapeModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/BaseModifier",
        "<",
        "Lorg/anddev/andengine/entity/shape/IShape;",
        ">;",
        "Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>()V

    .line 25
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 0
    .parameter "pShapeModifierListener"

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/ShapeModifier;)V
    .locals 0
    .parameter "pShapeModifier"

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseModifier;-><init>(Lorg/anddev/andengine/util/modifier/BaseModifier;)V

    .line 33
    return-void
.end method
