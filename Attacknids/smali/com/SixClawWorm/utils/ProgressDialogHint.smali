.class public Lcom/SixClawWorm/utils/ProgressDialogHint;
.super Ljava/lang/Object;
.source "ProgressDialogHint.java"


# static fields
.field private static mProgressDialog:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, 0x0

    sput-object v0, Lcom/SixClawWorm/utils/ProgressDialogHint;->mProgressDialog:Landroid/app/ProgressDialog;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Dismiss()V
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/SixClawWorm/utils/ProgressDialogHint;->mProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 30
    sget-object v0, Lcom/SixClawWorm/utils/ProgressDialogHint;->mProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->hide()V

    .line 31
    const/4 v0, 0x0

    sput-object v0, Lcom/SixClawWorm/utils/ProgressDialogHint;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 33
    :cond_0
    return-void
.end method

.method public static Show(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "title"
    .parameter "Message"

    .prologue
    const/4 v1, 0x1

    .line 13
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 14
    .local v0, dialog:Landroid/app/ProgressDialog;
    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 15
    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 16
    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 17
    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 18
    if-eqz v0, :cond_0

    .line 19
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 22
    :cond_0
    sput-object v0, Lcom/SixClawWorm/utils/ProgressDialogHint;->mProgressDialog:Landroid/app/ProgressDialog;

    .line 23
    return-void
.end method
