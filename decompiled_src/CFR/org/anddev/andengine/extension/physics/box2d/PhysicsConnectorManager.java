/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.physics.box2d.Body;
import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.extension.physics.box2d.PhysicsConnector;

public class PhysicsConnectorManager
extends ArrayList<PhysicsConnector>
implements IUpdateHandler {
    private static final long serialVersionUID = 412969510084261799L;

    PhysicsConnectorManager() {
    }

    public Body findBodyByShape(Shape shape) {
        int n = -1 + this.size();
        while (n >= 0) {
            PhysicsConnector physicsConnector = (PhysicsConnector)this.get(n);
            if (physicsConnector.mShape == shape) {
                return physicsConnector.mBody;
            }
            --n;
        }
        return null;
    }

    /*
     * Enabled aggressive block sorting
     */
    public PhysicsConnector findPhysicsConnectorByShape(Shape shape) {
        for (int i = -1 + this.size(); i >= 0; --i) {
            PhysicsConnector physicsConnector = (PhysicsConnector)this.get(i);
            if (physicsConnector.mShape == shape) return physicsConnector;
        }
        return null;
    }

    @Override
    public void onUpdate(float f) {
        int n = -1 + this.size();
        while (n >= 0) {
            ((PhysicsConnector)this.get(n)).onUpdate(f);
            --n;
        }
        return;
    }

    @Override
    public void reset() {
        int n = -1 + this.size();
        while (n >= 0) {
            ((PhysicsConnector)this.get(n)).reset();
            --n;
        }
        return;
    }
}

