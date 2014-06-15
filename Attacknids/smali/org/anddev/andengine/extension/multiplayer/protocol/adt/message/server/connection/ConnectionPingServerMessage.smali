.class public Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;
.source "ConnectionPingServerMessage.java"


# instance fields
.field private final mTimestamp:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;-><init>(J)V

    .line 30
    return-void
.end method

.method public constructor <init>(J)V
    .locals 0
    .parameter "pTimestamp"

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;-><init>()V

    .line 33
    iput-wide p1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->mTimestamp:J

    .line 34
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
    .line 36
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;-><init>()V

    .line 37
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->mTimestamp:J

    .line 38
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 69
    if-ne p0, p1, :cond_1

    .line 82
    :cond_0
    :goto_0
    return v1

    .line 72
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 73
    goto :goto_0

    .line 75
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 76
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 79
    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;

    .line 81
    .local v0, other:Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->getFlag()S

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->getFlag()S

    move-result v4

    if-ne v3, v4, :cond_4

    .line 82
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->getTimestamp()J

    move-result-wide v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->getTimestamp()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_0

    :cond_4
    move v1, v2

    .line 81
    goto :goto_0
.end method

.method public getFlag()S
    .locals 1

    .prologue
    .line 54
    const/16 v0, -0x7ffc

    return v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->mTimestamp:J

    return-wide v0
.end method

.method protected onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V
    .locals 3
    .parameter "pStringBuilder"

    .prologue
    .line 64
    const-string v0, ", getTimestamp()="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->mTimestamp:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 65
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
    .line 59
    iget-wide v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionPingServerMessage;->mTimestamp:J

    invoke-virtual {p1, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 60
    return-void
.end method
