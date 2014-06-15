.class public interface abstract Lorg/anddev/andengine/extension/multiplayer/protocol/client/IServerMessageSwitch;
.super Ljava/lang/Object;
.source "IServerMessageSwitch.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;",
        ">;"
    }
.end annotation


# virtual methods
.method public abstract doSwitch(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
