.class public Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;
.super Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;
.source "ScaleMenuItemDecorator.java"


# instance fields
.field private final mSelectedScale:F

.field private final mUnselectedScale:F


# direct methods
.method public constructor <init>(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;FF)V
    .locals 0
    .parameter "pMenuItem"
    .parameter "pSelectedScale"
    .parameter "pUnselectedScale"

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/menu/item/decorator/BaseMenuItemDecorator;-><init>(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V

    .line 28
    iput p2, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;->mSelectedScale:F

    .line 29
    iput p3, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;->mUnselectedScale:F

    .line 31
    invoke-interface {p1, p3}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setScale(F)V

    .line 32
    return-void
.end method


# virtual methods
.method public onMenuItemReset(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V
    .locals 1
    .parameter "pMenuItem"

    .prologue
    .line 58
    iget v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;->mUnselectedScale:F

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;->setScale(F)V

    .line 59
    return-void
.end method

.method public onMenuItemSelected(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V
    .locals 1
    .parameter "pMenuItem"

    .prologue
    .line 48
    iget v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;->mSelectedScale:F

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;->setScale(F)V

    .line 49
    return-void
.end method

.method public onMenuItemUnselected(Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;)V
    .locals 1
    .parameter "pMenuItem"

    .prologue
    .line 53
    iget v0, p0, Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;->mUnselectedScale:F

    invoke-virtual {p0, v0}, Lorg/anddev/andengine/entity/scene/menu/item/decorator/ScaleMenuItemDecorator;->setScale(F)V

    .line 54
    return-void
.end method
