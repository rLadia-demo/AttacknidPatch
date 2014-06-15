package org.anddev.andengine.entity.scene;

import android.util.SparseArray;
import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.UpdateHandlerList;
import org.anddev.andengine.engine.handler.runnable.RunnableHandler;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.entity.layer.DynamicCapacityLayer;
import org.anddev.andengine.entity.layer.FixedCapacityLayer;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.layer.ZIndexSorter;
import org.anddev.andengine.entity.scene.background.ColorBackground;
import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.opengl.util.GLHelper;

public class Scene
  extends Entity
{
  private IBackground mBackground = new ColorBackground(0.0F, 0.0F, 0.0F);
  private boolean mBackgroundEnabled = true;
  protected Scene mChildScene;
  private boolean mChildSceneModalDraw;
  private boolean mChildSceneModalTouch;
  private boolean mChildSceneModalUpdate;
  private final int mLayerCount;
  private final ILayer[] mLayers;
  private IOnAreaTouchListener mOnAreaTouchListener;
  private boolean mOnAreaTouchTraversalBackToFront = true;
  private IOnSceneTouchListener mOnSceneTouchListener;
  protected Scene mParentScene;
  private final RunnableHandler mRunnableHandler = new RunnableHandler();
  private float mSecondsElapsedTotal;
  private boolean mTouchAreaBindingEnabled = false;
  private final SparseArray<ITouchArea> mTouchAreaBindings = new SparseArray();
  private final ArrayList<ITouchArea> mTouchAreas = new ArrayList();
  private final UpdateHandlerList mUpdateHandlers = new UpdateHandlerList();
  
  public Scene(int paramInt)
  {
    this.mLayerCount = paramInt;
    this.mLayers = new ILayer[paramInt];
    createLayers();
  }
  
  public Scene(int paramInt, boolean paramBoolean, int... paramVarArgs)
    throws IllegalArgumentException
  {
    if (paramInt != paramVarArgs.length) {
      throw new IllegalArgumentException("pLayerCount must be the same as the length of pLayerCapacities.");
    }
    this.mLayerCount = paramInt;
    this.mLayers = new ILayer[paramInt];
    createLayers(paramBoolean, paramVarArgs);
  }
  
  private void createLayers()
  {
    ILayer[] arrayOfILayer = this.mLayers;
    for (int i = -1 + this.mLayerCount;; i--)
    {
      if (i < 0) {
        return;
      }
      arrayOfILayer[i] = new DynamicCapacityLayer();
    }
  }
  
  private void createLayers(boolean paramBoolean, int[] paramArrayOfInt)
  {
    ILayer[] arrayOfILayer = this.mLayers;
    int j;
    if (paramBoolean)
    {
      j = -1 + this.mLayerCount;
      if (j >= 0) {}
    }
    for (;;)
    {
      return;
      arrayOfILayer[j] = new FixedCapacityLayer(paramArrayOfInt[j]);
      j--;
      break;
      for (int i = -1 + this.mLayerCount; i >= 0; i--) {
        arrayOfILayer[i] = new DynamicCapacityLayer(paramArrayOfInt[i]);
      }
    }
  }
  
  private void drawLayers(GL10 paramGL10, Camera paramCamera)
  {
    ILayer[] arrayOfILayer = this.mLayers;
    int i = this.mLayerCount;
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      arrayOfILayer[j].onDraw(paramGL10, paramCamera);
    }
  }
  
  private Boolean onAreaTouchEvent(TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2, ITouchArea paramITouchArea)
  {
    float[] arrayOfFloat = paramITouchArea.convertSceneToLocalCoordinates(paramFloat1, paramFloat2);
    float f1 = arrayOfFloat[0];
    float f2 = arrayOfFloat[1];
    if (paramITouchArea.onAreaTouched(paramTouchEvent, f1, f2)) {
      return Boolean.TRUE;
    }
    if (this.mOnAreaTouchListener != null) {
      return Boolean.valueOf(this.mOnAreaTouchListener.onAreaTouched(paramTouchEvent, paramITouchArea, f1, f2));
    }
    return null;
  }
  
  private void setParentScene(Scene paramScene)
  {
    this.mParentScene = paramScene;
  }
  
  private void updateLayers(float paramFloat)
  {
    ILayer[] arrayOfILayer = this.mLayers;
    int i = this.mLayerCount;
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      arrayOfILayer[j].onUpdate(paramFloat);
    }
  }
  
  private void updateUpdateHandlers(float paramFloat)
  {
    if ((this.mChildScene == null) || (!this.mChildSceneModalUpdate)) {
      this.mUpdateHandlers.onUpdate(paramFloat);
    }
    if (this.mChildScene != null) {
      this.mChildScene.updateUpdateHandlers(paramFloat);
    }
  }
  
  public void back()
  {
    clearChildScene();
    if (this.mParentScene != null)
    {
      this.mParentScene.clearChildScene();
      this.mParentScene = null;
    }
  }
  
  public void clearChildScene()
  {
    this.mChildScene = null;
  }
  
  public void clearTouchAreas()
  {
    this.mTouchAreas.clear();
  }
  
  public void clearUpdateHandlers()
  {
    this.mUpdateHandlers.clear();
  }
  
  public IBackground getBackground()
  {
    return this.mBackground;
  }
  
  public ILayer getBottomLayer()
  {
    return this.mLayers[0];
  }
  
  public Scene getChildScene()
  {
    return this.mChildScene;
  }
  
  public ILayer getLayer(int paramInt)
    throws ArrayIndexOutOfBoundsException
  {
    return this.mLayers[paramInt];
  }
  
  public int getLayerCount()
  {
    return this.mLayers.length;
  }
  
  public IOnAreaTouchListener getOnAreaTouchListener()
  {
    return this.mOnAreaTouchListener;
  }
  
  public IOnSceneTouchListener getOnSceneTouchListener()
  {
    return this.mOnSceneTouchListener;
  }
  
  public float getSecondsElapsedTotal()
  {
    return this.mSecondsElapsedTotal;
  }
  
  public ILayer getTopLayer()
  {
    return this.mLayers[(-1 + this.mLayerCount)];
  }
  
  public boolean hasChildScene()
  {
    return this.mChildScene != null;
  }
  
  public boolean hasOnAreaTouchListener()
  {
    return this.mOnAreaTouchListener != null;
  }
  
  public boolean hasOnSceneTouchListener()
  {
    return this.mOnSceneTouchListener != null;
  }
  
  public boolean isBackgroundEnabled()
  {
    return this.mBackgroundEnabled;
  }
  
  public boolean isTouchAreaBindingEnabled()
  {
    return this.mTouchAreaBindingEnabled;
  }
  
  protected boolean onChildSceneTouchEvent(TouchEvent paramTouchEvent)
  {
    return this.mChildScene.onSceneTouchEvent(paramTouchEvent);
  }
  
  protected void onManagedDraw(GL10 paramGL10, Camera paramCamera)
  {
    Scene localScene = this.mChildScene;
    if ((localScene == null) || (!this.mChildSceneModalDraw))
    {
      if (this.mBackgroundEnabled)
      {
        paramCamera.onApplyPositionIndependentMatrix(paramGL10);
        GLHelper.setModelViewIdentityMatrix(paramGL10);
        this.mBackground.onDraw(paramGL10, paramCamera);
      }
      paramCamera.onApplyMatrix(paramGL10);
      GLHelper.setModelViewIdentityMatrix(paramGL10);
      drawLayers(paramGL10, paramCamera);
    }
    if (localScene != null) {
      localScene.onDraw(paramGL10, paramCamera);
    }
  }
  
  protected void onManagedUpdate(float paramFloat)
  {
    updateUpdateHandlers(paramFloat);
    this.mRunnableHandler.onUpdate(paramFloat);
    this.mSecondsElapsedTotal = (paramFloat + this.mSecondsElapsedTotal);
    Scene localScene = this.mChildScene;
    if ((localScene == null) || (!this.mChildSceneModalUpdate))
    {
      this.mBackground.onUpdate(paramFloat);
      updateLayers(paramFloat);
    }
    if (localScene != null) {
      localScene.onUpdate(paramFloat);
    }
  }
  
  public boolean onSceneTouchEvent(TouchEvent paramTouchEvent)
  {
    int i = paramTouchEvent.getAction();
    int j;
    SparseArray localSparseArray;
    ITouchArea localITouchArea5;
    float f3;
    float f4;
    if (i == 0)
    {
      j = 1;
      if ((!this.mTouchAreaBindingEnabled) || (j != 0)) {
        break label133;
      }
      localSparseArray = this.mTouchAreaBindings;
      localITouchArea5 = (ITouchArea)localSparseArray.get(paramTouchEvent.getPointerID());
      if (localITouchArea5 == null) {
        break label133;
      }
      f3 = paramTouchEvent.getX();
      f4 = paramTouchEvent.getY();
      switch (i)
      {
      }
    }
    for (;;)
    {
      Boolean localBoolean5 = onAreaTouchEvent(paramTouchEvent, f3, f4, localITouchArea5);
      if ((localBoolean5 == null) || (!localBoolean5.booleanValue())) {
        break label133;
      }
      return true;
      j = 0;
      break;
      localSparseArray.remove(paramTouchEvent.getPointerID());
    }
    label133:
    if (this.mChildScene != null)
    {
      if (onChildSceneTouchEvent(paramTouchEvent)) {
        return true;
      }
      if (this.mChildSceneModalTouch) {
        return false;
      }
    }
    float f1 = paramTouchEvent.getX();
    float f2 = paramTouchEvent.getY();
    int k = this.mLayerCount;
    ILayer[] arrayOfILayer = this.mLayers;
    int i5;
    ArrayList localArrayList2;
    int i2;
    int i4;
    if (this.mOnAreaTouchTraversalBackToFront)
    {
      i5 = 0;
      if (i5 >= k)
      {
        localArrayList2 = this.mTouchAreas;
        i2 = localArrayList2.size();
        if (i2 > 0)
        {
          if (!this.mOnAreaTouchTraversalBackToFront) {
            break label598;
          }
          i4 = 0;
          label228:
          if (i4 < i2) {
            break label514;
          }
        }
      }
    }
    for (;;)
    {
      if (this.mOnSceneTouchListener == null) {
        break label693;
      }
      return this.mOnSceneTouchListener.onSceneTouchEvent(this, paramTouchEvent);
      ArrayList localArrayList3 = arrayOfILayer[i5].getTouchAreas();
      int i6 = localArrayList3.size();
      if (i6 > 0) {}
      for (int i7 = 0;; i7++)
      {
        if (i7 >= i6)
        {
          i5++;
          break;
        }
        ITouchArea localITouchArea4 = (ITouchArea)localArrayList3.get(i7);
        if (localITouchArea4.contains(f1, f2))
        {
          Boolean localBoolean4 = onAreaTouchEvent(paramTouchEvent, f1, f2, localITouchArea4);
          if ((localBoolean4 != null) && (localBoolean4.booleanValue()))
          {
            if ((this.mTouchAreaBindingEnabled) && (j != 0)) {
              this.mTouchAreaBindings.put(paramTouchEvent.getPointerID(), localITouchArea4);
            }
            return true;
          }
        }
      }
      int m = k - 1;
      label384:
      ArrayList localArrayList1;
      int n;
      if (m >= 0)
      {
        localArrayList1 = arrayOfILayer[m].getTouchAreas();
        n = localArrayList1.size();
        if (n <= 0) {}
      }
      for (int i1 = n - 1;; i1--)
      {
        if (i1 < 0)
        {
          m--;
          break label384;
          break;
        }
        ITouchArea localITouchArea1 = (ITouchArea)localArrayList1.get(i1);
        if (localITouchArea1.contains(f1, f2))
        {
          Boolean localBoolean1 = onAreaTouchEvent(paramTouchEvent, f1, f2, localITouchArea1);
          if ((localBoolean1 != null) && (localBoolean1.booleanValue()))
          {
            if ((this.mTouchAreaBindingEnabled) && (j != 0)) {
              this.mTouchAreaBindings.put(paramTouchEvent.getPointerID(), localITouchArea1);
            }
            return true;
          }
        }
      }
      label514:
      ITouchArea localITouchArea3 = (ITouchArea)localArrayList2.get(i4);
      if (localITouchArea3.contains(f1, f2))
      {
        Boolean localBoolean3 = onAreaTouchEvent(paramTouchEvent, f1, f2, localITouchArea3);
        if ((localBoolean3 != null) && (localBoolean3.booleanValue()))
        {
          if ((this.mTouchAreaBindingEnabled) && (j != 0)) {
            this.mTouchAreaBindings.put(paramTouchEvent.getPointerID(), localITouchArea3);
          }
          return true;
        }
      }
      i4++;
      break label228;
      label598:
      for (int i3 = i2 - 1; i3 >= 0; i3--)
      {
        ITouchArea localITouchArea2 = (ITouchArea)localArrayList2.get(i3);
        if (localITouchArea2.contains(f1, f2))
        {
          Boolean localBoolean2 = onAreaTouchEvent(paramTouchEvent, f1, f2, localITouchArea2);
          if ((localBoolean2 != null) && (localBoolean2.booleanValue()))
          {
            if ((this.mTouchAreaBindingEnabled) && (j != 0)) {
              this.mTouchAreaBindings.put(paramTouchEvent.getPointerID(), localITouchArea2);
            }
            return true;
          }
        }
      }
    }
    label693:
    return false;
  }
  
  public void postRunnable(Runnable paramRunnable)
  {
    this.mRunnableHandler.postRunnable(paramRunnable);
  }
  
  public void registerTouchArea(ITouchArea paramITouchArea)
  {
    this.mTouchAreas.add(paramITouchArea);
  }
  
  public void registerUpdateHandler(IUpdateHandler paramIUpdateHandler)
  {
    this.mUpdateHandlers.add(paramIUpdateHandler);
  }
  
  public ILayer replaceLayer(int paramInt, ILayer paramILayer)
  {
    ILayer[] arrayOfILayer = this.mLayers;
    ILayer localILayer = arrayOfILayer[paramInt];
    arrayOfILayer[paramInt] = paramILayer;
    return localILayer;
  }
  
  public void reset()
  {
    super.reset();
    clearChildScene();
    ILayer[] arrayOfILayer = this.mLayers;
    for (int i = -1 + this.mLayerCount;; i--)
    {
      if (i < 0) {
        return;
      }
      arrayOfILayer[i].reset();
    }
  }
  
  public void setBackground(IBackground paramIBackground)
  {
    this.mBackground = paramIBackground;
  }
  
  public void setBackgroundEnabled(boolean paramBoolean)
  {
    this.mBackgroundEnabled = paramBoolean;
  }
  
  public void setChildScene(Scene paramScene)
  {
    setChildScene(paramScene, false, false, false);
  }
  
  public void setChildScene(Scene paramScene, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
  {
    paramScene.setParentScene(this);
    this.mChildScene = paramScene;
    this.mChildSceneModalDraw = paramBoolean1;
    this.mChildSceneModalUpdate = paramBoolean2;
    this.mChildSceneModalTouch = paramBoolean3;
  }
  
  public void setChildSceneModal(Scene paramScene)
  {
    setChildScene(paramScene, true, true, true);
  }
  
  public void setLayer(int paramInt, ILayer paramILayer)
  {
    this.mLayers[paramInt] = paramILayer;
  }
  
  public void setOnAreaTouchListener(IOnAreaTouchListener paramIOnAreaTouchListener)
  {
    this.mOnAreaTouchListener = paramIOnAreaTouchListener;
  }
  
  public void setOnAreaTouchTraversalBackToFront()
  {
    this.mOnAreaTouchTraversalBackToFront = true;
  }
  
  public void setOnAreaTouchTraversalFrontToBack()
  {
    this.mOnAreaTouchTraversalBackToFront = false;
  }
  
  public void setOnSceneTouchListener(IOnSceneTouchListener paramIOnSceneTouchListener)
  {
    this.mOnSceneTouchListener = paramIOnSceneTouchListener;
  }
  
  public void setTouchAreaBindingEnabled(boolean paramBoolean)
  {
    this.mTouchAreaBindingEnabled = paramBoolean;
    if (!this.mTouchAreaBindingEnabled) {
      this.mTouchAreaBindings.clear();
    }
  }
  
  public void sortLayers()
  {
    ZIndexSorter.getInstance().sort(this.mLayers);
  }
  
  public void swapLayers(int paramInt1, int paramInt2)
  {
    ILayer[] arrayOfILayer = this.mLayers;
    ILayer localILayer = arrayOfILayer[paramInt1];
    arrayOfILayer[paramInt1] = arrayOfILayer[paramInt2];
    arrayOfILayer[paramInt2] = localILayer;
  }
  
  public void unregisterTouchArea(ITouchArea paramITouchArea)
  {
    this.mTouchAreas.remove(paramITouchArea);
  }
  
  public void unregisterUpdateHandler(IUpdateHandler paramIUpdateHandler)
  {
    this.mUpdateHandlers.remove(paramIUpdateHandler);
  }
  
  public static abstract interface IOnAreaTouchListener
  {
    public abstract boolean onAreaTouched(TouchEvent paramTouchEvent, Scene.ITouchArea paramITouchArea, float paramFloat1, float paramFloat2);
  }
  
  public static abstract interface IOnSceneTouchListener
  {
    public abstract boolean onSceneTouchEvent(Scene paramScene, TouchEvent paramTouchEvent);
  }
  
  public static abstract interface ITouchArea
  {
    public abstract boolean contains(float paramFloat1, float paramFloat2);
    
    public abstract float[] convertLocalToSceneCoordinates(float paramFloat1, float paramFloat2);
    
    public abstract float[] convertSceneToLocalCoordinates(float paramFloat1, float paramFloat2);
    
    public abstract boolean onAreaTouched(TouchEvent paramTouchEvent, float paramFloat1, float paramFloat2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.scene.Scene
 * JD-Core Version:    0.7.0.1
 */