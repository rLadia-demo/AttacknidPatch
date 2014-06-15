package org.anddev.andengine.entity;

import org.anddev.andengine.opengl.*;
import org.anddev.andengine.engine.handler.*;

public interface IEntity extends IDrawable, IUpdateHandler
{
    int getZIndex();
    
    void setZIndex(int p0);
}
