package org.anddev.andengine.ui;

import org.anddev.andengine.engine.*;
import org.anddev.andengine.entity.scene.*;

public interface IGameInterface
{
    void onGamePaused();
    
    void onGameResumed();
    
    void onLoadComplete();
    
    Engine onLoadEngine();
    
    void onLoadResources();
    
    Scene onLoadScene();
    
    void onUnloadResources();
}
