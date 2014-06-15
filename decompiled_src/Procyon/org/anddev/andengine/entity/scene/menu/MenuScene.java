package org.anddev.andengine.entity.scene.menu;

import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.entity.scene.menu.animator.*;
import java.util.*;
import org.anddev.andengine.entity.scene.menu.item.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.entity.*;
import org.anddev.andengine.input.touch.*;

public class MenuScene extends CameraScene implements IOnAreaTouchListener, IOnSceneTouchListener
{
    private IMenuAnimator mMenuAnimator;
    private final ArrayList<IMenuItem> mMenuItems;
    private IOnMenuItemClickListener mOnMenuItemClickListener;
    private IMenuItem mSelectedMenuItem;
    
    public MenuScene() {
        this(null, null);
    }
    
    public MenuScene(final Camera camera) {
        this(camera, null);
    }
    
    public MenuScene(final Camera camera, final IOnMenuItemClickListener mOnMenuItemClickListener) {
        super(1, camera);
        this.mMenuItems = new ArrayList<IMenuItem>();
        this.mMenuAnimator = IMenuAnimator.DEFAULT;
        this.mOnMenuItemClickListener = mOnMenuItemClickListener;
        this.setOnSceneTouchListener((IOnSceneTouchListener)this);
        this.setOnAreaTouchListener((IOnAreaTouchListener)this);
    }
    
    public MenuScene(final IOnMenuItemClickListener onMenuItemClickListener) {
        this(null, onMenuItemClickListener);
    }
    
    public void addMenuItem(final IMenuItem menuItem) {
        this.mMenuItems.add(menuItem);
        this.getBottomLayer().addEntity(menuItem);
        this.registerTouchArea((ITouchArea)menuItem);
    }
    
    @Override
    public void back() {
        super.back();
        this.reset();
    }
    
    public void buildAnimations() {
        this.prepareAnimations();
        this.mMenuAnimator.buildAnimations(this.mMenuItems, this.mCamera.getWidth(), this.mCamera.getHeight());
    }
    
    @Override
    public void clearChildScene() {
        if (this.getChildScene() != null) {
            this.getChildScene().reset();
            super.clearChildScene();
        }
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
    
    @Override
    public boolean onAreaTouched(final TouchEvent touchEvent, final ITouchArea touchArea, final float n, final float n2) {
        final IMenuItem mSelectedMenuItem = (IMenuItem)touchArea;
        switch (touchEvent.getAction()) {
            case 0:
            case 2: {
                if (this.mSelectedMenuItem != null && this.mSelectedMenuItem != mSelectedMenuItem) {
                    this.mSelectedMenuItem.onUnselected();
                }
                (this.mSelectedMenuItem = mSelectedMenuItem).onSelected();
                break;
            }
            case 1: {
                if (this.mOnMenuItemClickListener != null) {
                    final boolean onMenuItemClicked = this.mOnMenuItemClickListener.onMenuItemClicked(this, mSelectedMenuItem, n, n2);
                    mSelectedMenuItem.onUnselected();
                    this.mSelectedMenuItem = null;
                    return onMenuItemClicked;
                }
                break;
            }
            case 3: {
                mSelectedMenuItem.onUnselected();
                this.mSelectedMenuItem = null;
                break;
            }
        }
        return true;
    }
    
    @Override
    public boolean onSceneTouchEvent(final Scene scene, final TouchEvent touchEvent) {
        if (this.mSelectedMenuItem != null) {
            this.mSelectedMenuItem.onUnselected();
            this.mSelectedMenuItem = null;
        }
        return false;
    }
    
    public void prepareAnimations() {
        this.mMenuAnimator.prepareAnimations(this.mMenuItems, this.mCamera.getWidth(), this.mCamera.getHeight());
    }
    
    @Override
    public void reset() {
        super.reset();
        final ArrayList<IMenuItem> mMenuItems = this.mMenuItems;
        for (int i = -1 + mMenuItems.size(); i >= 0; --i) {
            mMenuItems.get(i).reset();
        }
        this.prepareAnimations();
    }
    
    @Override
    public void setChildScene(final Scene scene, final boolean b, final boolean b2, final boolean b3) throws IllegalArgumentException {
        if (scene instanceof MenuScene) {
            super.setChildScene(scene, b, b2, b3);
            return;
        }
        throw new IllegalArgumentException("MenuScene accepts only MenuScenes as a ChildScene.");
    }
    
    public void setMenuAnimator(final IMenuAnimator mMenuAnimator) {
        this.mMenuAnimator = mMenuAnimator;
    }
    
    public void setOnMenuItemClickListener(final IOnMenuItemClickListener mOnMenuItemClickListener) {
        this.mOnMenuItemClickListener = mOnMenuItemClickListener;
    }
    
    public interface IOnMenuItemClickListener
    {
        boolean onMenuItemClicked(MenuScene p0, IMenuItem p1, float p2, float p3);
    }
}
