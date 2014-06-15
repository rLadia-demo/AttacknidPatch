.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;
.source "BaseClientMessage.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ClientMessageFlags;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/BaseMessage;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 33
    if-ne p0, p1, :cond_1

    .line 45
    :cond_0
    :goto_0
    return v1

    .line 36
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 37
    goto :goto_0

    .line 39
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 40
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 43
    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;

    .line 45
    .local v0, other:Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;->getFlag()S

    move-result v3

    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;->getFlag()S

    move-result v4

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method
