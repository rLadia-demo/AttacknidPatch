.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;
.super Ljava/lang/Object;
.source "BaseConnectionListener.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M::",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;",
        "C:",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
        "<TM;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mDisconnectCalled:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener<TM;TC;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->mDisconnectCalled:Z

    .line 11
    return-void
.end method


# virtual methods
.method public onConnect(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener<TM;TC;>;"
    .local p1, pConnector:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"TC;"
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->onConnectInner(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V

    .line 44
    return-void
.end method

.method protected abstract onConnectInner(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation
.end method

.method public onDisconnect(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener<TM;TC;>;"
    .local p1, pConnector:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"TC;"
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->mDisconnectCalled:Z

    if-eqz v0, :cond_0

    .line 54
    :goto_0
    return-void

    .line 51
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->mDisconnectCalled:Z

    .line 53
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->onDisconnectInner(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V

    goto :goto_0
.end method

.method protected abstract onDisconnectInner(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation
.end method
