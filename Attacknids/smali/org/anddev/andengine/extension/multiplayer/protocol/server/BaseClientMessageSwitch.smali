.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientMessageSwitch;
.super Ljava/lang/Object;
.source "BaseClientMessageSwitch.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ClientMessageFlags;
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/server/IClientMessageSwitch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method


# virtual methods
.method public doSwitch(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V
    .locals 1
    .parameter "pClientConnector"
    .parameter "pClientMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;->getFlag()S

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 91
    .end local p2
    :goto_0
    return-void

    .line 79
    .restart local p2
    :pswitch_0
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientMessageSwitch;->onHandleConnectionEstablishClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;)V

    goto :goto_0

    .line 82
    .restart local p2
    :pswitch_1
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionCloseClientMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientMessageSwitch;->onHandleConnectionCloseClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionCloseClientMessage;)V

    goto :goto_0

    .line 85
    .restart local p2
    :pswitch_2
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPingClientMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientMessageSwitch;->onHandleConnectionPingClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPingClientMessage;)V

    goto :goto_0

    .line 88
    .restart local p2
    :pswitch_3
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientMessageSwitch;->onHandleConnectionPongClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;)V

    goto :goto_0

    .line 77
    :pswitch_data_0
    .packed-switch -0x8000
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected onHandleConnectionCloseClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionCloseClientMessage;)V
    .locals 1
    .parameter "pClientConnector"
    .parameter "pClientMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-virtual {p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->hasConnectionListener()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->getConnectionListener()Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->onDisconnect(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V

    .line 66
    :cond_0
    return-void
.end method

.method protected onHandleConnectionEstablishClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;)V
    .locals 2
    .parameter "pClientConnector"
    .parameter "pClientMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->getProtocolVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 48
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionAcceptedServerMessage;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionAcceptedServerMessage;-><init>()V

    invoke-virtual {p1, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->sendServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V

    .line 52
    :goto_0
    return-void

    .line 50
    :cond_0
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionRefusedServerMessage;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionRefusedServerMessage;-><init>()V

    invoke-virtual {p1, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->sendServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V

    goto :goto_0
.end method

.method protected onHandleConnectionPingClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPingClientMessage;)V
    .locals 1
    .parameter "pClientConnector"
    .parameter "pClientMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPongServerMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPongServerMessage;-><init>(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPingClientMessage;)V

    invoke-virtual {p1, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->sendServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V

    .line 56
    return-void
.end method

.method protected onHandleConnectionPongClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;)V
    .locals 0
    .parameter "pClientConnector"
    .parameter "pClientMessage"

    .prologue
    .line 60
    return-void
.end method
