.class public interface abstract Lorg/anddev/andengine/extension/multiplayer/protocol/server/IClientMessageSwitch;
.super Ljava/lang/Object;
.source "IClientMessageSwitch.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract doSwitch(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
