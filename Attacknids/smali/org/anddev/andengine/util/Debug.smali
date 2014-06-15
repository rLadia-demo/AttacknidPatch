.class public Lorg/anddev/andengine/util/Debug;
.super Ljava/lang/Object;
.source "Debug.java"

# interfaces
.implements Lorg/anddev/andengine/util/constants/Constants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/util/Debug$DebugLevel;
    }
.end annotation


# static fields
.field private static DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lorg/anddev/andengine/util/Debug$DebugLevel;->VERBOSE:Lorg/anddev/andengine/util/Debug$DebugLevel;

    sput-object v0, Lorg/anddev/andengine/util/Debug;->DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 1
    .parameter "pMessage"

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/anddev/andengine/util/Debug;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .parameter "pMessage"
    .parameter "pThrowable"

    .prologue
    .line 64
    sget-object v0, Lorg/anddev/andengine/util/Debug;->DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->DEBUG:Lorg/anddev/andengine/util/Debug$DebugLevel;

    #calls: Lorg/anddev/andengine/util/Debug$DebugLevel;->isSameOrLessThan(Lorg/anddev/andengine/util/Debug$DebugLevel;)Z
    invoke-static {v0, v1}, Lorg/anddev/andengine/util/Debug$DebugLevel;->access$2(Lorg/anddev/andengine/util/Debug$DebugLevel;Lorg/anddev/andengine/util/Debug$DebugLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    const-string v0, "AndEngine"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 67
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 1
    .parameter "pMessage"

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .parameter "pMessage"
    .parameter "pThrowable"

    .prologue
    .line 106
    sget-object v0, Lorg/anddev/andengine/util/Debug;->DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->ERROR:Lorg/anddev/andengine/util/Debug$DebugLevel;

    #calls: Lorg/anddev/andengine/util/Debug$DebugLevel;->isSameOrLessThan(Lorg/anddev/andengine/util/Debug$DebugLevel;)Z
    invoke-static {v0, v1}, Lorg/anddev/andengine/util/Debug$DebugLevel;->access$2(Lorg/anddev/andengine/util/Debug$DebugLevel;Lorg/anddev/andengine/util/Debug$DebugLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 107
    if-nez p1, :cond_1

    .line 108
    const-string v0, "AndEngine"

    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    invoke-static {v0, p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 113
    :cond_0
    :goto_0
    return-void

    .line 110
    :cond_1
    const-string v0, "AndEngine"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static e(Ljava/lang/Throwable;)V
    .locals 1
    .parameter "pThrowable"

    .prologue
    .line 102
    const-string v0, "AndEngine"

    invoke-static {v0, p0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 103
    return-void
.end method

.method public static getDebugLevel()Lorg/anddev/andengine/util/Debug$DebugLevel;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lorg/anddev/andengine/util/Debug;->DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    return-object v0
.end method

.method public static i(Ljava/lang/String;)V
    .locals 1
    .parameter "pMessage"

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/anddev/andengine/util/Debug;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .parameter "pMessage"
    .parameter "pThrowable"

    .prologue
    .line 74
    sget-object v0, Lorg/anddev/andengine/util/Debug;->DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->INFO:Lorg/anddev/andengine/util/Debug$DebugLevel;

    #calls: Lorg/anddev/andengine/util/Debug$DebugLevel;->isSameOrLessThan(Lorg/anddev/andengine/util/Debug$DebugLevel;)Z
    invoke-static {v0, v1}, Lorg/anddev/andengine/util/Debug$DebugLevel;->access$2(Lorg/anddev/andengine/util/Debug$DebugLevel;Lorg/anddev/andengine/util/Debug$DebugLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 75
    const-string v0, "AndEngine"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 77
    :cond_0
    return-void
.end method

.method public static setDebugLevel(Lorg/anddev/andengine/util/Debug$DebugLevel;)V
    .locals 2
    .parameter "pDebugLevel"

    .prologue
    .line 31
    if-nez p0, :cond_0

    .line 32
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pDebugLevel must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_0
    sput-object p0, Lorg/anddev/andengine/util/Debug;->DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    .line 35
    return-void
.end method

.method public static v(Ljava/lang/String;)V
    .locals 1
    .parameter "pMessage"

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/anddev/andengine/util/Debug;->v(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .parameter "pMessage"
    .parameter "pThrowable"

    .prologue
    .line 54
    sget-object v0, Lorg/anddev/andengine/util/Debug;->DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->VERBOSE:Lorg/anddev/andengine/util/Debug$DebugLevel;

    #calls: Lorg/anddev/andengine/util/Debug$DebugLevel;->isSameOrLessThan(Lorg/anddev/andengine/util/Debug$DebugLevel;)Z
    invoke-static {v0, v1}, Lorg/anddev/andengine/util/Debug$DebugLevel;->access$2(Lorg/anddev/andengine/util/Debug$DebugLevel;Lorg/anddev/andengine/util/Debug$DebugLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    const-string v0, "AndEngine"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 57
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .locals 1
    .parameter "pMessage"

    .prologue
    .line 80
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/anddev/andengine/util/Debug;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 81
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .parameter "pMessage"
    .parameter "pThrowable"

    .prologue
    .line 88
    sget-object v0, Lorg/anddev/andengine/util/Debug;->DEBUGLEVEL:Lorg/anddev/andengine/util/Debug$DebugLevel;

    sget-object v1, Lorg/anddev/andengine/util/Debug$DebugLevel;->WARNING:Lorg/anddev/andengine/util/Debug$DebugLevel;

    #calls: Lorg/anddev/andengine/util/Debug$DebugLevel;->isSameOrLessThan(Lorg/anddev/andengine/util/Debug$DebugLevel;)Z
    invoke-static {v0, v1}, Lorg/anddev/andengine/util/Debug$DebugLevel;->access$2(Lorg/anddev/andengine/util/Debug$DebugLevel;Lorg/anddev/andengine/util/Debug$DebugLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    if-nez p1, :cond_1

    .line 90
    const-string v0, "AndEngine"

    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    invoke-static {v0, p0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 95
    :cond_0
    :goto_0
    return-void

    .line 92
    :cond_1
    const-string v0, "AndEngine"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public static w(Ljava/lang/Throwable;)V
    .locals 1
    .parameter "pThrowable"

    .prologue
    .line 84
    const-string v0, "AndEngine"

    invoke-static {v0, p0}, Lorg/anddev/andengine/util/Debug;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    return-void
.end method
