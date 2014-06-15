package com.badlogic.gdx.physics.box2d;

import java.util.*;
import com.badlogic.gdx.math.*;

public class Body
{
    protected final long addr;
    private ArrayList<Fixture> fixtures;
    protected ArrayList<JointEdge> joints;
    public final Vector2 linVelLoc;
    public final Vector2 linVelWorld;
    private final Vector2 linearVelocity;
    private final Vector2 localCenter;
    private final Vector2 localPoint;
    public final Vector2 localPoint2;
    public final Vector2 localVector;
    private final MassData massData;
    private final Vector2 position;
    private final float[] tmp;
    private final Transform transform;
    private Object userData;
    private final World world;
    private final Vector2 worldCenter;
    private final Vector2 worldVector;
    
    protected Body(final World world, final long addr) {
        super();
        this.tmp = new float[4];
        this.fixtures = new ArrayList<Fixture>(2);
        this.joints = new ArrayList<JointEdge>(2);
        this.transform = new Transform();
        this.position = new Vector2();
        this.worldCenter = new Vector2();
        this.localCenter = new Vector2();
        this.linearVelocity = new Vector2();
        this.massData = new MassData();
        this.localPoint = new Vector2();
        this.worldVector = new Vector2();
        this.localPoint2 = new Vector2();
        this.localVector = new Vector2();
        this.linVelWorld = new Vector2();
        this.linVelLoc = new Vector2();
        this.world = world;
        this.addr = addr;
    }
    
    private native void jniApplyAngularImpulse(final long p0, final float p1);
    
    private native void jniApplyForce(final long p0, final float p1, final float p2, final float p3, final float p4);
    
    private native void jniApplyLinearImpulse(final long p0, final float p1, final float p2, final float p3, final float p4);
    
    private native void jniApplyTorque(final long p0, final float p1);
    
    private native long jniCreateFixture(final long p0, final long p1, final float p2);
    
    private native long jniCreateFixture(final long p0, final long p1, final float p2, final float p3, final float p4, final boolean p5, final short p6, final short p7, final short p8);
    
    private native void jniDestroyFixture(final long p0, final long p1);
    
    private native float jniGetAngle(final long p0);
    
    private native float jniGetAngularDamping(final long p0);
    
    private native float jniGetAngularVelocity(final long p0);
    
    private native float jniGetInertia(final long p0);
    
    private native float jniGetLinearDamping(final long p0);
    
    private native void jniGetLinearVelocity(final long p0, final float[] p1);
    
    private native void jniGetLinearVelocityFromLocalPoint(final long p0, final float p1, final float p2, final float[] p3);
    
    private native void jniGetLinearVelocityFromWorldPoint(final long p0, final float p1, final float p2, final float[] p3);
    
    private native void jniGetLocalCenter(final long p0, final float[] p1);
    
    private native void jniGetLocalPoint(final long p0, final float p1, final float p2, final float[] p3);
    
    private native void jniGetLocalVector(final long p0, final float p1, final float p2, final float[] p3);
    
    private native float jniGetMass(final long p0);
    
    private native void jniGetMassData(final long p0, final float[] p1);
    
    private native void jniGetPosition(final long p0, final float[] p1);
    
    private native void jniGetTransform(final long p0, final float[] p1);
    
    private native int jniGetType(final long p0);
    
    private native void jniGetWorldCenter(final long p0, final float[] p1);
    
    private native void jniGetWorldPoint(final long p0, final float p1, final float p2, final float[] p3);
    
    private native void jniGetWorldVector(final long p0, final float p1, final float p2, final float[] p3);
    
    private native boolean jniIsActive(final long p0);
    
    private native boolean jniIsAwake(final long p0);
    
    private native boolean jniIsBullet(final long p0);
    
    private native boolean jniIsFixedRotation(final long p0);
    
    private native boolean jniIsSleepingAllowed(final long p0);
    
    private native void jniResetMassData(final long p0);
    
    private native void jniSetActive(final long p0, final boolean p1);
    
    private native void jniSetAngularDamping(final long p0, final float p1);
    
    private native void jniSetAngularVelocity(final long p0, final float p1);
    
    private native void jniSetAwake(final long p0, final boolean p1);
    
    private native void jniSetBullet(final long p0, final boolean p1);
    
    private native void jniSetFixedRotation(final long p0, final boolean p1);
    
    private native void jniSetLinearDamping(final long p0, final float p1);
    
    private native void jniSetLinearVelocity(final long p0, final float p1, final float p2);
    
    private native void jniSetMassData(final long p0, final float p1, final float p2, final float p3, final float p4);
    
    private native void jniSetSleepingAllowed(final long p0, final boolean p1);
    
    private native void jniSetTransform(final long p0, final float p1, final float p2, final float p3);
    
    private native void jniSetType(final long p0, final int p1);
    
    public void applyAngularImpulse(final float n) {
        this.jniApplyAngularImpulse(this.addr, n);
    }
    
    public void applyForce(final Vector2 vector2, final Vector2 vector2) {
        this.jniApplyForce(this.addr, vector2.x, vector2.y, vector2.x, vector2.y);
    }
    
    public void applyLinearImpulse(final Vector2 vector2, final Vector2 vector2) {
        this.jniApplyLinearImpulse(this.addr, vector2.x, vector2.y, vector2.x, vector2.y);
    }
    
    public void applyTorque(final float n) {
        this.jniApplyTorque(this.addr, n);
    }
    
    public Fixture createFixture(final FixtureDef fixtureDef) {
        final Fixture fixture = new Fixture(this.world, this, this.jniCreateFixture(this.addr, fixtureDef.shape.addr, fixtureDef.friction, fixtureDef.restitution, fixtureDef.density, fixtureDef.isSensor, fixtureDef.filter.categoryBits, fixtureDef.filter.maskBits, fixtureDef.filter.groupIndex));
        this.world.fixtures.put(fixture.addr, fixture);
        this.fixtures.add(fixture);
        return fixture;
    }
    
    public Fixture createFixture(final Shape shape, final float n) {
        final Fixture fixture = new Fixture(this.world, this, this.jniCreateFixture(this.addr, shape.addr, n));
        this.world.fixtures.put(fixture.addr, fixture);
        this.fixtures.add(fixture);
        return fixture;
    }
    
    public void destroyFixture(final Fixture fixture) {
        this.jniDestroyFixture(this.addr, fixture.addr);
        this.world.fixtures.remove(fixture.addr);
        this.fixtures.remove(fixture);
    }
    
    public float getAngle() {
        return this.jniGetAngle(this.addr);
    }
    
    public float getAngularDamping() {
        return this.jniGetAngularDamping(this.addr);
    }
    
    public float getAngularVelocity() {
        return this.jniGetAngularVelocity(this.addr);
    }
    
    public ArrayList<Fixture> getFixtureList() {
        return this.fixtures;
    }
    
    public float getInertia() {
        return this.jniGetInertia(this.addr);
    }
    
    public ArrayList<JointEdge> getJointList() {
        return this.joints;
    }
    
    public float getLinearDamping() {
        return this.jniGetLinearDamping(this.addr);
    }
    
    public Vector2 getLinearVelocity() {
        this.jniGetLinearVelocity(this.addr, this.tmp);
        this.linearVelocity.x = this.tmp[0];
        this.linearVelocity.y = this.tmp[1];
        return this.linearVelocity;
    }
    
    public Vector2 getLinearVelocityFromLocalPoint(final Vector2 vector2) {
        this.jniGetLinearVelocityFromLocalPoint(this.addr, vector2.x, vector2.y, this.tmp);
        this.linVelLoc.x = this.tmp[0];
        this.linVelLoc.y = this.tmp[1];
        return this.linVelLoc;
    }
    
    public Vector2 getLinearVelocityFromWorldPoint(final Vector2 vector2) {
        this.jniGetLinearVelocityFromWorldPoint(this.addr, vector2.x, vector2.y, this.tmp);
        this.linVelWorld.x = this.tmp[0];
        this.linVelWorld.y = this.tmp[1];
        return this.linVelWorld;
    }
    
    public Vector2 getLocalCenter() {
        this.jniGetLocalCenter(this.addr, this.tmp);
        this.localCenter.x = this.tmp[0];
        this.localCenter.y = this.tmp[1];
        return this.localCenter;
    }
    
    public Vector2 getLocalPoint(final Vector2 vector2) {
        this.jniGetLocalPoint(this.addr, vector2.x, vector2.y, this.tmp);
        this.localPoint2.x = this.tmp[0];
        this.localPoint2.y = this.tmp[1];
        return this.localPoint2;
    }
    
    public Vector2 getLocalVector(final Vector2 vector2) {
        this.jniGetLocalVector(this.addr, vector2.x, vector2.y, this.tmp);
        this.localVector.x = this.tmp[0];
        this.localVector.y = this.tmp[1];
        return this.localVector;
    }
    
    public float getMass() {
        return this.jniGetMass(this.addr);
    }
    
    public MassData getMassData() {
        this.jniGetMassData(this.addr, this.tmp);
        this.massData.mass = this.tmp[0];
        this.massData.center.x = this.tmp[1];
        this.massData.center.y = this.tmp[2];
        this.massData.I = this.tmp[3];
        return this.massData;
    }
    
    public Vector2 getPosition() {
        this.jniGetPosition(this.addr, this.tmp);
        this.position.x = this.tmp[0];
        this.position.y = this.tmp[1];
        return this.position;
    }
    
    public Transform getTransform() {
        this.jniGetTransform(this.addr, this.transform.vals);
        return this.transform;
    }
    
    public BodyDef.BodyType getType() {
        final int jniGetType = this.jniGetType(this.addr);
        if (jniGetType == 0) {
            return BodyDef.BodyType.StaticBody;
        }
        if (jniGetType == 1) {
            return BodyDef.BodyType.KinematicBody;
        }
        if (jniGetType == 2) {
            return BodyDef.BodyType.DynamicBody;
        }
        return BodyDef.BodyType.StaticBody;
    }
    
    public Object getUserData() {
        return this.userData;
    }
    
    public World getWorld() {
        return this.world;
    }
    
    public Vector2 getWorldCenter() {
        this.jniGetWorldCenter(this.addr, this.tmp);
        this.worldCenter.x = this.tmp[0];
        this.worldCenter.y = this.tmp[1];
        return this.worldCenter;
    }
    
    public Vector2 getWorldPoint(final Vector2 vector2) {
        this.jniGetWorldPoint(this.addr, vector2.x, vector2.y, this.tmp);
        this.localPoint.x = this.tmp[0];
        this.localPoint.y = this.tmp[1];
        return this.localPoint;
    }
    
    public Vector2 getWorldVector(final Vector2 vector2) {
        this.jniGetWorldVector(this.addr, vector2.x, vector2.y, this.tmp);
        this.worldVector.x = this.tmp[0];
        this.worldVector.y = this.tmp[1];
        return this.worldVector;
    }
    
    public boolean isActive() {
        return this.jniIsActive(this.addr);
    }
    
    public boolean isAwake() {
        return this.jniIsAwake(this.addr);
    }
    
    public boolean isBullet() {
        return this.jniIsBullet(this.addr);
    }
    
    public boolean isFixedRotation() {
        return this.jniIsFixedRotation(this.addr);
    }
    
    public boolean isSleepingAllowed() {
        return this.jniIsSleepingAllowed(this.addr);
    }
    
    public void resetMassData() {
        this.jniResetMassData(this.addr);
    }
    
    public void setActive(final boolean b) {
        this.jniSetActive(this.addr, b);
    }
    
    public void setAngularDamping(final float n) {
        this.jniSetAngularDamping(this.addr, n);
    }
    
    public void setAngularVelocity(final float n) {
        this.jniSetAngularVelocity(this.addr, n);
    }
    
    public void setAwake(final boolean b) {
        this.jniSetAwake(this.addr, b);
    }
    
    public void setBullet(final boolean b) {
        this.jniSetBullet(this.addr, b);
    }
    
    public void setFixedRotation(final boolean b) {
        this.jniSetFixedRotation(this.addr, b);
    }
    
    public void setLinearDamping(final float n) {
        this.jniSetLinearDamping(this.addr, n);
    }
    
    public void setLinearVelocity(final Vector2 vector2) {
        this.jniSetLinearVelocity(this.addr, vector2.x, vector2.y);
    }
    
    public void setMassData(final MassData massData) {
        this.jniSetMassData(this.addr, massData.mass, massData.center.x, massData.center.y, massData.I);
    }
    
    public void setSleepingAllowed(final boolean b) {
        this.jniSetSleepingAllowed(this.addr, b);
    }
    
    public void setTransform(final Vector2 vector2, final float n) {
        this.jniSetTransform(this.addr, vector2.x, vector2.y, n);
    }
    
    public void setType(final BodyDef.BodyType bodyType) {
        this.jniSetType(this.addr, bodyType.getValue());
    }
    
    public void setUserData(final Object userData) {
        this.userData = userData;
    }
}
