.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerConnectionListener;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;
.source "BaseServerConnectionListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerConnectionListener$DefaultServerConnectionListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;",
        ">;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;-><init>()V

    return-void
.end method
