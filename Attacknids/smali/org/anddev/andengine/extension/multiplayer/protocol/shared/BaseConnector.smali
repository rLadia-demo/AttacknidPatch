.class public abstract Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;
.super Ljava/lang/Thread;
.source "BaseConnector.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M::",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;",
        ">",
        "Ljava/lang/Thread;"
    }
.end annotation


# instance fields
.field private mConnectionCloseSent:Z

.field private final mConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener",
            "<TM;",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
            "<TM;>;>;"
        }
    .end annotation
.end field

.field private final mDataInputStream:Ljava/io/DataInputStream;

.field private final mDataOutputStream:Ljava/io/DataOutputStream;

.field private final mMessageExtractor:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor",
            "<TM;>;"
        }
    .end annotation
.end field

.field private final mMessageSwitch:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch",
            "<TM;>;"
        }
    .end annotation
.end field

.field private final mSocket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/net/Socket;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;)V
    .locals 2
    .parameter "pSocket"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/Socket;",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener",
            "<TM;",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
            "<TM;>;>;",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor",
            "<TM;>;",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch",
            "<TM;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    .local p2, pConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener<TM;Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;>;"
    .local p3, pMessageExtractor:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor<TM;>;"
    .local p4, pMessageSwitch:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch<TM;>;"
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionCloseSent:Z

    .line 40
    iput-object p1, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mSocket:Ljava/net/Socket;

    .line 41
    iput-object p2, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    .line 42
    iput-object p3, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mMessageExtractor:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;

    .line 43
    iput-object p4, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mMessageSwitch:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;

    .line 45
    new-instance v0, Ljava/io/DataInputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mDataInputStream:Ljava/io/DataInputStream;

    .line 46
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mDataOutputStream:Ljava/io/DataOutputStream;

    .line 47
    return-void
.end method

.method private closeConnection()V
    .locals 1

    .prologue
    .line 127
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    iget-boolean v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionCloseSent:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mSocket:Ljava/net/Socket;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mSocket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionCloseSent:Z

    .line 129
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->onSendConnectionClose()V

    .line 133
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mSocket:Ljava/net/Socket;

    invoke-static {v0}, Lorg/anddev/andengine/util/SocketUtils;->closeSocket(Ljava/net/Socket;)V

    .line 135
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    if-eqz v0, :cond_1

    .line 136
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->onDisconnect(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V

    .line 138
    :cond_1
    return-void
.end method


# virtual methods
.method public getConnectionListener()Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener",
            "<TM;",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector",
            "<TM;>;>;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    return-object v0
.end method

.method protected getDataInputStream()Ljava/io/DataInputStream;
    .locals 1

    .prologue
    .line 62
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mDataInputStream:Ljava/io/DataInputStream;

    return-object v0
.end method

.method protected getDataOutputStream()Ljava/io/DataOutputStream;
    .locals 1

    .prologue
    .line 58
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mDataOutputStream:Ljava/io/DataOutputStream;

    return-object v0
.end method

.method public getMessageSwitch()Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch",
            "<TM;>;"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mMessageSwitch:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/IMessageSwitch;

    return-object v0
.end method

.method public getSocket()Ljava/net/Socket;
    .locals 1

    .prologue
    .line 54
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mSocket:Ljava/net/Socket;

    return-object v0
.end method

.method protected abstract handleMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TM;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public hasConnectionListener()Z
    .locals 1

    .prologue
    .line 70
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    iget-object v0, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public interrupt()V
    .locals 0

    .prologue
    .line 117
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->closeConnection()V

    .line 119
    invoke-super {p0}, Ljava/lang/Thread;->interrupt()V

    .line 120
    return-void
.end method

.method protected abstract onSendConnectionClose()V
.end method

.method public run()V
    .locals 7

    .prologue
    .line 87
    .local p0, this:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;,"Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector<TM;>;"
    iget-object v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    if-eqz v5, :cond_0

    .line 88
    iget-object v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mConnectionListener:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;

    invoke-virtual {v5, p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;->onConnect(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V

    .line 91
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/Thread;->setPriority(I)V

    .line 93
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->isInterrupted()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result v5

    if-eqz v5, :cond_1

    .line 111
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->closeConnection()V

    .line 113
    :goto_1
    return-void

    .line 96
    :cond_1
    :try_start_1
    iget-object v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mMessageExtractor:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;

    iget-object v6, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v5, v6}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;->readMessageFlag(Ljava/io/DataInputStream;)S

    move-result v2

    .line 97
    .local v2, messageFlag:S
    iget-object v5, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mMessageExtractor:Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;

    iget-object v6, p0, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->mDataInputStream:Ljava/io/DataInputStream;

    invoke-virtual {v5, v2, v6}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;->readMessage(SLjava/io/DataInputStream;)Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;

    move-result-object v1

    .line 98
    .local v1, message:Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;,"TM;"
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->handleMessage(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_0

    .line 100
    .end local v1           #message:Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;,"TM;"
    .end local v2           #messageFlag:S
    :catch_0
    move-exception v4

    .line 101
    .local v4, se:Ljava/net/SocketException;
    :try_start_2
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 108
    .end local v4           #se:Ljava/net/SocketException;
    :catch_1
    move-exception v3

    .line 109
    .local v3, pThrowable:Ljava/lang/Throwable;
    :try_start_3
    invoke-static {v3}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 111
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->closeConnection()V

    goto :goto_1

    .line 102
    .end local v3           #pThrowable:Ljava/lang/Throwable;
    :catch_2
    move-exception v0

    .line 103
    .local v0, eof:Ljava/io/EOFException;
    :try_start_4
    invoke-virtual {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->interrupt()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 110
    .end local v0           #eof:Ljava/io/EOFException;
    :catchall_0
    move-exception v5

    .line 111
    invoke-direct {p0}, Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;->closeConnection()V

    .line 112
    throw v5

    .line 104
    :catch_3
    move-exception v3

    .line 105
    .restart local v3       #pThrowable:Ljava/lang/Throwable;
    :try_start_5
    invoke-static {v3}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_0
.end method
