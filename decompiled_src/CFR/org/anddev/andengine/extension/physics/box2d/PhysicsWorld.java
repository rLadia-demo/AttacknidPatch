/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.Contact;
import com.badlogic.gdx.physics.box2d.ContactFilter;
import com.badlogic.gdx.physics.box2d.ContactListener;
import com.badlogic.gdx.physics.box2d.DestructionListener;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.JointDef;
import com.badlogic.gdx.physics.box2d.QueryCallback;
import com.badlogic.gdx.physics.box2d.World;
import java.util.List;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.handler.runnable.RunnableHandler;
import org.anddev.andengine.extension.physics.box2d.PhysicsConnector;
import org.anddev.andengine.extension.physics.box2d.PhysicsConnectorManager;

public class PhysicsWorld
implements IUpdateHandler {
    public static final int POSITION_ITERATIONS_DEFAULT = 8;
    public static final int VELOCITY_ITERATIONS_DEFAULT = 8;
    protected final PhysicsConnectorManager mPhysicsConnectorManager = new PhysicsConnectorManager();
    protected int mPositionIterations = 8;
    protected final RunnableHandler mRunnableHandler = new RunnableHandler();
    protected int mVelocityIterations = 8;
    protected final World mWorld;

    static {
        System.loadLibrary("andenginephysicsbox2dextension");
    }

    public PhysicsWorld(Vector2 vector2, boolean bl) {
        this(vector2, bl, 8, 8);
    }

    public PhysicsWorld(Vector2 vector2, boolean bl, int n2, int n2) {
        this.mWorld = new World(vector2, bl);
    }

    public void QueryAABB(QueryCallback queryCallback, float f, float f2, float f3, float f4) {
        this.mWorld.QueryAABB(queryCallback, f, f2, f3, f4);
    }

    public void clearForces() {
        this.mWorld.clearForces();
    }

    public void clearPhysicsConnectors() {
        this.mPhysicsConnectorManager.clear();
    }

    public Body createBody(BodyDef bodyDef) {
        return this.mWorld.createBody(bodyDef);
    }

    public Joint createJoint(JointDef jointDef) {
        return this.mWorld.createJoint(jointDef);
    }

    public void destroyBody(Body body) {
        this.mWorld.destroyBody(body);
    }

    public void destroyJoint(Joint joint) {
        this.mWorld.destroyJoint(joint);
    }

    public void dispose() {
        this.mWorld.dispose();
    }

    public boolean getAutoClearForces() {
        return this.mWorld.getAutoClearForces();
    }

    public Iterable<Body> getBodies() {
        return this.mWorld.getBodies();
    }

    public int getBodyCount() {
        return this.mWorld.getBodyCount();
    }

    public int getContactCount() {
        return this.mWorld.getContactCount();
    }

    public List<Contact> getContactList() {
        return this.mWorld.getContactList();
    }

    public Vector2 getGravity() {
        return this.mWorld.getGravity();
    }

    public int getJointCount() {
        return this.mWorld.getJointCount();
    }

    public Iterable<Joint> getJoints() {
        return this.mWorld.getJoints();
    }

    public PhysicsConnectorManager getPhysicsConnectorManager() {
        return this.mPhysicsConnectorManager;
    }

    public int getPositionIterations() {
        return this.mPositionIterations;
    }

    public int getProxyCount() {
        return this.mWorld.getProxyCount();
    }

    public int getVelocityIterations() {
        return this.mVelocityIterations;
    }

    public boolean isLocked() {
        return this.mWorld.isLocked();
    }

    @Override
    public void onUpdate(float f) {
        this.mRunnableHandler.onUpdate(f);
        this.mWorld.step(f, this.mVelocityIterations, this.mPositionIterations);
        this.mPhysicsConnectorManager.onUpdate(f);
    }

    public void postRunnable(Runnable runnable) {
        this.mRunnableHandler.postRunnable(runnable);
    }

    public void registerPhysicsConnector(PhysicsConnector physicsConnector) {
        this.mPhysicsConnectorManager.add((Object)physicsConnector);
    }

    @Override
    public void reset() {
        this.mPhysicsConnectorManager.reset();
        this.mRunnableHandler.reset();
    }

    public void setAutoClearForces(boolean bl) {
        this.mWorld.setAutoClearForces(bl);
    }

    public void setContactFilter(ContactFilter contactFilter) {
        this.mWorld.setContactFilter(contactFilter);
    }

    public void setContactListener(ContactListener contactListener) {
        this.mWorld.setContactListener(contactListener);
    }

    public void setContinuousPhysics(boolean bl) {
        this.mWorld.setContinuousPhysics(bl);
    }

    public void setDestructionListener(DestructionListener destructionListener) {
        this.mWorld.setDestructionListener(destructionListener);
    }

    public void setGravity(Vector2 vector2) {
        this.mWorld.setGravity(vector2);
    }

    public void setPositionIterations(int n) {
        this.mPositionIterations = n;
    }

    public void setVelocityIterations(int n) {
        this.mVelocityIterations = n;
    }

    public void setWarmStarting(boolean bl) {
        this.mWorld.setWarmStarting(bl);
    }

    public void unregisterPhysicsConnector(PhysicsConnector physicsConnector) {
        this.mPhysicsConnectorManager.remove((Object)physicsConnector);
    }
}

