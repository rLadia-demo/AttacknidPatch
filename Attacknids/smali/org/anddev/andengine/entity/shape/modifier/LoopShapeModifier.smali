.class public Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;
.super Lorg/anddev/andengine/util/modifier/LoopModifier;
.source "LoopShapeModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier$ILoopShapeModifierListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/LoopModifier",
        "<",
        "Lorg/anddev/andengine/entity/shape/IShape;",
        ">;",
        "Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;"
    }
.end annotation


# direct methods
.method public constructor <init>(ILorg/anddev/andengine/entity/shape/modifier/IShapeModifier;)V
    .locals 0
    .parameter "pLoopCount"
    .parameter "pShapeModifier"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(ILorg/anddev/andengine/util/modifier/IModifier;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;ILorg/anddev/andengine/entity/shape/modifier/IShapeModifier;)V
    .locals 0
    .parameter "pShapeModifierListener"
    .parameter "pLoopCount"
    .parameter "pShapeModifier"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;ILorg/anddev/andengine/util/modifier/IModifier;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;ILorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier$ILoopShapeModifierListener;Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;)V
    .locals 0
    .parameter "pShapeModifierListener"
    .parameter "pLoopCount"
    .parameter "pLoopModifierListener"
    .parameter "pShapeModifier"

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;ILorg/anddev/andengine/util/modifier/LoopModifier$ILoopModifierListener;Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;)V
    .locals 0
    .parameter "pShapeModifier"

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 25
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;)V
    .locals 0
    .parameter "pLoopShapeModifier"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/LoopModifier;-><init>(Lorg/anddev/andengine/util/modifier/LoopModifier;)V

    .line 41
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/LoopModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/LoopShapeModifier;

    move-result-object v0

    return-object v0
.end method
