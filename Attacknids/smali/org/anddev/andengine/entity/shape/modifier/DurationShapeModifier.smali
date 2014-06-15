.class public abstract Lorg/anddev/andengine/entity/shape/modifier/DurationShapeModifier;
.super Lorg/anddev/andengine/util/modifier/BaseDurationModifier;
.source "DurationShapeModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/BaseDurationModifier",
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
    invoke-direct {p0}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>()V

    .line 25
    return-void
.end method

.method public constructor <init>(F)V
    .locals 0
    .parameter "pDuration"

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>(F)V

    .line 29
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pShapeModifierListener"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>(FLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 33
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/DurationShapeModifier;)V
    .locals 0
    .parameter "pDurationShapeModifier"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>(Lorg/anddev/andengine/util/modifier/BaseDurationModifier;)V

    .line 37
    return-void
.end method
