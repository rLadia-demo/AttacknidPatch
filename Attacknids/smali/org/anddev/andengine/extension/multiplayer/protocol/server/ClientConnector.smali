.class public Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;
.source "ClientConnector.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/net/Socket;Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientMessageExtractor;Lorg/anddev/andengine/extension/multiplayer/protocol/server/IClientMessageSwitch;)V
    .locals 0
    .parameter "pSocket"
    .parameter "pClientConnectionListener"
    .parameter "pClientMessageExtractor"
    .parameter "pClientMessageSwitch"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;-><init>(Ljava/net/Socket;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;)V

    .line 32
    return-void
.end method


# virtual methods
.method public getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/server/IClientMessageSwitch;
    .locals 1

    .prologue
    .line 40
    invoke-super {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/IClientMessageSwitch;

    return-object v0
.end method

.method public bridge synthetic getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/server/IClientMessageSwitch;

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
    check-cast p1, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->handleMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V

    return-void
.end method

.method protected handleMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V
    .locals 1
    .parameter "pMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/server/IClientMessageSwitch;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/IClientMessageSwitch;->doSwitch(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V

    .line 50
    return-void
.end method

.method protected onSendConnectionClose()V
    .locals 2

    .prologue
    .line 55
    :try_start_0
    new-instance v1, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionCloseServerMessage;

    invoke-direct {v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionCloseServerMessage;-><init>()V

    invoke-virtual {p0, v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->sendServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :goto_0
    return-void

    .line 56
    :catch_0
    move-exception v0

    .line 57
    .local v0, pThrowable:Ljava/lang/Throwable;
    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public sendServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V
    .locals 1
    .parameter "pServerMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->getDataOutputStream()Ljava/io/DataOutputStream;

    move-result-object v0

    .line 67
    .local v0, dataOutputStream:Ljava/io/DataOutputStream;
    invoke-virtual {p1, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;->transmit(Ljava/io/DataOutputStream;)V

    .line 68
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V

    .line 69
    return-void
.end method
