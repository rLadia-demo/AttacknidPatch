/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.util.SparseArray
 *  javax.microedition.khronos.opengles.GL10
 */
package org.anddev.andengine.entity.scene;

import android.util.SparseArray;
import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL10;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.UpdateHandlerList;
import org.anddev.andengine.engine.handler.runnable.RunnableHandler;
import org.anddev.andengine.entity.Entity;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.DynamicCapacityLayer;
import org.anddev.andengine.entity.layer.FixedCapacityLayer;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.layer.ZIndexSorter;
import org.anddev.andengine.entity.scene.background.ColorBackground;
import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.opengl.util.GLHelper;

public class Scene
extends Entity {
    private IBackground mBackground = new ColorBackground(0.0f, 0.0f, 0.0f);
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
    private final ArrayList<ITouchArea> mTouchAreas = new ArrayList<ITouchArea>();
    private final UpdateHandlerList mUpdateHandlers = new UpdateHandlerList();

    public Scene(int n) {
        this.mLayerCount = n;
        this.mLayers = new ILayer[n];
        this.createLayers();
    }

    public /* varargs */ Scene(int n, boolean bl, int ... arrn) throws IllegalArgumentException {
        if (n != arrn.length) {
            throw new IllegalArgumentException("pLayerCount must be the same as the length of pLayerCapacities.");
        }
        this.mLayerCount = n;
        this.mLayers = new ILayer[n];
        this.createLayers(bl, arrn);
    }

    private void createLayers() {
        ILayer[] arriLayer = this.mLayers;
        int n = -1 + this.mLayerCount;
        while (n >= 0) {
            arriLayer[n] = new DynamicCapacityLayer();
            --n;
        }
        return;
    }

    /*
     * Enabled aggressive block sorting
     */
    private void createLayers(boolean bl, int[] arrn) {
        ILayer[] arriLayer = this.mLayers;
        if (bl) {
            for (int i = -1 + this.mLayerCount; i >= 0; --i) {
                arriLayer[i] = new FixedCapacityLayer(arrn[i]);
            }
            return;
        }
        for (int i = -1 + this.mLayerCount; i >= 0; --i) {
            arriLayer[i] = new DynamicCapacityLayer(arrn[i]);
        }
    }

    private void drawLayers(GL10 gL10, Camera camera) {
        ILayer[] arriLayer = this.mLayers;
        int n = this.mLayerCount;
        int n2 = 0;
        while (n2 < n) {
            arriLayer[n2].onDraw(gL10, camera);
            ++n2;
        }
        return;
    }

    private Boolean onAreaTouchEvent(TouchEvent touchEvent, float f, float f2, ITouchArea iTouchArea) {
        float[] arrf = iTouchArea.convertSceneToLocalCoordinates(f, f2);
        float f3 = arrf[0];
        float f4 = arrf[1];
        if (iTouchArea.onAreaTouched(touchEvent, f3, f4)) {
            return Boolean.TRUE;
        }
        if (this.mOnAreaTouchListener == null) return null;
        return this.mOnAreaTouchListener.onAreaTouched(touchEvent, iTouchArea, f3, f4);
    }

    private void setParentScene(Scene scene) {
        this.mParentScene = scene;
    }

    private void updateLayers(float f) {
        ILayer[] arriLayer = this.mLayers;
        int n = this.mLayerCount;
        int n2 = 0;
        while (n2 < n) {
            arriLayer[n2].onUpdate(f);
            ++n2;
        }
        return;
    }

    private void updateUpdateHandlers(float f) {
        if (!(this.mChildScene != null && this.mChildSceneModalUpdate)) {
            this.mUpdateHandlers.onUpdate(f);
        }
        if (this.mChildScene == null) return;
        this.mChildScene.updateUpdateHandlers(f);
    }

    public void back() {
        this.clearChildScene();
        if (this.mParentScene == null) return;
        this.mParentScene.clearChildScene();
        this.mParentScene = null;
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

    public ILayer getLayer(int n) throws ArrayIndexOutOfBoundsException {
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
        if (this.mChildScene == null) return false;
        return true;
    }

    public boolean hasOnAreaTouchListener() {
        if (this.mOnAreaTouchListener == null) return false;
        return true;
    }

    public boolean hasOnSceneTouchListener() {
        if (this.mOnSceneTouchListener == null) return false;
        return true;
    }

    public boolean isBackgroundEnabled() {
        return this.mBackgroundEnabled;
    }

    public boolean isTouchAreaBindingEnabled() {
        return this.mTouchAreaBindingEnabled;
    }

    protected boolean onChildSceneTouchEvent(TouchEvent touchEvent) {
        return this.mChildScene.onSceneTouchEvent(touchEvent);
    }

    @Override
    protected void onManagedDraw(GL10 gL10, Camera camera) {
        Scene scene = this.mChildScene;
        if (!(scene != null && this.mChildSceneModalDraw)) {
            if (this.mBackgroundEnabled) {
                camera.onApplyPositionIndependentMatrix(gL10);
                GLHelper.setModelViewIdentityMatrix(gL10);
                this.mBackground.onDraw(gL10, camera);
            }
            camera.onApplyMatrix(gL10);
            GLHelper.setModelViewIdentityMatrix(gL10);
            this.drawLayers(gL10, camera);
        }
        if (scene == null) return;
        scene.onDraw(gL10, camera);
    }

    @Override
    protected void onManagedUpdate(float f) {
        this.updateUpdateHandlers(f);
        this.mRunnableHandler.onUpdate(f);
        this.mSecondsElapsedTotal = f + this.mSecondsElapsedTotal;
        Scene scene = this.mChildScene;
        if (!(scene != null && this.mChildSceneModalUpdate)) {
            this.mBackground.onUpdate(f);
            this.updateLayers(f);
        }
        if (scene == null) return;
        scene.onUpdate(f);
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    public boolean onSceneTouchEvent(TouchEvent var1_1) {
        block19 : {
            block20 : {
                var2_2 = var1_1.getAction();
                var3_3 = var2_2 == 0;
                if (this.mTouchAreaBindingEnabled && !var3_3 && (var29_5 = (ITouchArea)(var28_4 = this.mTouchAreaBindings).get(var1_1.getPointerID())) != null) {
                    var30_6 = var1_1.getX();
                    var31_7 = var1_1.getY();
                    switch (var2_2) {
                        default: {
                            break;
                        }
                        case 1: 
                        case 3: {
                            var28_4.remove(var1_1.getPointerID());
                        }
                    }
                    var32_8 = this.onAreaTouchEvent(var1_1, var30_6, var31_7, var29_5);
                    if (var32_8 == null || !var32_8.booleanValue()) ** break;
                    return true;
                }
                if (this.mChildScene != null) {
                    if (this.onChildSceneTouchEvent(var1_1)) {
                        return true;
                    }
                    if (this.mChildSceneModalTouch) {
                        return false;
                    }
                }
                var4_9 = var1_1.getX();
                var5_10 = var1_1.getY();
                var6_11 = this.mLayerCount;
                var7_12 = this.mLayers;
                ** if (!this.mOnAreaTouchTraversalBackToFront) goto lbl51
lbl24: // 1 sources:
                var22_13 = 0;
                block3 : do {
                    ** if (var22_13 >= var6_11) goto lbl30
lbl27: // 1 sources:
                    ** if ((var24_16 = (var23_14 = var7_12[var22_13].getTouchAreas()).size()) <= 0) goto lbl-1000
lbl28: // 1 sources:
                    var25_15 = 0;
                    ** GOTO lbl40
lbl30: // 2 sources:
                    do {
                        if ((var15_26 = (var14_25 = this.mTouchAreas).size()) <= 0) break block19;
                        if (!this.mOnAreaTouchTraversalBackToFront) break block20;
                        for (var19_27 = 0; var19_27 < var15_26; ++var19_27) {
                            if (!(var20_29 = var14_25.get(var19_27)).contains(var4_9, var5_10) || (var21_28 = this.onAreaTouchEvent(var1_1, var4_9, var5_10, var20_29)) == null || !var21_28.booleanValue()) continue;
                            if (this.mTouchAreaBindingEnabled == false) return true;
                            if (var3_3 == false) return true;
                            this.mTouchAreaBindings.put(var1_1.getPointerID(), (Object)var20_29);
                            return true;
                        }
                        break block19;
                        break;
                    } while (true);
lbl40: // 1 sources:
                    do {
                        if (var25_15 >= var24_16) lbl-1000: // 2 sources:
                        {
                            ++var22_13;
                            continue block3;
                        }
                        if ((var26_18 = var23_14.get(var25_15)).contains(var4_9, var5_10) && (var27_17 = this.onAreaTouchEvent(var1_1, var4_9, var5_10, var26_18)) != null && var27_17.booleanValue()) {
                            if (this.mTouchAreaBindingEnabled == false) return true;
                            if (var3_3 == false) return true;
                            this.mTouchAreaBindings.put(var1_1.getPointerID(), (Object)var26_18);
                            return true;
                        }
                        ++var25_15;
                    } while (true);
                    break;
                } while (true);
lbl51: // 1 sources:
                var8_19 = var6_11 - 1;
                do lbl-1000: // 2 sources:
                {
                    if (var8_19 < 0) ** continue;
                    ** if ((var10_21 = (var9_20 = var7_12[var8_19].getTouchAreas()).size()) <= 0) goto lbl-1000
lbl55: // 1 sources:
                    var11_22 = var10_21 - 1;
                    do {
                        if (var11_22 < 0) lbl-1000: // 2 sources:
                        {
                            --var8_19;
                            ** continue;
                        }
                        if ((var12_23 = var9_20.get(var11_22)).contains(var4_9, var5_10) && (var13_24 = this.onAreaTouchEvent(var1_1, var4_9, var5_10, var12_23)) != null && var13_24.booleanValue()) {
                            if (this.mTouchAreaBindingEnabled == false) return true;
                            if (var3_3 == false) return true;
                            this.mTouchAreaBindings.put(var1_1.getPointerID(), (Object)var12_23);
                            return true;
                        }
                        --var11_22;
                    } while (true);
                    break;
                } while (true);
            }
            for (var16_30 = var15_26 - 1; var16_30 >= 0; --var16_30) {
                if (!(var17_31 = var14_25.get(var16_30)).contains(var4_9, var5_10) || (var18_32 = this.onAreaTouchEvent(var1_1, var4_9, var5_10, var17_31)) == null || !var18_32.booleanValue()) continue;
                if (this.mTouchAreaBindingEnabled == false) return true;
                if (var3_3 == false) return true;
                this.mTouchAreaBindings.put(var1_1.getPointerID(), (Object)var17_31);
                return true;
            }
        }
        if (this.mOnSceneTouchListener == null) return false;
        return this.mOnSceneTouchListener.onSceneTouchEvent(this, var1_1);
    }

    public void postRunnable(Runnable runnable) {
        this.mRunnableHandler.postRunnable(runnable);
    }

    public void registerTouchArea(ITouchArea iTouchArea) {
        this.mTouchAreas.add(iTouchArea);
    }

    public void registerUpdateHandler(IUpdateHandler iUpdateHandler) {
        this.mUpdateHandlers.add((Object)iUpdateHandler);
    }

    public ILayer replaceLayer(int n, ILayer iLayer) {
        ILayer[] arriLayer = this.mLayers;
        ILayer iLayer2 = arriLayer[n];
        arriLayer[n] = iLayer;
        return iLayer2;
    }

    @Override
    public void reset() {
        super.reset();
        this.clearChildScene();
        ILayer[] arriLayer = this.mLayers;
        int n = -1 + this.mLayerCount;
        while (n >= 0) {
            arriLayer[n].reset();
            --n;
        }
        return;
    }

    public void setBackground(IBackground iBackground) {
        this.mBackground = iBackground;
    }

    public void setBackgroundEnabled(boolean bl) {
        this.mBackgroundEnabled = bl;
    }

    public void setChildScene(Scene scene) {
        this.setChildScene(scene, false, false, false);
    }

    public void setChildScene(Scene scene, boolean bl, boolean bl2, boolean bl3) {
        scene.setParentScene(this);
        this.mChildScene = scene;
        this.mChildSceneModalDraw = bl;
        this.mChildSceneModalUpdate = bl2;
        this.mChildSceneModalTouch = bl3;
    }

    public void setChildSceneModal(Scene scene) {
        this.setChildScene(scene, true, true, true);
    }

    public void setLayer(int n, ILayer iLayer) {
        this.mLayers[n] = iLayer;
    }

    public void setOnAreaTouchListener(IOnAreaTouchListener iOnAreaTouchListener) {
        this.mOnAreaTouchListener = iOnAreaTouchListener;
    }

    public void setOnAreaTouchTraversalBackToFront() {
        this.mOnAreaTouchTraversalBackToFront = true;
    }

    public void setOnAreaTouchTraversalFrontToBack() {
        this.mOnAreaTouchTraversalBackToFront = false;
    }

    public void setOnSceneTouchListener(IOnSceneTouchListener iOnSceneTouchListener) {
        this.mOnSceneTouchListener = iOnSceneTouchListener;
    }

    public void setTouchAreaBindingEnabled(boolean bl) {
        this.mTouchAreaBindingEnabled = bl;
        if (this.mTouchAreaBindingEnabled) return;
        this.mTouchAreaBindings.clear();
    }

    public void sortLayers() {
        ZIndexSorter.getInstance().sort(this.mLayers);
    }

    public void swapLayers(int n, int n2) {
        ILayer[] arriLayer = this.mLayers;
        ILayer iLayer = arriLayer[n];
        arriLayer[n] = arriLayer[n2];
        arriLayer[n2] = iLayer;
    }

    public void unregisterTouchArea(ITouchArea iTouchArea) {
        this.mTouchAreas.remove(iTouchArea);
    }

    public void unregisterUpdateHandler(IUpdateHandler iUpdateHandler) {
        this.mUpdateHandlers.remove((Object)iUpdateHandler);
    }

    public interface IOnAreaTouchListener {
        public boolean onAreaTouched(TouchEvent var1, ITouchArea var2, float var3, float var4);
    }

    public interface IOnSceneTouchListener {
        public boolean onSceneTouchEvent(Scene var1, TouchEvent var2);
    }

    public interface ITouchArea {
        public boolean contains(float var1, float var2);

        public float[] convertLocalToSceneCoordinates(float var1, float var2);

        public float[] convertSceneToLocalCoordinates(float var1, float var2);

        public boolean onAreaTouched(TouchEvent var1, float var2, float var3);
    }

}

