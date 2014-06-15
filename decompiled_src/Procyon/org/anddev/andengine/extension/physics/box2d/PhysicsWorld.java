package org.anddev.andengine.extension.physics.box2d;

import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.engine.handler.runnable.*;
import com.badlogic.gdx.math.*;
import java.util.*;
import com.badlogic.gdx.physics.box2d.*;

public class PhysicsWorld implements IUpdateHandler
{
    public static final int POSITION_ITERATIONS_DEFAULT = 8;
    public static final int VELOCITY_ITERATIONS_DEFAULT = 8;
    protected final PhysicsConnectorManager mPhysicsConnectorManager;
    protected int mPositionIterations;
    protected final RunnableHandler mRunnableHandler;
    protected int mVelocityIterations;
    protected final World mWorld;
    
    static {
        System.loadLibrary("andenginephysicsbox2dextension");
    }
    
    public PhysicsWorld(final Vector2 vector2, final boolean b) {
        this(vector2, b, 8, 8);
    }
    
    public PhysicsWorld(final Vector2 vector2, final boolean b, final int n, final int n2) {
        super();
        this.mPhysicsConnectorManager = new PhysicsConnectorManager();
        this.mRunnableHandler = new RunnableHandler();
        this.mVelocityIterations = 8;
        this.mPositionIterations = 8;
        this.mWorld = new World(vector2, b);
    }
    
    public void QueryAABB(final QueryCallback queryCallback, final float n, final float n2, final float n3, final float n4) {
        this.mWorld.QueryAABB(queryCallback, n, n2, n3, n4);
    }
    
    public void clearForces() {
        this.mWorld.clearForces();
    }
    
    public void clearPhysicsConnectors() {
        this.mPhysicsConnectorManager.clear();
    }
    
    public Body createBody(final BodyDef bodyDef) {
        return this.mWorld.createBody(bodyDef);
    }
    
    public Joint createJoint(final JointDef jointDef) {
        return this.mWorld.createJoint(jointDef);
    }
    
    public void destroyBody(final Body body) {
        this.mWorld.destroyBody(body);
    }
    
    public void destroyJoint(final Joint joint) {
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
    public void onUpdate(final float n) {
        this.mRunnableHandler.onUpdate(n);
        this.mWorld.step(n, this.mVelocityIterations, this.mPositionIterations);
        this.mPhysicsConnectorManager.onUpdate(n);
    }
    
    public void postRunnable(final Runnable runnable) {
        this.mRunnableHandler.postRunnable(runnable);
    }
    
    public void registerPhysicsConnector(final PhysicsConnector physicsConnector) {
        this.mPhysicsConnectorManager.add(physicsConnector);
    }
    
    @Override
    public void reset() {
        this.mPhysicsConnectorManager.reset();
        this.mRunnableHandler.reset();
    }
    
    public void setAutoClearForces(final boolean autoClearForces) {
        this.mWorld.setAutoClearForces(autoClearForces);
    }
    
    public void setContactFilter(final ContactFilter contactFilter) {
        this.mWorld.setContactFilter(contactFilter);
    }
    
    public void setContactListener(final ContactListener contactListener) {
        this.mWorld.setContactListener(contactListener);
    }
    
    public void setContinuousPhysics(final boolean continuousPhysics) {
        this.mWorld.setContinuousPhysics(continuousPhysics);
    }
    
    public void setDestructionListener(final DestructionListener destructionListener) {
        this.mWorld.setDestructionListener(destructionListener);
    }
    
    public void setGravity(final Vector2 gravity) {
        this.mWorld.setGravity(gravity);
    }
    
    public void setPositionIterations(final int mPositionIterations) {
        this.mPositionIterations = mPositionIterations;
    }
    
    public void setVelocityIterations(final int mVelocityIterations) {
        this.mVelocityIterations = mVelocityIterations;
    }
    
    public void setWarmStarting(final boolean warmStarting) {
        this.mWorld.setWarmStarting(warmStarting);
    }
    
    public void unregisterPhysicsConnector(final PhysicsConnector physicsConnector) {
        this.mPhysicsConnectorManager.remove(physicsConnector);
    }
}
