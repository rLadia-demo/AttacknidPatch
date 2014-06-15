.class Lcom/SixClawWorm/application/DeviceListActivity$3;
.super Ljava/lang/Object;
.source "DeviceListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/application/DeviceListActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/DeviceListActivity;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/DeviceListActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/DeviceListActivity$3;->this$0:Lcom/SixClawWorm/application/DeviceListActivity;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/SixClawWorm/application/DeviceListActivity$3;->this$0:Lcom/SixClawWorm/application/DeviceListActivity;

    #calls: Lcom/SixClawWorm/application/DeviceListActivity;->doDiscovery()V
    invoke-static {v0}, Lcom/SixClawWorm/application/DeviceListActivity;->access$2(Lcom/SixClawWorm/application/DeviceListActivity;)V

    .line 44
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 45
    return-void
.end method
