package org.anddev.andengine.entity.scene.menu.item.decorator;

import org.anddev.andengine.entity.scene.menu.item.*;

public class ColorMenuItemDecorator extends BaseMenuItemDecorator
{
    private final float mSelectedBlue;
    private final float mSelectedGreen;
    private final float mSelectedRed;
    private final float mUnselectedBlue;
    private final float mUnselectedGreen;
    private final float mUnselectedRed;
    
    public ColorMenuItemDecorator(final IMenuItem menuItem, final float mSelectedRed, final float mSelectedGreen, final float mSelectedBlue, final float mUnselectedRed, final float mUnselectedGreen, final float mUnselectedBlue) {
        super(menuItem);
        this.mSelectedRed = mSelectedRed;
        this.mSelectedGreen = mSelectedGreen;
        this.mSelectedBlue = mSelectedBlue;
        this.mUnselectedRed = mUnselectedRed;
        this.mUnselectedGreen = mUnselectedGreen;
        this.mUnselectedBlue = mUnselectedBlue;
        menuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
    }
    
    public void onMenuItemReset(final IMenuItem menuItem) {
        menuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
    }
    
    public void onMenuItemSelected(final IMenuItem menuItem) {
        menuItem.setColor(this.mSelectedRed, this.mSelectedGreen, this.mSelectedBlue);
    }
    
    public void onMenuItemUnselected(final IMenuItem menuItem) {
        menuItem.setColor(this.mUnselectedRed, this.mUnselectedGreen, this.mUnselectedBlue);
    }
}
