.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;
.source "BaseStringClientMessage.java"


# instance fields
.field protected mString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/DataInputStream;)V
    .locals 1
    .parameter "pDataInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 32
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->mString:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "pString"

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;-><init>()V

    .line 28
    iput-object p1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->mString:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 59
    if-ne p0, p1, :cond_1

    .line 72
    :cond_0
    :goto_0
    return v1

    .line 62
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 63
    goto :goto_0

    .line 65
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 66
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 69
    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;

    .line 71
    .local v0, other:Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->getFlag()S

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->getFlag()S

    move-result v4

    if-ne v3, v4, :cond_4

    .line 72
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->getString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->getString()Ljava/lang/String;

    move-result-object v4

    if-eq v3, v4, :cond_0

    :cond_4
    move v1, v2

    .line 71
    goto :goto_0
.end method

.method public getString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->mString:Ljava/lang/String;

    return-object v0
.end method

.method protected onAppendTransmissionDataForToString(Ljava/lang/StringBuilder;)V
    .locals 3
    .parameter "pStringBuilder"

    .prologue
    const/16 v2, 0x22

    .line 49
    const-string v0, ", getString()="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->getString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 50
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
    .line 54
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseStringClientMessage;->getString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 55
    return-void
.end method
