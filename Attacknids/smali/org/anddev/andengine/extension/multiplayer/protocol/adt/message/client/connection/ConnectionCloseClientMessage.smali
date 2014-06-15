.class public Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/connection/ConnectionCloseClientMessage;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;
.source "ConnectionCloseClientMessage.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 28
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
    .line 30
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 32
    return-void
.end method


# virtual methods
.method public getFlag()S
    .locals 1

    .prologue
    .line 44
    const/16 v0, -0x7fff

    return v0
.end method

.method protected onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V
    .locals 0
    .parameter "pStringBuilder"

    .prologue
    .line 55
    return-void
.end method

.method public onWriteTransmissionData(Ljava/io/DataOutputStream;)V
    .locals 0
    .parameter "pDataOutputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    return-void
.end method
