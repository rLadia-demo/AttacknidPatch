.class public Lorg/anddev/andengine/engine/handler/UpdateHandlerList;
.super Ljava/util/ArrayList;
.source "UpdateHandlerList.java"

# interfaces
.implements Lorg/anddev/andengine/engine/handler/IUpdateHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Lorg/anddev/andengine/engine/handler/IUpdateHandler;",
        ">;",
        "Lorg/anddev/andengine/engine/handler/IUpdateHandler;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x7ab717f11bdc2b5dL


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpdate(F)V
    .locals 3
    .parameter "pSecondsElapsed"

    .prologue
    .line 34
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->size()I

    move-result v0

    .line 35
    .local v0, handlerCount:I
    add-int/lit8 v1, v0, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 38
    return-void

    .line 36
    :cond_0
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/engine/handler/IUpdateHandler;

    invoke-interface {v2, p1}, Lorg/anddev/andengine/engine/handler/IUpdateHandler;->onUpdate(F)V

    .line 35
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 42
    invoke-virtual {p0}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->size()I

    move-result v0

    .line 43
    .local v0, handlerCount:I
    add-int/lit8 v1, v0, -0x1

    .local v1, i:I
    :goto_0
    if-gez v1, :cond_0

    .line 46
    return-void

    .line 44
    :cond_0
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/engine/handler/IUpdateHandler;

    invoke-interface {v2}, Lorg/anddev/andengine/engine/handler/IUpdateHandler;->reset()V

    .line 43
    add-int/lit8 v1, v1, -0x1

    goto :goto_0
.end method
