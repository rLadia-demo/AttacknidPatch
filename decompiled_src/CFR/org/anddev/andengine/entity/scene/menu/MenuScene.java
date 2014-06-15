/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.menu;

import java.util.ArrayList;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.CameraScene;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.scene.menu.animator.IMenuAnimator;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.input.touch.TouchEvent;

public class MenuScene
extends CameraScene
implements Scene.IOnAreaTouchListener,
Scene.IOnSceneTouchListener {
    private IMenuAnimator mMenuAnimator = IMenuAnimator.DEFAULT;
    private final ArrayList<IMenuItem> mMenuItems = new ArrayList<IMenuItem>();
    private IOnMenuItemClickListener mOnMenuItemClickListener;
    private IMenuItem mSelectedMenuItem;

    public MenuScene() {
        this(null, null);
    }

    public MenuScene(Camera camera) {
        this(camera, null);
    }

    public MenuScene(Camera camera, IOnMenuItemClickListener iOnMenuItemClickListener) {
        super(1, camera);
        this.mOnMenuItemClickListener = iOnMenuItemClickListener;
        this.setOnSceneTouchListener((Scene.IOnSceneTouchListener)this);
        this.setOnAreaTouchListener((Scene.IOnAreaTouchListener)this);
    }

    public MenuScene(IOnMenuItemClickListener iOnMenuItemClickListener) {
        this(null, iOnMenuItemClickListener);
    }

    public void addMenuItem(IMenuItem iMenuItem) {
        this.mMenuItems.add(iMenuItem);
        this.getBottomLayer().addEntity(iMenuItem);
        this.registerTouchArea((Scene.ITouchArea)iMenuItem);
    }

    @Override
    public void back() {
        super.back();
        this.reset();
    }

    public void buildAnimations() {
        this.prepareAnimations();
        float f = this.mCamera.getHeight();
        float f2 = this.mCamera.getWidth();
        this.mMenuAnimator.buildAnimations(this.mMenuItems, f2, f);
    }

    @Override
    public void clearChildScene() {
        if (this.getChildScene() == null) return;
        this.getChildScene().reset();
        super.clearChildScene();
    }

    public void closeMenuScene() {
        this.back();
    }

    @Override
    public MenuScene getChildScene() {
        return (MenuScene)super.getChildScene();
    }

    public int getMenuItemCount() {
        return this.mMenuItems.size();
    }

    public IOnMenuItemClickListener getOnMenuItemClickListener() {
        return this.mOnMenuItemClickListener;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public boolean onAreaTouched(TouchEvent touchEvent, Scene.ITouchArea iTouchArea, float f, float f2) {
        IMenuItem iMenuItem = (IMenuItem)iTouchArea;
        switch (touchEvent.getAction()) {
            default: {
                return true;
            }
            case 0: 
            case 2: {
                if (this.mSelectedMenuItem != null && this.mSelectedMenuItem != iMenuItem) {
                    this.mSelectedMenuItem.onUnselected();
                }
                this.mSelectedMenuItem = iMenuItem;
                this.mSelectedMenuItem.onSelected();
                return true;
            }
            case 1: {
                if (this.mOnMenuItemClickListener == null) return true;
                boolean bl = this.mOnMenuItemClickListener.onMenuItemClicked(this, iMenuItem, f, f2);
                iMenuItem.onUnselected();
                this.mSelectedMenuItem = null;
                return bl;
            }
            case 3: {
                iMenuItem.onUnselected();
                this.mSelectedMenuItem = null;
            }
        }
        return true;
    }

    @Override
    public boolean onSceneTouchEvent(Scene scene2, TouchEvent scene2) {
        if (this.mSelectedMenuItem == null) return false;
        this.mSelectedMenuItem.onUnselected();
        this.mSelectedMenuItem = null;
        return false;
    }

    public void prepareAnimations() {
        float f = this.mCamera.getHeight();
        float f2 = this.mCamera.getWidth();
        this.mMenuAnimator.prepareAnimations(this.mMenuItems, f2, f);
    }

    @Override
    public void reset() {
        super.reset();
        ArrayList<IMenuItem> arrayList = this.mMenuItems;
        int n = -1 + arrayList.size();
        do {
            if (n < 0) {
                this.prepareAnimations();
                return;
            }
            arrayList.get(n).reset();
            --n;
        } while (true);
    }

    @Override
    public void setChildScene(Scene scene, boolean bl, boolean bl2, boolean bl3) throws IllegalArgumentException {
        if (!(scene instanceof MenuScene)) throw new IllegalArgumentException("MenuScene accepts only MenuScenes as a ChildScene.");
        super.setChildScene(scene, bl, bl2, bl3);
    }

    public void setMenuAnimator(IMenuAnimator iMenuAnimator) {
        this.mMenuAnimator = iMenuAnimator;
    }

    public void setOnMenuItemClickListener(IOnMenuItemClickListener iOnMenuItemClickListener) {
        this.mOnMenuItemClickListener = iOnMenuItemClickListener;
    }

    public interface IOnMenuItemClickListener {
        public boolean onMenuItemClicked(MenuScene var1, IMenuItem var2, float var3, float var4);
    }

}

