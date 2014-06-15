.class public Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;
.source "ConnectionEstablishClientMessage.java"


# instance fields
.field private final mProtocolVersion:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;-><init>(I)V

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "pProtocolVersion"

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 34
    iput p1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->mProtocolVersion:I

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;)V
    .locals 1
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
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->mProtocolVersion:I

    .line 39
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
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
    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;

    .line 82
    .local v0, other:Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->getFlag()S

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->getFlag()S

    move-result v4

    if-ne v3, v4, :cond_4

    .line 83
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->getProtocolVersion()I

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->getProtocolVersion()I

    move-result v4

    if-eq v3, v4, :cond_0

    :cond_4
    move v1, v2

    .line 82
    goto :goto_0
.end method

.method public getFlag()S
    .locals 1

    .prologue
    .line 55
    const/16 v0, -0x8000

    return v0
.end method

.method public getProtocolVersion()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->mProtocolVersion:I

    return v0
.end method

.method protected onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V
    .locals 2
    .parameter "pStringBuilder"

    .prologue
    .line 65
    const-string v0, ", getProtocolVersion()="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->mProtocolVersion:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    return-void
.end method

.method public onWriteTransmissionData(Ljava/io/DataOutputStream;)V
    .locals 1
    .parameter "pDataOutputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionEstablishClientMessage;->mProtocolVersion:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 61
    return-void
.end method
