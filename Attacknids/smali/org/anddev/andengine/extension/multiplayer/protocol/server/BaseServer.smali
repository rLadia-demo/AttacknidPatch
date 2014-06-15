.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;
.super Ljava/lang/Thread;
.source "BaseServer.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ProtocolConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<CC:",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;",
        ">",
        "Ljava/lang/Thread;",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/util/constants/ProtocolConstants;"
    }
.end annotation


# instance fields
.field private final mClientConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;

.field protected final mClientConnectors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TCC;>;"
        }
    .end annotation
.end field

.field private mRunning:Z

.field private final mServerPort:I

.field private mServerSocket:Ljava/net/ServerSocket;

.field private final mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

.field private mTerminated:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    const/16 v0, 0x115c

    invoke-direct {p0, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;-><init>(I)V

    .line 47
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "pPort"

    .prologue
    .line 50
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener$DefaultClientConnectionListener;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener$DefaultClientConnectionListener;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;-><init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;)V

    .line 51
    return-void
.end method

.method public constructor <init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;)V
    .locals 1
    .parameter "pPort"
    .parameter "pClientConnectionListener"

    .prologue
    .line 62
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener$DefaultServerStateListener;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener$DefaultServerStateListener;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;-><init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;)V

    .line 63
    return-void
.end method

.method public constructor <init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;)V
    .locals 3
    .parameter "pPort"
    .parameter "pClientConnectionListener"
    .parameter

    .prologue
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    .local p3, pServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;"
    const/4 v1, 0x0

    .line 73
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mClientConnectors:Ljava/util/ArrayList;

    .line 35
    iput-boolean v1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mRunning:Z

    .line 36
    iput-boolean v1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mTerminated:Z

    .line 74
    iput-object p3, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    .line 76
    if-gez p1, :cond_0

    .line 77
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Illegal port \'< 0\'."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onException(Ljava/lang/Throwable;)V

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 80
    :cond_0
    iput p1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerPort:I

    .line 83
    iput-object p2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mClientConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;

    .line 85
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->initName()V

    .line 86
    return-void
.end method

.method public constructor <init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;)V
    .locals 1
    .parameter "pPort"
    .parameter

    .prologue
    .line 66
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    .local p2, pServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;"
    new-instance v0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener$DefaultClientConnectionListener;

    invoke-direct {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener$DefaultClientConnectionListener;-><init>()V

    invoke-direct {p0, p1, v0, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;-><init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;)V
    .locals 1
    .parameter "pClientConnectionListener"

    .prologue
    .line 54
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    const/16 v0, 0x115c

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;-><init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;)V
    .locals 1
    .parameter "pClientConnectionListener"
    .parameter

    .prologue
    .line 70
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    .local p2, pServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;"
    const/16 v0, 0x115c

    invoke-direct {p0, v0, p1, p2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;-><init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;)V
    .locals 1
    .parameter

    .prologue
    .line 58
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    .local p1, pServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;"
    const/16 v0, 0x115c

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;-><init>(ILorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;)V

    .line 59
    return-void
.end method

.method private initName()V
    .locals 1

    .prologue
    .line 89
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->setName(Ljava/lang/String;)V

    .line 90
    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 154
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->interrupt()V

    .line 155
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 156
    return-void
.end method

.method public interrupt()V
    .locals 4

    .prologue
    .line 161
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mTerminated:Z

    .line 163
    invoke-super {p0}, Ljava/lang/Thread;->interrupt()V

    .line 166
    iget-object v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mClientConnectors:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 170
    iget-object v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mClientConnectors:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 172
    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 174
    iget-object v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerSocket:Ljava/net/ServerSocket;

    invoke-static {v2}, Lorg/anddev/andengine/util/SocketUtils;->closeSocket(Ljava/net/ServerSocket;)V

    .line 175
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mRunning:Z

    .line 179
    :goto_1
    return-void

    .line 166
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;

    .line 167
    .local v0, cc:Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;
    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->interrupt()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 176
    .end local v0           #cc:Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;
    :catch_0
    move-exception v1

    .line 177
    .local v1, e:Ljava/lang/Exception;
    iget-object v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    invoke-interface {v2, v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onException(Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 97
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mRunning:Z

    return v0
.end method

.method public isTerminated()Z
    .locals 1

    .prologue
    .line 101
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mTerminated:Z

    return v0
.end method

.method protected abstract newClientConnector(Ljava/net/Socket;Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;)Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/Socket;",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;",
            ")TCC;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public run()V
    .locals 8

    .prologue
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 112
    iput-boolean v6, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mRunning:Z

    .line 113
    iput-boolean v7, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mTerminated:Z

    .line 114
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    iget v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerPort:I

    invoke-interface {v4, v5}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onStarted(I)V

    .line 117
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/Thread;->setPriority(I)V

    .line 118
    invoke-static {}, Ljavax/net/ServerSocketFactory;->getDefault()Ljavax/net/ServerSocketFactory;

    move-result-object v4

    iget v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerPort:I

    invoke-virtual {v4, v5}, Ljavax/net/ServerSocketFactory;->createServerSocket(I)Ljava/net/ServerSocket;

    move-result-object v4

    iput-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerSocket:Ljava/net/ServerSocket;

    .line 121
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    if-eqz v4, :cond_1

    .line 145
    :cond_0
    :goto_1
    iput-boolean v7, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mRunning:Z

    .line 146
    iput-boolean v6, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mTerminated:Z

    .line 147
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerSocket:Ljava/net/ServerSocket;

    invoke-static {v4}, Lorg/anddev/andengine/util/SocketUtils;->closeSocket(Ljava/net/ServerSocket;)V

    .line 148
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    iget v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerPort:I

    invoke-interface {v4, v5}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onTerminated(I)V

    .line 150
    :goto_2
    return-void

    .line 124
    :cond_1
    :try_start_1
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerSocket:Ljava/net/ServerSocket;

    invoke-virtual {v4}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    .line 127
    .local v1, clientSocket:Ljava/net/Socket;
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mClientConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;

    invoke-virtual {p0, v1, v4}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->newClientConnector(Ljava/net/Socket;Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseClientConnectionListener;)Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;

    move-result-object v0

    .line 128
    .local v0, clientConnector:Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;,"TCC;"
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mClientConnectors:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    invoke-virtual {v0}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 132
    .end local v0           #clientConnector:Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;,"TCC;"
    .end local v1           #clientSocket:Ljava/net/Socket;
    :catch_0
    move-exception v3

    .line 133
    .local v3, se:Ljava/net/SocketException;
    :try_start_2
    invoke-virtual {v3}, Ljava/net/SocketException;->getMessage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "socket closed"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Ljava/net/SocketException;->getMessage()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Socket is closed"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 134
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    invoke-interface {v4, v3}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onException(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 142
    .end local v3           #se:Ljava/net/SocketException;
    :catch_1
    move-exception v2

    .line 143
    .local v2, pThrowable:Ljava/lang/Throwable;
    :try_start_3
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    invoke-interface {v4, v2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onException(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 145
    iput-boolean v7, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mRunning:Z

    .line 146
    iput-boolean v6, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mTerminated:Z

    .line 147
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerSocket:Ljava/net/ServerSocket;

    invoke-static {v4}, Lorg/anddev/andengine/util/SocketUtils;->closeSocket(Ljava/net/ServerSocket;)V

    .line 148
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    iget v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerPort:I

    invoke-interface {v4, v5}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onTerminated(I)V

    goto :goto_2

    .line 138
    .end local v2           #pThrowable:Ljava/lang/Throwable;
    :catch_2
    move-exception v2

    .line 139
    .restart local v2       #pThrowable:Ljava/lang/Throwable;
    :try_start_4
    iget-object v4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    invoke-interface {v4, v2}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onException(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 144
    .end local v2           #pThrowable:Ljava/lang/Throwable;
    :catchall_0
    move-exception v4

    .line 145
    iput-boolean v7, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mRunning:Z

    .line 146
    iput-boolean v6, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mTerminated:Z

    .line 147
    iget-object v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerSocket:Ljava/net/ServerSocket;

    invoke-static {v5}, Lorg/anddev/andengine/util/SocketUtils;->closeSocket(Ljava/net/ServerSocket;)V

    .line 148
    iget-object v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    iget v6, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerPort:I

    invoke-interface {v5, v6}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onTerminated(I)V

    .line 149
    throw v4
.end method

.method public sendBroadcastServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V
    .locals 4
    .parameter "pServerMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 186
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;,"Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer<TCC;>;"
    iget-boolean v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mRunning:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mTerminated:Z

    if-nez v2, :cond_0

    .line 187
    iget-object v2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mClientConnectors:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 195
    :cond_0
    return-void

    .line 187
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;

    .line 189
    .local v0, cc:Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;
    :try_start_0
    invoke-virtual {v0, p1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/ClientConnector;->sendServerMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/server/BaseServerMessage;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 190
    :catch_0
    move-exception v1

    .line 191
    .local v1, e:Ljava/io/IOException;
    iget-object v3, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;->mServerStateListener:Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;

    invoke-interface {v3, v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;->onException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
