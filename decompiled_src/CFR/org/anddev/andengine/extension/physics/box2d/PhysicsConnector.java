/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.extension.physics.box2d.util.constants.PhysicsConstants;
import org.anddev.andengine.util.MathUtils;

public class PhysicsConnector
implements IUpdateHandler,
PhysicsConstants {
    protected final Body mBody;
    protected final float mPixelToMeterRatio;
    protected final Shape mShape;
    protected final float mShapeHalfBaseHeight;
    protected final float mShapeHalfBaseWidth;
    protected boolean mUpdateAngularVelocity;
    protected boolean mUpdateLinearVelocity;
    protected boolean mUpdatePosition;
    protected boolean mUpdateRotation;

    public PhysicsConnector(Shape shape, Body body) {
        this(shape, body, true, true, true, true);
    }

    public PhysicsConnector(Shape shape, Body body, float f) {
        this(shape, body, true, true, true, true, f);
    }

    public PhysicsConnector(Shape shape, Body body, boolean bl, boolean bl2, boolean bl3, boolean bl4) {
        this(shape, body, bl, bl2, bl3, bl4, 32.0f);
    }

    public PhysicsConnector(Shape shape, Body body, boolean bl, boolean bl2, boolean bl3, boolean bl4, float f) {
        this.mShape = shape;
        this.mBody = body;
        this.mUpdatePosition = bl;
        this.mUpdateRotation = bl2;
        this.mUpdateLinearVelocity = bl3;
        this.mUpdateAngularVelocity = bl4;
        this.mPixelToMeterRatio = f;
        this.mShapeHalfBaseWidth = 0.5f * shape.getBaseWidth();
        this.mShapeHalfBaseHeight = 0.5f * shape.getBaseHeight();
    }

    public Body getBody() {
        return this.mBody;
    }

    public Shape getShape() {
        return this.mShape;
    }

    public boolean isUpdateAngularVelocity() {
        return this.mUpdateAngularVelocity;
    }

    public boolean isUpdateLinearVelocity() {
        return this.mUpdateLinearVelocity;
    }

    public boolean isUpdatePosition() {
        return this.mUpdatePosition;
    }

    public boolean isUpdateRotation() {
        return this.mUpdateRotation;
    }

    @Override
    public void onUpdate(float f) {
        Shape shape = this.mShape;
        Body body = this.mBody;
        if (this.mUpdatePosition) {
            Vector2 vector2 = body.getPosition();
            float f2 = this.mPixelToMeterRatio;
            shape.setPosition(f2 * vector2.x - this.mShapeHalfBaseWidth, f2 * vector2.y - this.mShapeHalfBaseHeight);
        }
        if (this.mUpdateRotation) {
            shape.setRotation(MathUtils.radToDeg(body.getAngle()));
        }
        if (this.mUpdateLinearVelocity) {
            Vector2 vector2 = body.getLinearVelocity();
            shape.setVelocity(vector2.x, vector2.y);
        }
        if (!this.mUpdateAngularVelocity) return;
        shape.setAngularVelocity(body.getAngularVelocity());
    }

    @Override
    public void reset() {
    }

    public void setUpdateAngularVelocity(boolean bl) {
        this.mUpdateAngularVelocity = bl;
    }

    public void setUpdateLinearVelocity(boolean bl) {
        this.mUpdateLinearVelocity = bl;
    }

    public void setUpdatePosition(boolean bl) {
        this.mUpdatePosition = bl;
    }

    public void setUpdateRotation(boolean bl) {
        this.mUpdateRotation = bl;
    }
}

