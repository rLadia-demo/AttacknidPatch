package org.anddev.andengine.extension.physics.box2d;

import java.util.*;
import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.entity.shape.*;
import com.badlogic.gdx.physics.box2d.*;

public class PhysicsConnectorManager extends ArrayList<PhysicsConnector> implements IUpdateHandler
{
    private static final long serialVersionUID = 412969510084261799L;
    
    public Body findBodyByShape(final Shape shape) {
        for (int i = -1 + this.size(); i >= 0; --i) {
            final PhysicsConnector physicsConnector = this.get(i);
            if (physicsConnector.mShape == shape) {
                return physicsConnector.mBody;
            }
        }
        return null;
    }
    
    public PhysicsConnector findPhysicsConnectorByShape(final Shape shape) {
        for (int i = -1 + this.size(); i >= 0; --i) {
            final PhysicsConnector physicsConnector = this.get(i);
            if (physicsConnector.mShape == shape) {
                return physicsConnector;
            }
        }
        return null;
    }
    
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
