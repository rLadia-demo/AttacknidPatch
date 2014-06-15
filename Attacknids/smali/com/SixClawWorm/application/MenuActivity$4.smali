.class Lcom/SixClawWorm/application/MenuActivity$4;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    .line 63
    sget-boolean v6, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    if-eqz v6, :cond_2

    .line 64
    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    invoke-static {v6}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    .line 65
    .local v1, CAMERA_WIDTH:I
    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    invoke-static {v6}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v0

    .line 66
    .local v0, CAMERA_HEIGHT:I
    const/16 v6, 0x500

    if-ne v1, v6, :cond_0

    .line 68
    new-instance v3, Landroid/content/Intent;

    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    const-class v7, Lcom/SixClawWorm/application/PlayControlActivity1280;

    invoke-direct {v3, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 69
    .local v3, play1280:Landroid/content/Intent;
    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    invoke-virtual {v6, v3}, Lcom/SixClawWorm/application/MenuActivity;->startActivity(Landroid/content/Intent;)V

    .line 86
    .end local v0           #CAMERA_HEIGHT:I
    .end local v1           #CAMERA_WIDTH:I
    .end local v3           #play1280:Landroid/content/Intent;
    :goto_0
    return-void

    .line 71
    .restart local v0       #CAMERA_HEIGHT:I
    .restart local v1       #CAMERA_WIDTH:I
    :cond_0
    const/16 v6, 0x780

    if-ne v1, v6, :cond_1

    .line 73
    new-instance v4, Landroid/content/Intent;

    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    const-class v7, Lcom/SixClawWorm/application/PlayControlActivity1920;

    invoke-direct {v4, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    .local v4, play1920:Landroid/content/Intent;
    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    invoke-virtual {v6, v4}, Lcom/SixClawWorm/application/MenuActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 78
    .end local v4           #play1920:Landroid/content/Intent;
    :cond_1
    new-instance v5, Landroid/content/Intent;

    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    const-class v7, Lcom/SixClawWorm/application/PlayControlActivity;

    invoke-direct {v5, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 79
    .local v5, play800:Landroid/content/Intent;
    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    invoke-virtual {v6, v5}, Lcom/SixClawWorm/application/MenuActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 83
    .end local v0           #CAMERA_HEIGHT:I
    .end local v1           #CAMERA_WIDTH:I
    .end local v5           #play800:Landroid/content/Intent;
    :cond_2
    new-instance v2, Landroid/content/Intent;

    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    const-class v7, Lcom/SixClawWorm/application/NobluetoothActivity;

    invoke-direct {v2, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 84
    .local v2, bluetoothChat:Landroid/content/Intent;
    iget-object v6, p0, Lcom/SixClawWorm/application/MenuActivity$4;->this$0:Lcom/SixClawWorm/application/MenuActivity;

    invoke-virtual {v6, v2}, Lcom/SixClawWorm/application/MenuActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
