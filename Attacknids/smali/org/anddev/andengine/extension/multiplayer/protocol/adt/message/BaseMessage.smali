.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;
.super Ljava/lang/Object;
.source "BaseMessage.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 57
    if-ne p0, p1, :cond_1

    .line 69
    :cond_0
    :goto_0
    return v1

    .line 60
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 61
    goto :goto_0

    .line 63
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 64
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 67
    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;

    .line 69
    .local v0, other:Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;->getFlag()S

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;->getFlag()S

    move-result v4

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public abstract getFlag()S
.end method

.method protected abstract onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V
.end method

.method protected abstract onWriteTransmissionData(Ljava/io/DataOutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .local v0, sb:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 46
    const-string v2, "[getFlag()="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;->getFlag()S

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;->onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V

    .line 50
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public transmit(Ljava/io/DataOutputStream;)V
    .locals 1
    .parameter "pDataOutputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;->getFlag()S

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 78
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;->onWriteTransmissionData(Ljava/io/DataOutputStream;)V

    .line 79
    return-void
.end method
