.class public Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerMessageExtractor;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;
.source "ServerMessageExtractor.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ServerMessageFlags;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;",
        ">;",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ServerMessageFlags;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic readMessage(SLjava/io/DataInputStream;)Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/ServerMessageExtractor;->readMessage(SLjava/io/DataInputStream;)Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;

    move-result-object v0

    return-object v0
.end method

.method public readMessage(SLjava/io/DataInputStream;)Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;
    .locals 3
    .parameter "pFlag"
    .parameter "pDataInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    packed-switch p1, :pswitch_data_0

    .line 54
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown flag: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :pswitch_0
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionAcceptedServerMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionAcceptedServerMessage;-><init>(Ljava/io/DataInputStream;)V

    .line 52
    :goto_0
    return-object v0

    .line 46
    :pswitch_1
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionRefusedServerMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionRefusedServerMessage;-><init>(Ljava/io/DataInputStream;)V

    goto :goto_0

    .line 48
    :pswitch_2
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionCloseServerMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionCloseServerMessage;-><init>(Ljava/io/DataInputStream;)V

    goto :goto_0

    .line 50
    :pswitch_3
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;-><init>(Ljava/io/DataInputStream;)V

    goto :goto_0

    .line 52
    :pswitch_4
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPongServerMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPongServerMessage;-><init>(Ljava/io/DataInputStream;)V

    goto :goto_0

    .line 42
    :pswitch_data_0
    .packed-switch -0x8000
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
