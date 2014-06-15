.class public Lorg/anddev/andengine/entity/scene/menu/MenuScene;
.super Lorg/anddev/andengine/entity/scene/CameraScene;
.source "MenuScene.java"

# interfaces
.implements Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;
.implements Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;
    }
.end annotation


# instance fields
.field private mMenuAnimator:Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;

.field private final mMenuItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private mOnMenuItemClickListener:Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;

.field private mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0, v0, v0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 1
    .parameter "pCamera"

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;)V
    .locals 1
    .parameter "pCamera"
    .parameter "pOnMenuItemClickListener"

    .prologue
    .line 54
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/entity/scene/CameraScene;-><init>(ILorg/anddev/andengine/engine/camera/Camera;)V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuItems:Ljava/util/ArrayList;

    .line 33
    sget-object v0, Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;->DEFAULT:Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuAnimator:Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;

    .line 55
    iput-object p2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mOnMenuItemClickListener:Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;

    .line 56
    invoke-virtual {p0, p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->setOnSceneTouchListener(Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;)V

    .line 57
    invoke-virtual {p0, p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->setOnAreaTouchListener(Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;)V
    .locals 1
    .parameter "pOnMenuItemClickListener"

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;-><init>(Lorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;)V

    .line 47
    return-void
.end method


# virtual methods
.method public addMenuItem(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V
    .locals 1
    .parameter "pMenuItem"

    .prologue
    .line 77
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->getBottomLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 79
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->registerTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V

    .line 80
    return-void
.end method

.method public back()V
    .locals 0

    .prologue
    .line 152
    invoke-super {p0}, Lorg/anddev/andengine/entity/scene/CameraScene;->back()V

    .line 154
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->reset()V

    .line 155
    return-void
.end method

.method public buildAnimations()V
    .locals 4

    .prologue
    .line 178
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->prepareAnimations()V

    .line 180
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v2}, Lorg/anddev/andengine/engine/camera/Camera;->getHeight()F

    move-result v0

    .line 181
    .local v0, cameraHeight:F
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v2}, Lorg/anddev/andengine/engine/camera/Camera;->getWidth()F

    move-result v1

    .line 182
    .local v1, cameraWidth:F
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuAnimator:Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;

    iget-object v3, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuItems:Ljava/util/ArrayList;

    invoke-interface {v2, v3, v1, v0}, Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;->buildAnimations(Ljava/util/ArrayList;FF)V

    .line 183
    return-void
.end method

.method public clearChildScene()V
    .locals 1

    .prologue
    .line 98
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->getChildScene()Lorg/anddev/andengine/entity/scene/menu/MenuScene;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->getChildScene()Lorg/anddev/andengine/entity/scene/menu/MenuScene;

    move-result-object v0

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->reset()V

    .line 100
    invoke-super {p0}, Lorg/anddev/andengine/entity/scene/CameraScene;->clearChildScene()V

    .line 102
    :cond_0
    return-void
.end method

.method public closeMenuScene()V
    .locals 0

    .prologue
    .line 174
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->back()V

    .line 175
    return-void
.end method

.method public bridge synthetic getChildScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->getChildScene()Lorg/anddev/andengine/entity/scene/menu/MenuScene;

    move-result-object v0

    return-object v0
.end method

.method public getChildScene()Lorg/anddev/andengine/entity/scene/menu/MenuScene;
    .locals 1

    .prologue
    .line 84
    invoke-super {p0}, Lorg/anddev/andengine/entity/scene/CameraScene;->getChildScene()Lorg/anddev/andengine/entity/scene/Scene;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;

    return-object v0
.end method

.method public getMenuItemCount()I
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getOnMenuItemClickListener()Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mOnMenuItemClickListener:Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;

    return-object v0
.end method

.method public onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;FF)Z
    .locals 4
    .parameter "pSceneTouchEvent"
    .parameter "pTouchArea"
    .parameter "pTouchAreaLocalX"
    .parameter "pTouchAreaLocalY"

    .prologue
    const/4 v3, 0x0

    .line 114
    move-object v1, p2

    check-cast v1, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    .line 116
    .local v1, menuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;
    invoke-virtual {p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 138
    :cond_0
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 119
    :pswitch_0
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    if-eq v2, v1, :cond_1

    .line 120
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onUnselected()V

    .line 122
    :cond_1
    iput-object v1, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    .line 123
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onSelected()V

    goto :goto_0

    .line 126
    :pswitch_1
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mOnMenuItemClickListener:Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;

    if-eqz v2, :cond_0

    .line 127
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mOnMenuItemClickListener:Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;

    invoke-interface {v2, p0, v1, p3, p4}, Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;->onMenuItemClicked(Lorg/anddev/andengine/entity/scene/menu/MenuScene;Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;FF)Z

    move-result v0

    .line 128
    .local v0, handled:Z
    invoke-interface {v1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onUnselected()V

    .line 129
    iput-object v3, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    goto :goto_1

    .line 134
    .end local v0           #handled:Z
    :pswitch_2
    invoke-interface {v1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onUnselected()V

    .line 135
    iput-object v3, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    goto :goto_0

    .line 116
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onSceneTouchEvent(Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 1
    .parameter "pScene"
    .parameter "pSceneTouchEvent"

    .prologue
    .line 143
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->onUnselected()V

    .line 145
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mSelectedMenuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    .line 147
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public prepareAnimations()V
    .locals 4

    .prologue
    .line 186
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v2}, Lorg/anddev/andengine/engine/camera/Camera;->getHeight()F

    move-result v0

    .line 187
    .local v0, cameraHeight:F
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-virtual {v2}, Lorg/anddev/andengine/engine/camera/Camera;->getWidth()F

    move-result v1

    .line 188
    .local v1, cameraWidth:F
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuAnimator:Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;

    iget-object v3, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuItems:Ljava/util/ArrayList;

    invoke-interface {v2, v3, v1, v0}, Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;->prepareAnimations(Ljava/util/ArrayList;FF)V

    .line 189
    return-void
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 159
    invoke-super {p0}, Lorg/anddev/andengine/entity/scene/CameraScene;->reset()V

    .line 161
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuItems:Ljava/util/ArrayList;

    .line 162
    .local v1, menuItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 166
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->prepareAnimations()V

    .line 167
    return-void

    .line 163
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->reset()V

    .line 162
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public setChildScene(Lorg/anddev/andengine/entity/scene/Scene;ZZZ)V
    .locals 2
    .parameter "pChildScene"
    .parameter "pModalDraw"
    .parameter "pModalUpdate"
    .parameter "pModalTouch"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 89
    instance-of v0, p1, Lorg/anddev/andengine/entity/scene/menu/MenuScene;

    if-eqz v0, :cond_0

    .line 90
    invoke-super {p0, p1, p2, p3, p4}, Lorg/anddev/andengine/entity/scene/CameraScene;->setChildScene(Lorg/anddev/andengine/entity/scene/Scene;ZZZ)V

    .line 94
    return-void

    .line 92
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MenuScene accepts only MenuScenes as a ChildScene."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMenuAnimator(Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;)V
    .locals 0
    .parameter "pMenuAnimator"

    .prologue
    .line 105
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mMenuAnimator:Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;

    .line 106
    return-void
.end method

.method public setOnMenuItemClickListener(Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;)V
    .locals 0
    .parameter "pOnMenuItemClickListener"

    .prologue
    .line 69
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/menu/MenuScene;->mOnMenuItemClickListener:Lorg/anddev/andengine/entity/scene/menu/MenuScene$IOnMenuItemClickListener;

    .line 70
    return-void
.end method
