.class Lcom/SixClawWorm/application/NobluetoothActivity$4;
.super Ljava/lang/Object;
.source "NobluetoothActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/application/NobluetoothActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/NobluetoothActivity;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/NobluetoothActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/NobluetoothActivity$4;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 91
    sget-boolean v1, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    if-eqz v1, :cond_0

    .line 92
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/SixClawWorm/application/NobluetoothActivity$4;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    const-class v2, Lcom/SixClawWorm/application/PlayControlActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 93
    .local v0, okBtn:Landroid/content/Intent;
    iget-object v1, p0, Lcom/SixClawWorm/application/NobluetoothActivity$4;->this$0:Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-virtual {v1, v0}, Lcom/SixClawWorm/application/NobluetoothActivity;->startActivity(Landroid/content/Intent;)V

    .line 95
    .end local v0           #okBtn:Landroid/content/Intent;
    :cond_0
    return-void
.end method
