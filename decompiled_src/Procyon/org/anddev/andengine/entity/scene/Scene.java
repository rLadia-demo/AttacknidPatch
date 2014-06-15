package org.anddev.andengine.entity.scene;

import org.anddev.andengine.engine.handler.runnable.*;
import android.util.*;
import java.util.*;
import org.anddev.andengine.entity.scene.background.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.input.touch.*;
import org.anddev.andengine.opengl.util.*;
import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.entity.layer.*;
import org.anddev.andengine.entity.*;

public class Scene extends Entity
{
    private IBackground mBackground;
    private boolean mBackgroundEnabled;
    protected Scene mChildScene;
    private boolean mChildSceneModalDraw;
    private boolean mChildSceneModalTouch;
    private boolean mChildSceneModalUpdate;
    private final int mLayerCount;
    private final ILayer[] mLayers;
    private IOnAreaTouchListener mOnAreaTouchListener;
    private boolean mOnAreaTouchTraversalBackToFront;
    private IOnSceneTouchListener mOnSceneTouchListener;
    protected Scene mParentScene;
    private final RunnableHandler mRunnableHandler;
    private float mSecondsElapsedTotal;
    private boolean mTouchAreaBindingEnabled;
    private final SparseArray<ITouchArea> mTouchAreaBindings;
    private final ArrayList<ITouchArea> mTouchAreas;
    private final UpdateHandlerList mUpdateHandlers;
    
    public Scene(final int mLayerCount) {
        super();
        this.mTouchAreas = new ArrayList<ITouchArea>();
        this.mRunnableHandler = new RunnableHandler();
        this.mUpdateHandlers = new UpdateHandlerList();
        this.mBackground = new ColorBackground(0.0f, 0.0f, 0.0f);
        this.mBackgroundEnabled = true;
        this.mOnAreaTouchTraversalBackToFront = true;
        this.mTouchAreaBindingEnabled = false;
        this.mTouchAreaBindings = (SparseArray<ITouchArea>)new SparseArray();
        this.mLayerCount = mLayerCount;
        this.mLayers = new ILayer[mLayerCount];
        this.createLayers();
    }
    
    public Scene(final int mLayerCount, final boolean b, final int... array) throws IllegalArgumentException {
        super();
        this.mTouchAreas = new ArrayList<ITouchArea>();
        this.mRunnableHandler = new RunnableHandler();
        this.mUpdateHandlers = new UpdateHandlerList();
        this.mBackground = new ColorBackground(0.0f, 0.0f, 0.0f);
        this.mBackgroundEnabled = true;
        this.mOnAreaTouchTraversalBackToFront = true;
        this.mTouchAreaBindingEnabled = false;
        this.mTouchAreaBindings = (SparseArray<ITouchArea>)new SparseArray();
        if (mLayerCount != array.length) {
            throw new IllegalArgumentException("pLayerCount must be the same as the length of pLayerCapacities.");
        }
        this.mLayerCount = mLayerCount;
        this.mLayers = new ILayer[mLayerCount];
        this.createLayers(b, array);
    }
    
    private void createLayers() {
        final ILayer[] mLayers = this.mLayers;
        for (int i = -1 + this.mLayerCount; i >= 0; --i) {
            mLayers[i] = new DynamicCapacityLayer();
        }
    }
    
    private void createLayers(final boolean b, final int[] array) {
        final ILayer[] mLayers = this.mLayers;
        if (b) {
            for (int i = -1 + this.mLayerCount; i >= 0; --i) {
                mLayers[i] = new FixedCapacityLayer(array[i]);
            }
        }
        else {
            for (int j = -1 + this.mLayerCount; j >= 0; --j) {
                mLayers[j] = new DynamicCapacityLayer(array[j]);
            }
        }
    }
    
    private void drawLayers(final GL10 gl10, final Camera camera) {
        final ILayer[] mLayers = this.mLayers;
        for (int mLayerCount = this.mLayerCount, i = 0; i < mLayerCount; ++i) {
            mLayers[i].onDraw(gl10, camera);
        }
    }
    
    private Boolean onAreaTouchEvent(final TouchEvent touchEvent, final float n, final float n2, final ITouchArea touchArea) {
        final float[] convertSceneToLocalCoordinates = touchArea.convertSceneToLocalCoordinates(n, n2);
        final float n3 = convertSceneToLocalCoordinates[0];
        final float n4 = convertSceneToLocalCoordinates[1];
        if (touchArea.onAreaTouched(touchEvent, n3, n4)) {
            return Boolean.TRUE;
        }
        if (this.mOnAreaTouchListener != null) {
            return this.mOnAreaTouchListener.onAreaTouched(touchEvent, touchArea, n3, n4);
        }
        return null;
    }
    
    private void setParentScene(final Scene mParentScene) {
        this.mParentScene = mParentScene;
    }
    
    private void updateLayers(final float n) {
        final ILayer[] mLayers = this.mLayers;
        for (int mLayerCount = this.mLayerCount, i = 0; i < mLayerCount; ++i) {
            mLayers[i].onUpdate(n);
        }
    }
    
    private void updateUpdateHandlers(final float n) {
        if (this.mChildScene == null || !this.mChildSceneModalUpdate) {
            this.mUpdateHandlers.onUpdate(n);
        }
        if (this.mChildScene != null) {
            this.mChildScene.updateUpdateHandlers(n);
        }
    }
    
    public void back() {
        this.clearChildScene();
        if (this.mParentScene != null) {
            this.mParentScene.clearChildScene();
            this.mParentScene = null;
        }
    }
    
    public void clearChildScene() {
        this.mChildScene = null;
    }
    
    public void clearTouchAreas() {
        this.mTouchAreas.clear();
    }
    
    public void clearUpdateHandlers() {
        this.mUpdateHandlers.clear();
    }
    
    public IBackground getBackground() {
        return this.mBackground;
    }
    
    public ILayer getBottomLayer() {
        return this.mLayers[0];
    }
    
    public Scene getChildScene() {
        return this.mChildScene;
    }
    
    public ILayer getLayer(final int n) throws ArrayIndexOutOfBoundsException {
        return this.mLayers[n];
    }
    
    public int getLayerCount() {
        return this.mLayers.length;
    }
    
    public IOnAreaTouchListener getOnAreaTouchListener() {
        return this.mOnAreaTouchListener;
    }
    
    public IOnSceneTouchListener getOnSceneTouchListener() {
        return this.mOnSceneTouchListener;
    }
    
    public float getSecondsElapsedTotal() {
        return this.mSecondsElapsedTotal;
    }
    
    public ILayer getTopLayer() {
        return this.mLayers[-1 + this.mLayerCount];
    }
    
    public boolean hasChildScene() {
        return this.mChildScene != null;
    }
    
    public boolean hasOnAreaTouchListener() {
        return this.mOnAreaTouchListener != null;
    }
    
    public boolean hasOnSceneTouchListener() {
        return this.mOnSceneTouchListener != null;
    }
    
    public boolean isBackgroundEnabled() {
        return this.mBackgroundEnabled;
    }
    
    public boolean isTouchAreaBindingEnabled() {
        return this.mTouchAreaBindingEnabled;
    }
    
    protected boolean onChildSceneTouchEvent(final TouchEvent touchEvent) {
        return this.mChildScene.onSceneTouchEvent(touchEvent);
    }
    
    @Override
    protected void onManagedDraw(final GL10 gl10, final Camera camera) {
        final Scene mChildScene = this.mChildScene;
        if (mChildScene == null || !this.mChildSceneModalDraw) {
            if (this.mBackgroundEnabled) {
                camera.onApplyPositionIndependentMatrix(gl10);
                GLHelper.setModelViewIdentityMatrix(gl10);
                this.mBackground.onDraw(gl10, camera);
            }
            camera.onApplyMatrix(gl10);
            GLHelper.setModelViewIdentityMatrix(gl10);
            this.drawLayers(gl10, camera);
        }
        if (mChildScene != null) {
            mChildScene.onDraw(gl10, camera);
        }
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
        this.updateUpdateHandlers(n);
        this.mRunnableHandler.onUpdate(n);
        this.mSecondsElapsedTotal += n;
        final Scene mChildScene = this.mChildScene;
        if (mChildScene == null || !this.mChildSceneModalUpdate) {
            this.mBackground.onUpdate(n);
            this.updateLayers(n);
        }
        if (mChildScene != null) {
            mChildScene.onUpdate(n);
        }
    }
    
    public boolean onSceneTouchEvent(final TouchEvent touchEvent) {
        final int action = touchEvent.getAction();
        boolean b;
        if (action == 0) {
            b = true;
        }
        else {
            b = false;
        }
        if (this.mTouchAreaBindingEnabled && !b) {
            final SparseArray<ITouchArea> mTouchAreaBindings = this.mTouchAreaBindings;
            final ITouchArea touchArea = (ITouchArea)mTouchAreaBindings.get(touchEvent.getPointerID());
            if (touchArea != null) {
                final float x = touchEvent.getX();
                final float y = touchEvent.getY();
                switch (action) {
                    case 1:
                    case 3: {
                        mTouchAreaBindings.remove(touchEvent.getPointerID());
                        break;
                    }
                }
                final Boolean onAreaTouchEvent = this.onAreaTouchEvent(touchEvent, x, y, touchArea);
                if (onAreaTouchEvent != null && onAreaTouchEvent) {
                    return true;
                }
            }
        }
        if (this.mChildScene != null) {
            if (this.onChildSceneTouchEvent(touchEvent)) {
                return true;
            }
            if (this.mChildSceneModalTouch) {
                return false;
            }
        }
        final float x2 = touchEvent.getX();
        final float y2 = touchEvent.getY();
        final int mLayerCount = this.mLayerCount;
        final ILayer[] mLayers = this.mLayers;
        if (this.mOnAreaTouchTraversalBackToFront) {
            for (int i = 0; i < mLayerCount; ++i) {
                final ArrayList<ITouchArea> touchAreas = mLayers[i].getTouchAreas();
                final int size = touchAreas.size();
                if (size > 0) {
                    for (int j = 0; j < size; ++j) {
                        final ITouchArea touchArea2 = touchAreas.get(j);
                        if (touchArea2.contains(x2, y2)) {
                            final Boolean onAreaTouchEvent2 = this.onAreaTouchEvent(touchEvent, x2, y2, touchArea2);
                            if (onAreaTouchEvent2 != null && onAreaTouchEvent2) {
                                if (this.mTouchAreaBindingEnabled && b) {
                                    this.mTouchAreaBindings.put(touchEvent.getPointerID(), (Object)touchArea2);
                                }
                                return true;
                            }
                        }
                    }
                }
            }
        }
        else {
            for (int k = mLayerCount - 1; k >= 0; --k) {
                final ArrayList<ITouchArea> touchAreas2 = mLayers[k].getTouchAreas();
                final int size2 = touchAreas2.size();
                if (size2 > 0) {
                    for (int l = size2 - 1; l >= 0; --l) {
                        final ITouchArea touchArea3 = touchAreas2.get(l);
                        if (touchArea3.contains(x2, y2)) {
                            final Boolean onAreaTouchEvent3 = this.onAreaTouchEvent(touchEvent, x2, y2, touchArea3);
                            if (onAreaTouchEvent3 != null && onAreaTouchEvent3) {
                                if (this.mTouchAreaBindingEnabled && b) {
                                    this.mTouchAreaBindings.put(touchEvent.getPointerID(), (Object)touchArea3);
                                }
                                return true;
                            }
                        }
                    }
                }
            }
        }
        final ArrayList<ITouchArea> mTouchAreas = this.mTouchAreas;
        final int size3 = mTouchAreas.size();
        if (size3 > 0) {
            if (this.mOnAreaTouchTraversalBackToFront) {
                for (int n = 0; n < size3; ++n) {
                    final ITouchArea touchArea4 = mTouchAreas.get(n);
                    if (touchArea4.contains(x2, y2)) {
                        final Boolean onAreaTouchEvent4 = this.onAreaTouchEvent(touchEvent, x2, y2, touchArea4);
                        if (onAreaTouchEvent4 != null && onAreaTouchEvent4) {
                            if (this.mTouchAreaBindingEnabled && b) {
                                this.mTouchAreaBindings.put(touchEvent.getPointerID(), (Object)touchArea4);
                            }
                            return true;
                        }
                    }
                }
            }
            else {
                for (int n2 = size3 - 1; n2 >= 0; --n2) {
                    final ITouchArea touchArea5 = mTouchAreas.get(n2);
                    if (touchArea5.contains(x2, y2)) {
                        final Boolean onAreaTouchEvent5 = this.onAreaTouchEvent(touchEvent, x2, y2, touchArea5);
                        if (onAreaTouchEvent5 != null && onAreaTouchEvent5) {
                            if (this.mTouchAreaBindingEnabled && b) {
                                this.mTouchAreaBindings.put(touchEvent.getPointerID(), (Object)touchArea5);
                            }
                            return true;
                        }
                    }
                }
            }
        }
        return this.mOnSceneTouchListener != null && this.mOnSceneTouchListener.onSceneTouchEvent(this, touchEvent);
    }
    
    public void postRunnable(final Runnable runnable) {
        this.mRunnableHandler.postRunnable(runnable);
    }
    
    public void registerTouchArea(final ITouchArea touchArea) {
        this.mTouchAreas.add(touchArea);
    }
    
    public void registerUpdateHandler(final IUpdateHandler updateHandler) {
        this.mUpdateHandlers.add(updateHandler);
    }
    
    public ILayer replaceLayer(final int n, final ILayer layer) {
        final ILayer[] mLayers = this.mLayers;
        final ILayer layer2 = mLayers[n];
        mLayers[n] = layer;
        return layer2;
    }
    
    @Override
    public void reset() {
        super.reset();
        this.clearChildScene();
        final ILayer[] mLayers = this.mLayers;
        for (int i = -1 + this.mLayerCount; i >= 0; --i) {
            mLayers[i].reset();
        }
    }
    
    public void setBackground(final IBackground mBackground) {
        this.mBackground = mBackground;
    }
    
    public void setBackgroundEnabled(final boolean mBackgroundEnabled) {
        this.mBackgroundEnabled = mBackgroundEnabled;
    }
    
    public void setChildScene(final Scene scene) {
        this.setChildScene(scene, false, false, false);
    }
    
    public void setChildScene(final Scene mChildScene, final boolean mChildSceneModalDraw, final boolean mChildSceneModalUpdate, final boolean mChildSceneModalTouch) {
        mChildScene.setParentScene(this);
        this.mChildScene = mChildScene;
        this.mChildSceneModalDraw = mChildSceneModalDraw;
        this.mChildSceneModalUpdate = mChildSceneModalUpdate;
        this.mChildSceneModalTouch = mChildSceneModalTouch;
    }
    
    public void setChildSceneModal(final Scene scene) {
        this.setChildScene(scene, true, true, true);
    }
    
    public void setLayer(final int n, final ILayer layer) {
        this.mLayers[n] = layer;
    }
    
    public void setOnAreaTouchListener(final IOnAreaTouchListener mOnAreaTouchListener) {
        this.mOnAreaTouchListener = mOnAreaTouchListener;
    }
    
    public void setOnAreaTouchTraversalBackToFront() {
        this.mOnAreaTouchTraversalBackToFront = true;
    }
    
    public void setOnAreaTouchTraversalFrontToBack() {
        this.mOnAreaTouchTraversalBackToFront = false;
    }
    
    public void setOnSceneTouchListener(final IOnSceneTouchListener mOnSceneTouchListener) {
        this.mOnSceneTouchListener = mOnSceneTouchListener;
    }
    
    public void setTouchAreaBindingEnabled(final boolean mTouchAreaBindingEnabled) {
        if (!(this.mTouchAreaBindingEnabled = mTouchAreaBindingEnabled)) {
            this.mTouchAreaBindings.clear();
        }
    }
    
    public void sortLayers() {
        ZIndexSorter.getInstance().sort(this.mLayers);
    }
    
    public void swapLayers(final int n, final int n2) {
        final ILayer[] mLayers = this.mLayers;
        final ILayer layer = mLayers[n];
        mLayers[n] = mLayers[n2];
        mLayers[n2] = layer;
    }
    
    public void unregisterTouchArea(final ITouchArea touchArea) {
        this.mTouchAreas.remove(touchArea);
    }
    
    public void unregisterUpdateHandler(final IUpdateHandler updateHandler) {
        this.mUpdateHandlers.remove(updateHandler);
    }
    
    public interface IOnAreaTouchListener
    {
        boolean onAreaTouched(TouchEvent p0, ITouchArea p1, float p2, float p3);
    }
    
    public interface IOnSceneTouchListener
    {
        boolean onSceneTouchEvent(Scene p0, TouchEvent p1);
    }
    
    public interface ITouchArea
    {
        boolean contains(float p0, float p1);
        
        float[] convertLocalToSceneCoordinates(float p0, float p1);
        
        float[] convertSceneToLocalCoordinates(float p0, float p1);
        
        boolean onAreaTouched(TouchEvent p0, float p1, float p2);
    }
}
