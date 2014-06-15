.class Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$1;
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

.field private final synthetic val$etInput:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$1;->this$0:Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;

    iput-object p2, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$1;->val$etInput:Landroid/widget/EditText;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "pDialog"
    .parameter "pWhich"

    .prologue
    .line 92
    :try_start_0
    iget-object v2, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$1;->this$0:Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;

    iget-object v3, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$1;->val$etInput:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;->generateResult(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 98
    .local v1, result:Ljava/lang/Object;,"TT;"
    iget-object v2, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$1;->this$0:Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;

    iget-object v2, v2, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;->mSuccessCallback:Lorg/anddev/andengine/util/Callback;

    invoke-interface {v2, v1}, Lorg/anddev/andengine/util/Callback;->onCallback(Ljava/lang/Object;)V

    .line 99
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 100
    .end local v1           #result:Ljava/lang/Object;,"TT;"
    :goto_0
    return-void

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const-string v2, "Error in GenericInputDialogBuilder.generateResult()"

    invoke-static {v2, v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 95
    iget-object v2, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$1;->this$0:Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;

    iget-object v2, v2, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder$1;->this$0:Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;

    #getter for: Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;->mErrorResID:I
    invoke-static {v3}, Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;->access$0(Lorg/anddev/andengine/ui/dialog/GenericInputDialogBuilder;)I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
