package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.shape.*;

public interface IMenuItem extends IShape
{
    int getID();
    
    void onSelected();
    
    void onUnselected();
}
