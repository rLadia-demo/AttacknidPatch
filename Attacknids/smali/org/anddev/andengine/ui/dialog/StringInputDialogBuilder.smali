.class public Lorg/anddev/andengine/ui/dialog/StringInputDialogBuilder;
.super Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;
.source "StringInputDialogBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;IIIILjava/lang/String;Lorg/anddev/andengine/util/Callback;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 0
    .parameter "pContext"
    .parameter "pTitleResID"
    .parameter "pMessageResID"
    .parameter "pErrorResID"
    .parameter "pIconResID"
    .parameter "pDefaultText"
    .parameter
    .parameter "pOnCancelListener"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "IIII",
            "Ljava/lang/String;",
            "Lorg/anddev/andengine/util/Callback",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/DialogInterface$OnCancelListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 30
    .local p7, pSuccessCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p8}, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;-><init>(Landroid/content/Context;IIIILjava/lang/String;Lorg/anddev/andengine/util/Callback;Landroid/content/DialogInterface$OnCancelListener;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIIILorg/anddev/andengine/util/Callback;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 0
    .parameter "pContext"
    .parameter "pTitleResID"
    .parameter "pMessageResID"
    .parameter "pErrorResID"
    .parameter "pIconResID"
    .parameter
    .parameter "pOnCancelListener"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "IIII",
            "Lorg/anddev/andengine/util/Callback",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/DialogInterface$OnCancelListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 26
    .local p6, pSuccessCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p7}, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;-><init>(Landroid/content/Context;IIIILorg/anddev/andengine/util/Callback;Landroid/content/DialogInterface$OnCancelListener;)V

    .line 27
    return-void
.end method


# virtual methods
.method protected bridge synthetic generateResult(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/ui/dialog/StringInputDialogBuilder;->generateResult(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected generateResult(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "pInput"

    .prologue
    .line 43
    return-object p1
.end method
