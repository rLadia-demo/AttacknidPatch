.class public Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;
.super Lorg/anddev/andengine/entity/shape/modifier/DurationShapeModifier;
.source "DelayModifier.java"


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .parameter "pDuration"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/DurationShapeModifier;-><init>(F)V

    .line 28
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V
    .locals 0
    .parameter "pDuration"
    .parameter "pShapeModifierListener"

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/modifier/DurationShapeModifier;-><init>(FLorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;)V

    .line 24
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;)V
    .locals 0
    .parameter "pDelayModifier"

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/DurationShapeModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/DurationShapeModifier;)V

    .line 32
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;
    .locals 1

    .prologue
    .line 36
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic onManagedInitialize(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;->onManagedInitialize(Lorg/anddev/andengine/entity/shape/IShape;)V

    return-void
.end method

.method protected onManagedInitialize(Lorg/anddev/andengine/entity/shape/IShape;)V
    .locals 0
    .parameter "pShape"

    .prologue
    .line 50
    return-void
.end method

.method protected bridge synthetic onManagedUpdate(FLjava/lang/Object;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p2, Lorg/anddev/andengine/entity/shape/IShape;

    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/entity/shape/modifier/DelayModifier;->onManagedUpdate(FLorg/anddev/andengine/entity/shape/IShape;)V

    return-void
.end method

.method protected onManagedUpdate(FLorg/anddev/andengine/entity/shape/IShape;)V
    .locals 0
    .parameter "pSecondsElapsed"
    .parameter "pShape"

    .prologue
    .line 55
    return-void
.end method
