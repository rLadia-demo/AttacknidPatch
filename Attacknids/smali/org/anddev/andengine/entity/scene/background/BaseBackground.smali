.class public abstract Lorg/anddev/andengine/entity/scene/background/BaseBackground;
.super Ljava/lang/Object;
.source "BaseBackground.java"

# interfaces
.implements Lorg/anddev/andengine/entity/scene/background/IBackground;


# instance fields
.field private final mBackgroundModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/util/modifier/ModifierList",
            "<",
            "Lorg/anddev/andengine/entity/scene/background/IBackground;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-direct {v0, p0}, Lorg/anddev/andengine/util/modifier/ModifierList;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/background/BaseBackground;->mBackgroundModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    .line 12
    return-void
.end method


# virtual methods
.method public addBackgroundModifier(Lorg/anddev/andengine/util/modifier/IModifier;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/scene/background/IBackground;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p1, pBackgroundModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<Lorg/anddev/andengine/entity/scene/background/IBackground;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/BaseBackground;->mBackgroundModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/util/modifier/ModifierList;->add(Ljava/lang/Object;)Z

    .line 38
    return-void
.end method

.method public clearBackgroundModifiers()V
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/BaseBackground;->mBackgroundModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/modifier/ModifierList;->clear()V

    .line 48
    return-void
.end method

.method public onUpdate(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 52
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/BaseBackground;->mBackgroundModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/util/modifier/ModifierList;->onUpdate(F)V

    .line 53
    return-void
.end method

.method public removeBackgroundModifier(Lorg/anddev/andengine/util/modifier/IModifier;)Z
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/IModifier",
            "<",
            "Lorg/anddev/andengine/entity/scene/background/IBackground;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, pBackgroundModifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<Lorg/anddev/andengine/entity/scene/background/IBackground;>;"
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/BaseBackground;->mBackgroundModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/util/modifier/ModifierList;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/BaseBackground;->mBackgroundModifiers:Lorg/anddev/andengine/util/modifier/ModifierList;

    invoke-virtual {v0}, Lorg/anddev/andengine/util/modifier/ModifierList;->reset()V

    .line 58
    return-void
.end method
