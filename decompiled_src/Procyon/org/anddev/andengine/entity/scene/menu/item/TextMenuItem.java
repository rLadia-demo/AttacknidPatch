package org.anddev.andengine.entity.scene.menu.item;

import org.anddev.andengine.entity.text.*;
import org.anddev.andengine.opengl.font.*;

public class TextMenuItem extends Text implements IMenuItem
{
    private final int mID;
    
    public TextMenuItem(final int mid, final Font font, final String s) {
        super(0.0f, 0.0f, font, s);
        this.mID = mid;
    }
    
    @Override
    public int getID() {
        return this.mID;
    }
    
    @Override
    public void onSelected() {
    }
    
    @Override
    public void onUnselected() {
    }
}
