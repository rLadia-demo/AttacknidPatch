.class public Lorg/anddev/andengine/util/BetaUtils;
.super Ljava/lang/Object;
.source "BetaUtils.java"

# interfaces
.implements Lorg/anddev/andengine/util/constants/Constants;


# static fields
.field private static final PREFERENCES_BETAUTILS_ID:Ljava/lang/String; = "preferences.betautils.lastuse"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static finishWhenExpired(Landroid/app/Activity;Ljava/util/GregorianCalendar;II)Z
    .locals 6
    .parameter "pActivity"
    .parameter "pExpirationDate"
    .parameter "pTitleResourceID"
    .parameter "pMessageResourceID"

    .prologue
    const/4 v4, 0x0

    .line 49
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, v4

    invoke-static/range {v0 .. v5}, Lorg/anddev/andengine/util/BetaUtils;->finishWhenExpired(Landroid/app/Activity;Ljava/util/GregorianCalendar;IILandroid/content/Intent;Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public static finishWhenExpired(Landroid/app/Activity;Ljava/util/GregorianCalendar;IILandroid/content/Intent;Landroid/content/Intent;)Z
    .locals 10
    .parameter "pActivity"
    .parameter "pExpirationDate"
    .parameter "pTitleResourceID"
    .parameter "pMessageResourceID"
    .parameter "pOkIntent"
    .parameter "pCancelIntent"

    .prologue
    .line 53
    invoke-static {p0}, Lorg/anddev/andengine/util/SimplePreferences;->getInstance(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 55
    .local v6, spref:Landroid/content/SharedPreferences;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 56
    .local v4, now:J
    const-string v7, "preferences.betautils.lastuse"

    const-wide/16 v8, -0x1

    invoke-interface {v6, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    .line 57
    .local v1, lastuse:J
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "preferences.betautils.lastuse"

    invoke-interface {v7, v8, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 59
    new-instance v3, Ljava/util/GregorianCalendar;

    invoke-direct {v3}, Ljava/util/GregorianCalendar;-><init>()V

    .line 60
    .local v3, lastuseDate:Ljava/util/GregorianCalendar;
    invoke-virtual {v3, v1, v2}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    .line 62
    invoke-virtual {v3, p1}, Ljava/util/GregorianCalendar;->after(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 63
    new-instance v7, Landroid/app/AlertDialog$Builder;

    invoke-direct {v7, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 64
    invoke-virtual {v7, p2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 65
    const v8, 0x1080027

    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 66
    invoke-virtual {v7, p3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 68
    .local v0, alertDialogBuilder:Landroid/app/AlertDialog$Builder;
    const v7, 0x104000a

    new-instance v8, Lorg/anddev/andengine/util/BetaUtils$1;

    invoke-direct {v8, p4, p0}, Lorg/anddev/andengine/util/BetaUtils$1;-><init>(Landroid/content/Intent;Landroid/app/Activity;)V

    invoke-virtual {v0, v7, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 77
    const/high16 v7, 0x104

    new-instance v8, Lorg/anddev/andengine/util/BetaUtils$2;

    invoke-direct {v8, p5, p0}, Lorg/anddev/andengine/util/BetaUtils$2;-><init>(Landroid/content/Intent;Landroid/app/Activity;)V

    invoke-virtual {v0, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 86
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    .line 87
    const/4 v7, 0x1

    .line 89
    .end local v0           #alertDialogBuilder:Landroid/app/AlertDialog$Builder;
    :goto_0
    return v7

    :cond_0
    const/4 v7, 0x0

    goto :goto_0
.end method
