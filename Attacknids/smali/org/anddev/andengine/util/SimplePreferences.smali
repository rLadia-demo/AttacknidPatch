.class public Lorg/anddev/andengine/util/SimplePreferences;
.super Ljava/lang/Object;
.source "SimplePreferences.java"

# interfaces
.implements Lorg/anddev/andengine/util/constants/Constants;


# static fields
.field private static EDITORINSTANCE:Landroid/content/SharedPreferences$Editor;

.field private static INSTANCE:Landroid/content/SharedPreferences;

.field private static final PREFERENCES_NAME:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-object v0, Lorg/anddev/andengine/util/SimplePreferences;->PREFERENCES_NAME:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAccessCount(Landroid/content/Context;Ljava/lang/String;)I
    .locals 2
    .parameter "pCtx"
    .parameter "pKey"

    .prologue
    .line 72
    invoke-static {p0}, Lorg/anddev/andengine/util/SimplePreferences;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getEditorInstance(Landroid/content/Context;)Landroid/content/SharedPreferences$Editor;
    .locals 1
    .parameter "ctx"

    .prologue
    .line 39
    sget-object v0, Lorg/anddev/andengine/util/SimplePreferences;->EDITORINSTANCE:Landroid/content/SharedPreferences$Editor;

    if-nez v0, :cond_0

    .line 40
    invoke-static {p0}, Lorg/anddev/andengine/util/SimplePreferences;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sput-object v0, Lorg/anddev/andengine/util/SimplePreferences;->EDITORINSTANCE:Landroid/content/SharedPreferences$Editor;

    .line 42
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/SimplePreferences;->EDITORINSTANCE:Landroid/content/SharedPreferences$Editor;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2
    .parameter "ctx"

    .prologue
    .line 32
    sget-object v0, Lorg/anddev/andengine/util/SimplePreferences;->INSTANCE:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 33
    sget-object v0, Lorg/anddev/andengine/util/SimplePreferences;->PREFERENCES_NAME:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Lorg/anddev/andengine/util/SimplePreferences;->INSTANCE:Landroid/content/SharedPreferences;

    .line 35
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/SimplePreferences;->INSTANCE:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method public static incrementAccessCount(Landroid/content/Context;Ljava/lang/String;)I
    .locals 1
    .parameter "pCtx"
    .parameter "pKey"

    .prologue
    .line 58
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/anddev/andengine/util/SimplePreferences;->incrementAccessCount(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static incrementAccessCount(Landroid/content/Context;Ljava/lang/String;I)I
    .locals 4
    .parameter "pCtx"
    .parameter "pKey"
    .parameter "pIncrement"

    .prologue
    .line 62
    invoke-static {p0}, Lorg/anddev/andengine/util/SimplePreferences;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 63
    .local v2, prefs:Landroid/content/SharedPreferences;
    const/4 v3, 0x0

    invoke-interface {v2, p1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 65
    .local v0, accessCount:I
    add-int v1, v0, p2

    .line 66
    .local v1, newAccessCount:I
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, p1, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 68
    return v1
.end method
