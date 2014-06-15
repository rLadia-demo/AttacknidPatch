.class Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$2;
.super Ljava/lang/Object;
.source "GenericInputDialogBuilder.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;->create()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$2;->this$0:Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "pDialog"
    .parameter "pWhich"

    .prologue
    .line 105
    iget-object v0, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$2;->this$0:Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;

    iget-object v0, v0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    .line 106
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 107
    return-void
.end method
