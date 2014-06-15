package org.anddev.andengine.entity.scene.menu.item.decorator;

import org.anddev.andengine.entity.scene.menu.item.*;

public class ScaleMenuItemDecorator extends BaseMenuItemDecorator
{
    private final float mSelectedScale;
    private final float mUnselectedScale;
    
    public ScaleMenuItemDecorator(final IMenuItem menuItem, final float mSelectedScale, final float mUnselectedScale) {
        super(menuItem);
        this.mSelectedScale = mSelectedScale;
        menuItem.setScale(this.mUnselectedScale = mUnselectedScale);
    }
    
    public void onMenuItemReset(final IMenuItem menuItem) {
        this.setScale(this.mUnselectedScale);
    }
    
    public void onMenuItemSelected(final IMenuItem menuItem) {
        this.setScale(this.mSelectedScale);
    }
    
    public void onMenuItemUnselected(final IMenuItem menuItem) {
        this.setScale(this.mUnselectedScale);
    }
}
