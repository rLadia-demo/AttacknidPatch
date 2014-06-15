package org.anddev.andengine.entity.scene.menu;

import java.util.ArrayList;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.CameraScene;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.scene.Scene.IOnAreaTouchListener;
import org.anddev.andengine.entity.scene.Scene.IOnSceneTouchListener;
import org.anddev.andengine.entity.scene.Scene.ITouchArea;
import org.anddev.andengine.entity.scene.menu.animator.IMenuAnimator;
import org.anddev.andengine.entity.scene.menu.item.IMenuItem;
import org.anddev.andengine.input.touch.TouchEvent;

public class MenuScene
  extends CameraScene
  implements Scene.IOnAreaTouchListener, Scene.IOnSceneTouchListener
{
  private IMenuAnimator mMenuAnimator = IMenuAnimator.DEFAULT;
  private final ArrayList<IMenuItem> mMenuItems = new ArrayList();
  private IOnMenuItemClickListener mOnMenuItemClickListener;
  private IMenuItem mSelectedMenuItem;
  
  public MenuScene()
  {
    this(null, null);
  }
  
  public MenuScene(Camera paramCamera)
  {
    this(paramCamera, null);
  }
  
  public MenuScene(Camera paramCamera, IOnMenuItemClickListener paramIOnMenuItemClickListener)
  {
    super(1, paramCamera);
    this.mOnMenuItemClickListener = paramIOnMenuItemClickListener;
    setOnSceneTouchListener(this);
    setOnAreaTouchListener(this);
  }
  
  public MenuScene(IOnMenuItemClickListener paramIOnMenuItemClickListener)
  {
    this(null, paramIOnMenuItemClickListener);
  }
  
  public void addMenuItem(IMenuItem paramIMenuItem)
  {
    this.mMenuItems.add(paramIMenuItem);
    getBottomLayer().addEntity(paramIMenuItem);
    registerTouchArea(paramIMenuItem);
  }
  
  public void back()
  {
    super.back();
    reset();
  }
  
  public void buildAnimations()
  {
    prepareAnimations();
    float f1 = this.mCamera.getHeight();
    float f2 = this.mCamera.getWidth();
    this.mMenuAnimator.buildAnimations(this.mMenuItems, f2, f1);
  }
  
  public void clearChildScene()
  {
    if (getChildScene() != null)
    {
      getChildScene().reset();
      super.clearChildScene();
    }
  }
  
  public void closeMenuScene()
  {
    back();
  }
  
  public MenuScene getChildScene()
  {
    return (MenuScene)super.getChildScene();
  }
  
  public int getMenuItemCount()
  {
    return this.mMenuItems.size();
  }
  
  public IOnMenuItemClickListener getOnMenuItemClickListener()
  {
    return this.mOnMenuItemClickListener;
  }
  
  public boolean onAreaTouched(TouchEvent paramTouchEvent, Scene.ITouchArea paramITouchArea, float paramFloat1, float paramFloat2)
  {
    IMenuItem localIMenuItem = (IMenuItem)paramITouchArea;
    switch (paramTouchEvent.getAction())
    {
    }
    for (;;)
    {
      return true;
      if ((this.mSelectedMenuItem != null) && (this.mSelectedMenuItem != localIMenuItem)) {
        this.mSelectedMenuItem.onUnselected();
      }
      this.mSelectedMenuItem = localIMenuItem;
      this.mSelectedMenuItem.onSelected();
      continue;
      if (this.mOnMenuItemClickListener != null)
      {
        boolean bool = this.mOnMenuItemClickListener.onMenuItemClicked(this, localIMenuItem, paramFloat1, paramFloat2);
        localIMenuItem.onUnselected();
        this.mSelectedMenuItem = null;
        return bool;
        localIMenuItem.onUnselected();
        this.mSelectedMenuItem = null;
      }
    }
  }
  
  public boolean onSceneTouchEvent(Scene paramScene, TouchEvent paramTouchEvent)
  {
    if (this.mSelectedMenuItem != null)
    {
      this.mSelectedMenuItem.onUnselected();
      this.mSelectedMenuItem = null;
    }
    return false;
  }
  
  public void prepareAnimations()
  {
    float f1 = this.mCamera.getHeight();
    float f2 = this.mCamera.getWidth();
    this.mMenuAnimator.prepareAnimations(this.mMenuItems, f2, f1);
  }
  
  public void reset()
  {
    super.reset();
    ArrayList localArrayList = this.mMenuItems;
    for (int i = -1 + localArrayList.size();; i--)
    {
      if (i < 0)
      {
        prepareAnimations();
        return;
      }
      ((IMenuItem)localArrayList.get(i)).reset();
    }
  }
  
  public void setChildScene(Scene paramScene, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    throws IllegalArgumentException
  {
    if ((paramScene instanceof MenuScene))
    {
      super.setChildScene(paramScene, paramBoolean1, paramBoolean2, paramBoolean3);
      return;
    }
    throw new IllegalArgumentException("MenuScene accepts only MenuScenes as a ChildScene.");
  }
  
  public void setMenuAnimator(IMenuAnimator paramIMenuAnimator)
  {
    this.mMenuAnimator = paramIMenuAnimator;
  }
  
  public void setOnMenuItemClickListener(IOnMenuItemClickListener paramIOnMenuItemClickListener)
  {
    this.mOnMenuItemClickListener = paramIOnMenuItemClickListener;
  }
  
  public static abstract interface IOnMenuItemClickListener
  {
    public abstract boolean onMenuItemClicked(MenuScene paramMenuScene, IMenuItem paramIMenuItem, float paramFloat1, float paramFloat2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.menu.MenuScene
 * JD-Core Version:    0.7.0.1
 */