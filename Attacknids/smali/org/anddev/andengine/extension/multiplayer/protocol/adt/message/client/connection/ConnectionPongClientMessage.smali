.class public Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;
.source "ConnectionPongClientMessage.java"


# instance fields
.field private final mOriginalPingTimestamp:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .parameter "pTimestamp"

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 34
    iput-wide p1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->mOriginalPingTimestamp:J

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;)V
    .locals 2
    .parameter "pInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 38
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->mOriginalPingTimestamp:J

    .line 39
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;)V
    .locals 2
    .parameter "pServerMessage"

    .prologue
    .line 30
    invoke-virtual {p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->getTimestamp()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;-><init>(J)V

    .line 31
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 70
    if-ne p0, p1, :cond_1

    .line 83
    :cond_0
    :goto_0
    return v1

    .line 73
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 74
    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 77
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 80
    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;

    .line 82
    .local v0, other:Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->getFlag()S

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->getFlag()S

    move-result v4

    if-ne v3, v4, :cond_4

    .line 83
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->getOriginalPingTimestamp()J

    move-result-wide v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->getOriginalPingTimestamp()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_0

    :cond_4
    move v1, v2

    .line 82
    goto :goto_0
.end method

.method public getFlag()S
    .locals 1

    .prologue
    .line 55
    const/16 v0, -0x7ffd

    return v0
.end method

.method public getOriginalPingTimestamp()J
    .locals 2

    .prologue
    .line 46
    iget-wide v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->mOriginalPingTimestamp:J

    return-wide v0
.end method

.method protected onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V
    .locals 3
    .parameter "pStringBuilder"

    .prologue
    .line 65
    const-string v0, ", getOriginalPingTimestamp()="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->mOriginalPingTimestamp:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 66
    return-void
.end method

.method public onWriteTransmissionData(Ljava/io/DataOutputStream;)V
    .locals 2
    .parameter "pDataOutputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-wide v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionPongClientMessage;->mOriginalPingTimestamp:J

    invoke-virtual {p1, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 61
    return-void
.end method
