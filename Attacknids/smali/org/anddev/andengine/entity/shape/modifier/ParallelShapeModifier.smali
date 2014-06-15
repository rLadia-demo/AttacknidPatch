.class public Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;
.super Lorg/anddev/andengine/util/modifier/ParallelModifier;
.source "ParallelShapeModifier.java"

# interfaces
.implements Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/modifier/ParallelModifier",
        "<",
        "Lorg/anddev/andengine/entity/shape/IShape;",
        ">;",
        "Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;"
    }
.end annotation


# direct methods
.method public varargs constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier$IShapeModifierListener;[Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;)V
    .locals 0
    .parameter "pShapeModifierListener"
    .parameter "pShapeModifiers"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/util/modifier/ParallelModifier;-><init>(Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;[Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 29
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;)V
    .locals 0
    .parameter "pParallelShapeModifier"

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/ParallelModifier;-><init>(Lorg/anddev/andengine/util/modifier/ParallelModifier;)V

    .line 33
    return-void
.end method

.method public varargs constructor <init>([Lorg/anddev/andengine/entity/shape/modifier/IShapeModifier;)V
    .locals 0
    .parameter "pShapeModifiers"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/ParallelModifier;-><init>([Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 25
    return-void
.end method


# virtual methods
.method public clone()Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;
    .locals 1

    .prologue
    .line 37
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;-><init>(Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;)V

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/IModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/anddev/andengine/util/modifier/ParallelModifier;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;->clone()Lorg/anddev/andengine/entity/shape/modifier/ParallelShapeModifier;

    move-result-object v0

    return-object v0
.end method
