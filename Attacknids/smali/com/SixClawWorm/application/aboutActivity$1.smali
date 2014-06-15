.class Lcom/SixClawWorm/application/aboutActivity$1;
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
    iput-object p1, p0, Lcom/SixClawWorm/application/aboutActivity$1;->this$0:Lcom/SixClawWorm/application/aboutActivity;

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 33
    iget-object v0, p0, Lcom/SixClawWorm/application/aboutActivity$1;->this$0:Lcom/SixClawWorm/application/aboutActivity;

    invoke-virtual {v0}, Lcom/SixClawWorm/application/aboutActivity;->finish()V

    .line 34
    return-void
.end method
