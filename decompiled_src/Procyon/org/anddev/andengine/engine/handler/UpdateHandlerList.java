package org.anddev.andengine.engine.handler;

import java.util.*;

public class UpdateHandlerList extends ArrayList<IUpdateHandler> implements IUpdateHandler
{
    private static final long serialVersionUID = -8842562717687229277L;
    
    @Override
    public void onUpdate(final float n) {
        for (int i = -1 + this.size(); i >= 0; --i) {
            this.get(i).onUpdate(n);
        }
    }
    
    @Override
    public void reset() {
        for (int i = -1 + this.size(); i >= 0; --i) {
            this.get(i).reset();
        }
    }
}
