package org.anddev.andengine.entity.layer;

import org.anddev.andengine.entity.*;
import org.anddev.andengine.util.*;
import org.anddev.andengine.entity.scene.*;
import java.util.*;

public interface ILayer extends IEntity
{
    void addEntity(IEntity p0);
    
    void clear();
    
    IEntity findEntity(IEntityMatcher p0);
    
    IEntity getEntity(int p0);
    
    int getEntityCount();
    
    ArrayList<Scene.ITouchArea> getTouchAreas();
    
    void registerTouchArea(Scene.ITouchArea p0);
    
    IEntity removeEntity(int p0);
    
    boolean removeEntity(IEntity p0);
    
    boolean removeEntity(IEntityMatcher p0);
    
    IEntity replaceEntity(int p0, IEntity p1);
    
    void setEntity(int p0, IEntity p1);
    
    void sortEntities();
    
    void sortEntities(Comparator<IEntity> p0);
    
    void swapEntities(int p0, int p1);
    
    void unregisterTouchArea(Scene.ITouchArea p0);
}
