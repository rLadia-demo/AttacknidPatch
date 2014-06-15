package org.anddev.andengine.entity.scene.menu.animator;

import java.util.*;
import org.anddev.andengine.entity.scene.menu.item.*;

public interface IMenuAnimator
{
    public static final IMenuAnimator DEFAULT = new AlphaMenuAnimator();
    
    void buildAnimations(ArrayList<IMenuItem> p0, float p1, float p2);
    
    void prepareAnimations(ArrayList<IMenuItem> p0, float p1, float p2);
}
