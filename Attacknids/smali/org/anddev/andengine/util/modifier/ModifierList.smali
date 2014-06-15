.class public Lorg/anddev/andengine/util/modifier/ModifierList;
.super Ljava/util/ArrayList;
.source "ModifierList.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/ArrayList",
        "<",
        "Lorg/anddev/andengine/util/modifier/IModifier",
        "<TT;>;>;",
        "Lorg/anddev/andengine/engine/handler/IUpdateHandler;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x165918c8d0a83583L


# instance fields
.field private final mTarget:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, this:Lorg/anddev/andengine/util/modifier/ModifierList;,"Lorg/anddev/andengine/util/modifier/ModifierList<TT;>;"
    .local p1, pTarget:Ljava/lang/Object;,"TT;"
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/anddev/andengine/util/modifier/ModifierList;->mTarget:Ljava/lang/Object;

    .line 30
    return-void
.end method


# virtual methods
.method public getTarget()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, this:Lorg/anddev/andengine/util/modifier/ModifierList;,"Lorg/anddev/andengine/util/modifier/ModifierList<TT;>;"
    iget-object v0, p0, Lorg/anddev/andengine/util/modifier/ModifierList;->mTarget:Ljava/lang/Object;

    return-object v0
.end method

.method public onUpdate(F)V
    .locals 5
    .parameter "pSecondsElapsed"

    .prologue
    .line 46
    .local p0, this:Lorg/anddev/andengine/util/modifier/ModifierList;,"Lorg/anddev/andengine/util/modifier/ModifierList<TT;>;"
    move-object v3, p0

    .line 47
    .local v3, modifiers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/util/modifier/IModifier<TT;>;>;"
    invoke-virtual {p0}, Lorg/anddev/andengine/util/modifier/ModifierList;->size()I

    move-result v2

    .line 48
    .local v2, modifierCount:I
    if-lez v2, :cond_0

    .line 49
    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_1

    .line 57
    .end local v0           #i:I
    :cond_0
    return-void

    .line 50
    .restart local v0       #i:I
    :cond_1
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/util/modifier/IModifier;

    .line 51
    .local v1, modifier:Lorg/anddev/andengine/util/modifier/IModifier;,"Lorg/anddev/andengine/util/modifier/IModifier<TT;>;"
    iget-object v4, p0, Lorg/anddev/andengine/util/modifier/ModifierList;->mTarget:Ljava/lang/Object;

    invoke-interface {v1, p1, v4}, Lorg/anddev/andengine/util/modifier/IModifier;->onUpdate(FLjava/lang/Object;)V

    .line 52
    invoke-interface {v1}, Lorg/anddev/andengine/util/modifier/IModifier;->isFinished()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Lorg/anddev/andengine/util/modifier/IModifier;->isRemoveWhenFinished()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 53
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 49
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 61
    .local p0, this:Lorg/anddev/andengine/util/modifier/ModifierList;,"Lorg/anddev/andengine/util/modifier/ModifierList<TT;>;"
    move-object v1, p0

    .line 62
    .local v1, modifiers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/util/modifier/IModifier<TT;>;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 65
    return-void

    .line 63
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/util/modifier/IModifier;

    invoke-interface {v2}, Lorg/anddev/andengine/util/modifier/IModifier;->reset()V

    .line 62
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
