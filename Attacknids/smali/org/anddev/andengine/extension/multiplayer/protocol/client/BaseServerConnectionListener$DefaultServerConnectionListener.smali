.class public Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerConnectionListener$DefaultServerConnectionListener;
.super Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerConnectionListener;
.source "BaseServerConnectionListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerConnectionListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultServerConnectionListener"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/client/BaseServerConnectionListener;-><init>()V

    return-void
.end method


# virtual methods
.method protected onConnectInner(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
            "<",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p1, pConnector:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Accepted Server-Connection from: \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 25
    return-void
.end method

.method protected onDisconnectInner(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
            "<",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, pConnector:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Closed Server-Connection from: \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->getSocket()Ljava/net/Socket;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 30
    return-void
.end method
