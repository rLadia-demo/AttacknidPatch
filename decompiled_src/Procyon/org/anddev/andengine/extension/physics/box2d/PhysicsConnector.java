package org.anddev.andengine.extension.physics.box2d;

import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.extension.physics.box2d.util.constants.*;
import com.badlogic.gdx.physics.box2d.*;
import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.*;
import com.badlogic.gdx.math.*;

public class PhysicsConnector implements IUpdateHandler, PhysicsConstants
{
    protected final Body mBody;
    protected final float mPixelToMeterRatio;
    protected final Shape mShape;
    protected final float mShapeHalfBaseHeight;
    protected final float mShapeHalfBaseWidth;
    protected boolean mUpdateAngularVelocity;
    protected boolean mUpdateLinearVelocity;
    protected boolean mUpdatePosition;
    protected boolean mUpdateRotation;
    
    public PhysicsConnector(final Shape shape, final Body body) {
        this(shape, body, true, true, true, true);
    }
    
    public PhysicsConnector(final Shape shape, final Body body, final float n) {
        this(shape, body, true, true, true, true, n);
    }
    
    public PhysicsConnector(final Shape shape, final Body body, final boolean b, final boolean b2, final boolean b3, final boolean b4) {
        this(shape, body, b, b2, b3, b4, 32.0f);
    }
    
    public PhysicsConnector(final Shape mShape, final Body mBody, final boolean mUpdatePosition, final boolean mUpdateRotation, final boolean mUpdateLinearVelocity, final boolean mUpdateAngularVelocity, final float mPixelToMeterRatio) {
        super();
        this.mShape = mShape;
        this.mBody = mBody;
        this.mUpdatePosition = mUpdatePosition;
        this.mUpdateRotation = mUpdateRotation;
        this.mUpdateLinearVelocity = mUpdateLinearVelocity;
        this.mUpdateAngularVelocity = mUpdateAngularVelocity;
        this.mPixelToMeterRatio = mPixelToMeterRatio;
        this.mShapeHalfBaseWidth = 0.5f * mShape.getBaseWidth();
        this.mShapeHalfBaseHeight = 0.5f * mShape.getBaseHeight();
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
    public void onUpdate(final float n) {
        final Shape mShape = this.mShape;
        final Body mBody = this.mBody;
        if (this.mUpdatePosition) {
            final Vector2 position = mBody.getPosition();
            final float mPixelToMeterRatio = this.mPixelToMeterRatio;
            mShape.setPosition(mPixelToMeterRatio * position.x - this.mShapeHalfBaseWidth, mPixelToMeterRatio * position.y - this.mShapeHalfBaseHeight);
        }
        if (this.mUpdateRotation) {
            mShape.setRotation(MathUtils.radToDeg(mBody.getAngle()));
        }
        if (this.mUpdateLinearVelocity) {
            final Vector2 linearVelocity = mBody.getLinearVelocity();
            mShape.setVelocity(linearVelocity.x, linearVelocity.y);
        }
        if (this.mUpdateAngularVelocity) {
            mShape.setAngularVelocity(mBody.getAngularVelocity());
        }
    }
    
    @Override
    public void reset() {
    }
    
    public void setUpdateAngularVelocity(final boolean mUpdateAngularVelocity) {
        this.mUpdateAngularVelocity = mUpdateAngularVelocity;
    }
    
    public void setUpdateLinearVelocity(final boolean mUpdateLinearVelocity) {
        this.mUpdateLinearVelocity = mUpdateLinearVelocity;
    }
    
    public void setUpdatePosition(final boolean mUpdatePosition) {
        this.mUpdatePosition = mUpdatePosition;
    }
    
    public void setUpdateRotation(final boolean mUpdateRotation) {
        this.mUpdateRotation = mUpdateRotation;
    }
}
