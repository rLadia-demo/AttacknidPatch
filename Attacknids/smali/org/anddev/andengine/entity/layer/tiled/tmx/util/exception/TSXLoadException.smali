.class public Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TSXLoadException;
.super Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXException;
.source "TSXLoadException.java"


# static fields
.field private static final serialVersionUID:J = 0x23b92c4507bd77L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXException;-><init>()V

    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "pDetailMessage"

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXException;-><init>(Ljava/lang/String;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "pDetailMessage"
    .parameter "pThrowable"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .parameter "pThrowable"

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/layer/tiled/tmx/util/exception/TMXException;-><init>(Ljava/lang/Throwable;)V

    .line 36
    return-void
.end method
