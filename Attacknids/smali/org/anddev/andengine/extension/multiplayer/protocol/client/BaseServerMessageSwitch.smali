.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerMessageSwitch;
.super Ljava/lang/Object;
.source "BaseServerMessageSwitch.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ServerMessageFlags;
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/client/IServerMessageSwitch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method


# virtual methods
.method public doSwitch(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V
    .locals 1
    .parameter "pServerConnector"
    .parameter "pServerMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    invoke-virtual {p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;->getFlag()S

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 86
    .end local p2
    :goto_0
    return-void

    .line 71
    .restart local p2
    :pswitch_0
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionAcceptedServerMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerMessageSwitch;->onHandleConnectionAcceptedServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionAcceptedServerMessage;)V

    goto :goto_0

    .line 74
    .restart local p2
    :pswitch_1
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionRefusedServerMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerMessageSwitch;->onHandleConnectionRefusedServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionRefusedServerMessage;)V

    goto :goto_0

    .line 77
    .restart local p2
    :pswitch_2
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionCloseServerMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerMessageSwitch;->onHandleConnectionCloseServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionCloseServerMessage;)V

    goto :goto_0

    .line 80
    .restart local p2
    :pswitch_3
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerMessageSwitch;->onHandleConnectionPingServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;)V

    goto :goto_0

    .line 83
    .restart local p2
    :pswitch_4
    check-cast p2, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPongServerMessage;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerMessageSwitch;->onHandleConnectionPongServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPongServerMessage;)V

    goto :goto_0

    .line 69
    :pswitch_data_0
    .packed-switch -0x8000
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected abstract onHandleConnectionAcceptedServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionAcceptedServerMessage;)V
.end method

.method protected onHandleConnectionCloseServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionCloseServerMessage;)V
    .locals 1
    .parameter "pServerConnector"
    .parameter "pServerMessage"

    .prologue
    .line 55
    invoke-virtual {p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->hasConnectionListener()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    invoke-virtual {p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->getConnectionListener()Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->onDisconnect(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V

    .line 58
    :cond_0
    return-void
.end method

.method protected onHandleConnectionPingServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;)V
    .locals 1
    .parameter "pServerConnector"
    .parameter "pServerMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;-><init>(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;)V

    invoke-virtual {p1, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;->sendClientMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;)V

    .line 48
    return-void
.end method

.method protected onHandleConnectionPongServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPongServerMessage;)V
    .locals 0
    .parameter "pServerConnector"
    .parameter "pServerMessage"

    .prologue
    .line 52
    return-void
.end method

.method protected abstract onHandleConnectionRefusedServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerConnector;Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionRefusedServerMessage;)V
.end method
