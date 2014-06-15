package org.anddev.andengine.entity.layer;

import org.anddev.andengine.entity.*;
import java.util.*;
import org.anddev.andengine.entity.scene.*;

public abstract class BaseLayer extends Entity implements ILayer
{
    private final ArrayList<Scene.ITouchArea> mTouchAreas;
    
    public BaseLayer() {
        super();
        this.mTouchAreas = new ArrayList<Scene.ITouchArea>();
    }
    
    public BaseLayer(final int n) {
        super(n);
        this.mTouchAreas = new ArrayList<Scene.ITouchArea>();
    }
    
    @Override
    public ArrayList<Scene.ITouchArea> getTouchAreas() {
        return this.mTouchAreas;
    }
    
    @Override
    public void registerTouchArea(final Scene.ITouchArea touchArea) {
        this.mTouchAreas.add(touchArea);
    }
    
    @Override
    public void unregisterTouchArea(final Scene.ITouchArea touchArea) {
        this.mTouchAreas.remove(touchArea);
    }
}
