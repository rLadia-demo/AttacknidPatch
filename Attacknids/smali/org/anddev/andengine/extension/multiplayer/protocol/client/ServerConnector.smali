.class public Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;
.source "ServerConnector.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/net/Socket;Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerMessageExtractor;Lorg/anddev/andengine/extension/multiplayer/protocol/client/IServerMessageSwitch;)V
    .locals 1
    .parameter "pSocket"
    .parameter "pServerConnectionListener"
    .parameter "pServerMessageExtractor"
    .parameter "pServerMessageSwitch"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;-><init>(Ljava/net/Socket;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;)V

    .line 37
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;-><init>()V

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->sendClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/client/IServerMessageSwitch;
    .locals 1

    .prologue
    .line 46
    invoke-super {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/client/IServerMessageSwitch;

    return-object v0
.end method

.method public bridge synthetic getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/client/IServerMessageSwitch;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic handleMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    check-cast p1, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->handleMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V

    return-void
.end method

.method protected handleMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V
    .locals 1
    .parameter "pMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/client/IServerMessageSwitch;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/IServerMessageSwitch;->doSwitch(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V

    .line 56
    return-void
.end method

.method protected onSendConnectionClose()V
    .locals 2

    .prologue
    .line 61
    :try_start_0
    new-instance v1, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionCloseClientMessage;

    invoke-direct {v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionCloseClientMessage;-><init>()V

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->sendClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :goto_0
    return-void

    .line 62
    :catch_0
    move-exception v0

    .line 63
    .local v0, pThrowable:Ljava/lang/Throwable;
    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public sendClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V
    .locals 1
    .parameter "pClientMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->getDataOutputStream()Ljava/io/DataOutputStream;

    move-result-object v0

    .line 73
    .local v0, dataOutputStream:Ljava/io/DataOutputStream;
    invoke-virtual {p1, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;->transmit(Ljava/io/DataOutputStream;)V

    .line 74
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V

    .line 75
    return-void
.end method
