.class Lcom/SixClawWorm/utils/ExitApplication$1;
.super Ljava/lang/Object;
.source "ExitApplication.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/utils/ExitApplication;->exit(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/utils/ExitApplication;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/utils/ExitApplication;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/utils/ExitApplication$1;->this$0:Lcom/SixClawWorm/utils/ExitApplication;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 49
    iget-object v1, p0, Lcom/SixClawWorm/utils/ExitApplication$1;->this$0:Lcom/SixClawWorm/utils/ExitApplication;

    #getter for: Lcom/SixClawWorm/utils/ExitApplication;->listActivity:Ljava/util/List;
    invoke-static {v1}, Lcom/SixClawWorm/utils/ExitApplication;->access$0(Lcom/SixClawWorm/utils/ExitApplication;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 52
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 53
    return-void

    .line 49
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 50
    .local v0, activity:Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method
