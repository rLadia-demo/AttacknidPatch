.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/EmptyClientMessage;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;
.source "EmptyClientMessage.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 26
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
    .line 28
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 30
    return-void
.end method


# virtual methods
.method protected onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V
    .locals 0
    .parameter "pStringBuilder"

    .prologue
    .line 48
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
    .line 43
    return-void
.end method
