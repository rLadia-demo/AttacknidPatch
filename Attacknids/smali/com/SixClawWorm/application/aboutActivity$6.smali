.class Lcom/SixClawWorm/application/aboutActivity$6;
.super Ljava/lang/Object;
.source "aboutActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/application/aboutActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/SixClawWorm/application/aboutActivity;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/application/aboutActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/application/aboutActivity$6;->this$0:Lcom/SixClawWorm/application/aboutActivity;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 82
    const-string v1, "http://www.YouTube.com/WowStuffOnline"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 83
    .local v0, uri:Landroid/net/Uri;
    iget-object v1, p0, Lcom/SixClawWorm/application/aboutActivity$6;->this$0:Lcom/SixClawWorm/application/aboutActivity;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2}, Lcom/SixClawWorm/application/aboutActivity;->startActivity(Landroid/content/Intent;)V

    .line 85
    return-void
.end method
