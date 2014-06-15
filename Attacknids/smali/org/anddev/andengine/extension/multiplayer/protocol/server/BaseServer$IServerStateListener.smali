.class public interface abstract Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener;
.super Ljava/lang/Object;
.source "BaseServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IServerStateListener"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/extension/multiplayer/protocol/server/BaseServer$IServerStateListener$DefaultServerStateListener;
    }
.end annotation


# virtual methods
.method public abstract onException(Ljava/lang/Throwable;)V
.end method

.method public abstract onStarted(I)V
.end method

.method public abstract onTerminated(I)V
.end method
