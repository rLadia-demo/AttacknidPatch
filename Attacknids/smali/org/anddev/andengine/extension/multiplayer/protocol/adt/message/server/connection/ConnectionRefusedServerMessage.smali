.class public Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/connection/ConnectionRefusedServerMessage;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;
.source "ConnectionRefusedServerMessage.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;)V
    .locals 0
    .parameter "pInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;-><init>()V

    .line 34
    return-void
.end method


# virtual methods
.method public getFlag()S
    .locals 1

    .prologue
    .line 46
    const/16 v0, -0x7fff

    return v0
.end method

.method protected onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V
    .locals 0
    .parameter "pStringBuilder"

    .prologue
    .line 57
    return-void
.end method

.method protected onWriteTransmissionData(Ljava/io/DataOutputStream;)V
    .locals 0
    .parameter "pDataOutputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    return-void
.end method
