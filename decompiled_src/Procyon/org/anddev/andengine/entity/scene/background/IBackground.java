package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.opengl.*;
import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.util.modifier.*;

public interface IBackground extends IDrawable, IUpdateHandler
{
    void addBackgroundModifier(IModifier<IBackground> p0);
    
    void clearBackgroundModifiers();
    
    boolean removeBackgroundModifier(IModifier<IBackground> p0);
    
    void setColor(float p0, float p1, float p2);
    
    void setColor(float p0, float p1, float p2, float p3);
}
