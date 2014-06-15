.class Lcom/SixClawWorm/application/MenuActivity$3;
.super Ljava/lang/Object;
.source "MenuActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/application/MenuActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/MenuActivity;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/MenuActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/MenuActivity$3;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 52
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/SixClawWorm/application/MenuActivity$3;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    const-class v2, Lcom/SixClawWorm/application/BluetoothChat;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 53
    .local v0, start:Landroid/content/Intent;
    iget-object v1, p0, Lcom/SixClawWorm/application/MenuActivity$3;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    invoke-virtual {v1, v0}, Lcom/SixClawWorm/application/MenuActivity;->startActivity(Landroid/content/Intent;)V

    .line 55
    return-void
.end method
