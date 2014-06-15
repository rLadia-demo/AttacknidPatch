.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;
.source "BaseClientConnectionListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener$DefaultClientConnectionListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
        "<",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/client/BaseClientMessage;",
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
