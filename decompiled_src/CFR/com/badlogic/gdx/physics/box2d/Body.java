/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.physics.box2d.FixtureDef;
import com.badlogic.gdx.physics.box2d.JointEdge;
import com.badlogic.gdx.physics.box2d.MassData;
import com.badlogic.gdx.physics.box2d.Shape;
import com.badlogic.gdx.physics.box2d.Transform;
import com.badlogic.gdx.physics.box2d.World;
import com.badlogic.gdx.utils.LongHashMap;
import java.util.ArrayList;

public class Body {
    protected final long addr;
    private ArrayList<Fixture> fixtures = new ArrayList<Fixture>(2);
    protected ArrayList<JointEdge> joints = new ArrayList<JointEdge>(2);
    public final Vector2 linVelLoc = new Vector2();
    public final Vector2 linVelWorld = new Vector2();
    private final Vector2 linearVelocity = new Vector2();
    private final Vector2 localCenter = new Vector2();
    private final Vector2 localPoint = new Vector2();
    public final Vector2 localPoint2 = new Vector2();
    public final Vector2 localVector = new Vector2();
    private final MassData massData = new MassData();
    private final Vector2 position = new Vector2();
    private final float[] tmp = new float[4];
    private final Transform transform = new Transform();
    private Object userData;
    private final World world;
    private final Vector2 worldCenter = new Vector2();
    private final Vector2 worldVector = new Vector2();

    protected Body(World world, long l) {
        this.world = world;
        this.addr = l;
    }

    private native void jniApplyAngularImpulse(long var1, float var3);

    private native void jniApplyForce(long var1, float var3, float var4, float var5, float var6);

    private native void jniApplyLinearImpulse(long var1, float var3, float var4, float var5, float var6);

    private native void jniApplyTorque(long var1, float var3);

    private native long jniCreateFixture(long var1, long var3, float var5);

    private native long jniCreateFixture(long var1, long var3, float var5, float var6, float var7, boolean var8, short var9, short var10, short var11);

    private native void jniDestroyFixture(long var1, long var3);

    private native float jniGetAngle(long var1);

    private native float jniGetAngularDamping(long var1);

    private native float jniGetAngularVelocity(long var1);

    private native float jniGetInertia(long var1);

    private native float jniGetLinearDamping(long var1);

    private native void jniGetLinearVelocity(long var1, float[] var3);

    private native void jniGetLinearVelocityFromLocalPoint(long var1, float var3, float var4, float[] var5);

    private native void jniGetLinearVelocityFromWorldPoint(long var1, float var3, float var4, float[] var5);

    private native void jniGetLocalCenter(long var1, float[] var3);

    private native void jniGetLocalPoint(long var1, float var3, float var4, float[] var5);

    private native void jniGetLocalVector(long var1, float var3, float var4, float[] var5);

    private native float jniGetMass(long var1);

    private native void jniGetMassData(long var1, float[] var3);

    private native void jniGetPosition(long var1, float[] var3);

    private native void jniGetTransform(long var1, float[] var3);

    private native int jniGetType(long var1);

    private native void jniGetWorldCenter(long var1, float[] var3);

    private native void jniGetWorldPoint(long var1, float var3, float var4, float[] var5);

    private native void jniGetWorldVector(long var1, float var3, float var4, float[] var5);

    private native boolean jniIsActive(long var1);

    private native boolean jniIsAwake(long var1);

    private native boolean jniIsBullet(long var1);

    private native boolean jniIsFixedRotation(long var1);

    private native boolean jniIsSleepingAllowed(long var1);

    private native void jniResetMassData(long var1);

    private native void jniSetActive(long var1, boolean var3);

    private native void jniSetAngularDamping(long var1, float var3);

    private native void jniSetAngularVelocity(long var1, float var3);

    private native void jniSetAwake(long var1, boolean var3);

    private native void jniSetBullet(long var1, boolean var3);

    private native void jniSetFixedRotation(long var1, boolean var3);

    private native void jniSetLinearDamping(long var1, float var3);

    private native void jniSetLinearVelocity(long var1, float var3, float var4);

    private native void jniSetMassData(long var1, float var3, float var4, float var5, float var6);

    private native void jniSetSleepingAllowed(long var1, boolean var3);

    private native void jniSetTransform(long var1, float var3, float var4, float var5);

    private native void jniSetType(long var1, int var3);

    public void applyAngularImpulse(float f) {
        this.jniApplyAngularImpulse(this.addr, f);
    }

    public void applyForce(Vector2 vector2, Vector2 vector22) {
        this.jniApplyForce(this.addr, vector2.x, vector2.y, vector22.x, vector22.y);
    }

    public void applyLinearImpulse(Vector2 vector2, Vector2 vector22) {
        this.jniApplyLinearImpulse(this.addr, vector2.x, vector2.y, vector22.x, vector22.y);
    }

    public void applyTorque(float f) {
        this.jniApplyTorque(this.addr, f);
    }

    public Fixture createFixture(FixtureDef fixtureDef) {
        Fixture fixture = new Fixture(this.world, this, this.jniCreateFixture(this.addr, fixtureDef.shape.addr, fixtureDef.friction, fixtureDef.restitution, fixtureDef.density, fixtureDef.isSensor, fixtureDef.filter.categoryBits, fixtureDef.filter.maskBits, fixtureDef.filter.groupIndex));
        this.world.fixtures.put(fixture.addr, fixture);
        this.fixtures.add(fixture);
        return fixture;
    }

    public Fixture createFixture(Shape shape, float f) {
        Fixture fixture = new Fixture(this.world, this, this.jniCreateFixture(this.addr, shape.addr, f));
        this.world.fixtures.put(fixture.addr, fixture);
        this.fixtures.add(fixture);
        return fixture;
    }

    public void destroyFixture(Fixture fixture) {
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

    public Vector2 getLinearVelocityFromLocalPoint(Vector2 vector2) {
        this.jniGetLinearVelocityFromLocalPoint(this.addr, vector2.x, vector2.y, this.tmp);
        this.linVelLoc.x = this.tmp[0];
        this.linVelLoc.y = this.tmp[1];
        return this.linVelLoc;
    }

    public Vector2 getLinearVelocityFromWorldPoint(Vector2 vector2) {
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

    public Vector2 getLocalPoint(Vector2 vector2) {
        this.jniGetLocalPoint(this.addr, vector2.x, vector2.y, this.tmp);
        this.localPoint2.x = this.tmp[0];
        this.localPoint2.y = this.tmp[1];
        return this.localPoint2;
    }

    public Vector2 getLocalVector(Vector2 vector2) {
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

    public ef$BodyType getType() {
        int n = this.jniGetType(this.addr);
        if (n == 0) {
            return ef$BodyType.StaticBody;
        }
        if (n == 1) {
            return ef$BodyType.KinematicBody;
        }
        if (n != 2) return ef$BodyType.StaticBody;
        return ef$BodyType.DynamicBody;
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

    public Vector2 getWorldPoint(Vector2 vector2) {
        this.jniGetWorldPoint(this.addr, vector2.x, vector2.y, this.tmp);
        this.localPoint.x = this.tmp[0];
        this.localPoint.y = this.tmp[1];
        return this.localPoint;
    }

    public Vector2 getWorldVector(Vector2 vector2) {
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

    public void setActive(boolean bl) {
        this.jniSetActive(this.addr, bl);
    }

    public void setAngularDamping(float f) {
        this.jniSetAngularDamping(this.addr, f);
    }

    public void setAngularVelocity(float f) {
        this.jniSetAngularVelocity(this.addr, f);
    }

    public void setAwake(boolean bl) {
        this.jniSetAwake(this.addr, bl);
    }

    public void setBullet(boolean bl) {
        this.jniSetBullet(this.addr, bl);
    }

    public void setFixedRotation(boolean bl) {
        this.jniSetFixedRotation(this.addr, bl);
    }

    public void setLinearDamping(float f) {
        this.jniSetLinearDamping(this.addr, f);
    }

    public void setLinearVelocity(Vector2 vector2) {
        this.jniSetLinearVelocity(this.addr, vector2.x, vector2.y);
    }

    public void setMassData(MassData massData) {
        this.jniSetMassData(this.addr, massData.mass, massData.center.x, massData.center.y, massData.I);
    }

    public void setSleepingAllowed(boolean bl) {
        this.jniSetSleepingAllowed(this.addr, bl);
    }

    public void setTransform(Vector2 vector2, float f) {
        this.jniSetTransform(this.addr, vector2.x, vector2.y, f);
    }

    public void setType(ef$BodyType bodyType) {
        this.jniSetType(this.addr, bodyType.getValue());
    }

    public void setUserData(Object object) {
        this.userData = object;
    }
}

