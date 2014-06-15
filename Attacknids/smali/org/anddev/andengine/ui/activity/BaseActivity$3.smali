.class Lorg/anddev/andengine/ui/activity/BaseActivity$3;
.super Ljava/lang/Object;
.source "BaseActivity.java"

# interfaces
.implements Lorg/anddev/andengine/util/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/ui/activity/BaseActivity;->doAsync(IILorg/anddev/andengine/util/AsyncCallable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/anddev/andengine/util/Callback",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

.field private final synthetic val$pCallback:Lorg/anddev/andengine/util/Callback;

.field private final synthetic val$pd:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lorg/anddev/andengine/ui/activity/BaseActivity;Landroid/app/ProgressDialog;Lorg/anddev/andengine/util/Callback;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$3;->this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

    iput-object p2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$3;->val$pd:Landroid/app/ProgressDialog;

    iput-object p3, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$3;->val$pCallback:Lorg/anddev/andengine/util/Callback;

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallback(Ljava/lang/Object;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 228
    .local p1, result:Ljava/lang/Object;,"TT;"
    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$3;->val$pd:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 234
    :goto_0
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$3;->val$pCallback:Lorg/anddev/andengine/util/Callback;

    invoke-interface {v1, p1}, Lorg/anddev/andengine/util/Callback;->onCallback(Ljava/lang/Object;)V

    .line 235
    return-void

    .line 229
    :catch_0
    move-exception v0

    .line 230
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Error"

    invoke-static {v1, v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
