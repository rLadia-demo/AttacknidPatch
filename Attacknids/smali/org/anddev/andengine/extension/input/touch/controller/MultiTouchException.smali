.class public Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException;
.super Ljava/lang/Exception;
.source "MultiTouchException.java"


# static fields
.field private static final serialVersionUID:J = -0x4899f3ae59295109L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "pDetailMessage"

    .prologue
    .line 27
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 28
    return-void
.end method
