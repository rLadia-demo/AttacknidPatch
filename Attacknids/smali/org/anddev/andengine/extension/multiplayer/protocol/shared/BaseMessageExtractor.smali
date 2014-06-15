.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;
.super Ljava/lang/Object;
.source "BaseMessageExtractor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M::",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor<TM;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract readMessage(SLjava/io/DataInputStream;)Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(S",
            "Ljava/io/DataInputStream;",
            ")TM;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public readMessageFlag(Ljava/io/DataInputStream;)S
    .locals 1
    .parameter "pDataInputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor<TM;>;"
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readShort()S

    move-result v0

    return v0
.end method
