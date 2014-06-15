.class public Lcom/SixClawWorm/utils/ExitApplication;
.super Ljava/lang/Object;
.source "ExitApplication.java"


# static fields
.field private static exitApplication:Lcom/SixClawWorm/utils/ExitApplication;


# instance fields
.field private listActivity:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/utils/ExitApplication;->listActivity:Ljava/util/List;

    .line 24
    return-void
.end method

.method static synthetic access$0(Lcom/SixClawWorm/utils/ExitApplication;)Ljava/util/List;
    .locals 1
    .parameter

    .prologue
    .line 18
    iget-object v0, p0, Lcom/SixClawWorm/utils/ExitApplication;->listActivity:Ljava/util/List;

    return-object v0
.end method

.method public static getInstance()Lcom/SixClawWorm/utils/ExitApplication;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/SixClawWorm/utils/ExitApplication;->exitApplication:Lcom/SixClawWorm/utils/ExitApplication;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lcom/SixClawWorm/utils/ExitApplication;

    invoke-direct {v0}, Lcom/SixClawWorm/utils/ExitApplication;-><init>()V

    sput-object v0, Lcom/SixClawWorm/utils/ExitApplication;->exitApplication:Lcom/SixClawWorm/utils/ExitApplication;

    .line 30
    :cond_0
    sget-object v0, Lcom/SixClawWorm/utils/ExitApplication;->exitApplication:Lcom/SixClawWorm/utils/ExitApplication;

    return-object v0
.end method


# virtual methods
.method public addActivity(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 37
    iget-object v0, p0, Lcom/SixClawWorm/utils/ExitApplication;->listActivity:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    return-void
.end method

.method public exit(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    .line 45
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Are you sure?"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 46
    const-string v2, "Are you sure to quit the game?"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 47
    const-string v2, "sure"

    new-instance v3, Lcom/SixClawWorm/utils/ExitApplication$1;

    invoke-direct {v3, p0}, Lcom/SixClawWorm/utils/ExitApplication$1;-><init>(Lcom/SixClawWorm/utils/ExitApplication;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 55
    const-string v2, "cancel"

    new-instance v3, Lcom/SixClawWorm/utils/ExitApplication$2;

    invoke-direct {v3, p0}, Lcom/SixClawWorm/utils/ExitApplication$2;-><init>(Lcom/SixClawWorm/utils/ExitApplication;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 59
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 60
    .local v0, dialog:Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 61
    return-void
.end method
