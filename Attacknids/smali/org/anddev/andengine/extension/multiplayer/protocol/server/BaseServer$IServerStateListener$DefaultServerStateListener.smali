.class public Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener$DefaultServerStateListener;
.super Ljava/lang/Object;
.source "BaseServer.java"

# interfaces
.implements Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultServerStateListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onException(Ljava/lang/Throwable;)V
    .locals 0
    .parameter "pThrowable"

    .prologue
    .line 214
    invoke-static {p1}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/Throwable;)V

    .line 215
    return-void
.end method

.method public onStarted(I)V
    .locals 2
    .parameter "pPort"

    .prologue
    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AndRemote-Server is listening on Port: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method public onTerminated(I)V
    .locals 2
    .parameter "pPort"

    .prologue
    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AndRemote-Server terminated on Port: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;)V

    .line 212
    return-void
.end method
