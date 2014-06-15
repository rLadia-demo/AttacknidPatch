.class public Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientMessageExtractor;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;
.source "ClientMessageExtractor.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ClientMessageFlags;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;",
        ">;",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ClientMessageFlags;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
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
    invoke-virtual {p0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientMessageExtractor;->readMessage(SLjava/io/DataInputStream;)Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;

    move-result-object v0

    return-object v0
.end method

.method public readMessage(SLjava/io/DataInputStream;)Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;
    .locals 3
    .parameter "pFlag"
    .parameter "pDataInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    packed-switch p1, :pswitch_data_0

    .line 51
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

    .line 43
    :pswitch_0
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;-><init>(Ljava/io/DataInputStream;)V

    .line 49
    :goto_0
    return-object v0

    .line 45
    :pswitch_1
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionCloseClientMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionCloseClientMessage;-><init>(Ljava/io/DataInputStream;)V

    goto :goto_0

    .line 47
    :pswitch_2
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPingClientMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPingClientMessage;-><init>(Ljava/io/DataInputStream;)V

    goto :goto_0

    .line 49
    :pswitch_3
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;

    invoke-direct {v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;-><init>(Ljava/io/DataInputStream;)V

    goto :goto_0

    .line 41
    :pswitch_data_0
    .packed-switch -0x8000
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
