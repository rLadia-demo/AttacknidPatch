/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.Contact;
import com.badlogic.gdx.physics.box2d.ContactFilter;
import com.badlogic.gdx.physics.box2d.ContactListener;
import com.badlogic.gdx.physics.box2d.DestructionListener;
import com.badlogic.gdx.physics.box2d.Filter;
import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.physics.box2d.Joint;
import com.badlogic.gdx.physics.box2d.JointDef;
import com.badlogic.gdx.physics.box2d.JointEdge;
import com.badlogic.gdx.physics.box2d.QueryCallback;
import com.badlogic.gdx.physics.box2d.WorldManifold;
import com.badlogic.gdx.physics.box2d.joints.DistanceJoint;
import com.badlogic.gdx.physics.box2d.joints.DistanceJointDef;
import com.badlogic.gdx.physics.box2d.joints.FrictionJoint;
import com.badlogic.gdx.physics.box2d.joints.FrictionJointDef;
import com.badlogic.gdx.physics.box2d.joints.GearJoint;
import com.badlogic.gdx.physics.box2d.joints.GearJointDef;
import com.badlogic.gdx.physics.box2d.joints.LineJoint;
import com.badlogic.gdx.physics.box2d.joints.LineJointDef;
import com.badlogic.gdx.physics.box2d.joints.MouseJoint;
import com.badlogic.gdx.physics.box2d.joints.MouseJointDef;
import com.badlogic.gdx.physics.box2d.joints.PrismaticJoint;
import com.badlogic.gdx.physics.box2d.joints.PrismaticJointDef;
import com.badlogic.gdx.physics.box2d.joints.PulleyJoint;
import com.badlogic.gdx.physics.box2d.joints.PulleyJointDef;
import com.badlogic.gdx.physics.box2d.joints.RevoluteJoint;
import com.badlogic.gdx.physics.box2d.joints.RevoluteJointDef;
import com.badlogic.gdx.physics.box2d.joints.WeldJoint;
import com.badlogic.gdx.physics.box2d.joints.WeldJointDef;
import com.badlogic.gdx.utils.LongHashMap;
import java.util.ArrayList;
import java.util.List;

public class World {
    private final long addr;
    protected final LongHashMap<Body> bodies = new LongHashMap<Body>(100);
    private final Contact contact;
    private long[] contactAddrs = new long[200];
    protected ContactFilter contactFilter = null;
    protected ContactListener contactListener = null;
    private final ArrayList<Contact> contacts = new ArrayList<Contact>();
    protected final LongHashMap<Fixture> fixtures = new LongHashMap<Fixture>(100);
    private final ArrayList<Contact> freeContacts = new ArrayList<Contact>();
    private int freeIdx = 0;
    final Vector2 gravity = new Vector2();
    protected final LongHashMap<Joint> joints = new LongHashMap<Joint>(100);
    private QueryCallback queryCallback = null;
    final float[] tmpGravity = new float[2];

    public World(Vector2 vector2, boolean bl) {
        this.contact = new Contact(this, 0);
        this.addr = this.newWorld(vector2.x, vector2.y, bl);
        int n = 0;
        while (n < 200) {
            this.freeContacts.add(new Contact(this, 0));
            ++n;
        }
        return;
    }

    private void beginContact(long l) {
        this.contact.addr = l;
        if (this.contactListener == null) return;
        this.contactListener.beginContact(this.contact);
    }

    /*
     * Enabled aggressive block sorting
     */
    private boolean contactFilter(long l, long l2) {
        boolean bl = true;
        if (this.contactFilter != null) {
            return this.contactFilter.shouldCollide(this.fixtures.get(l), this.fixtures.get(l2));
        }
        Filter filter = this.fixtures.get(l).getFilterData();
        Filter filter2 = this.fixtures.get(l2).getFilterData();
        if (filter.groupIndex == filter2.groupIndex && filter.groupIndex != 0) {
            if (filter.groupIndex > 0) return bl;
            return false;
        }
        if ((filter.maskBits & filter2.categoryBits) == 0) return false;
        if ((filter.categoryBits & filter2.maskBits) == 0) return false;
        return bl;
    }

    private long createProperJoint(JointDef jointDef) {
        if (jointDef.type == JointDef.JointType.DistanceJoint) {
            DistanceJointDef distanceJointDef = (DistanceJointDef)jointDef;
            return this.jniCreateDistanceJoint(this.addr, distanceJointDef.bodyA.addr, distanceJointDef.bodyB.addr, distanceJointDef.collideConnected, distanceJointDef.localAnchorA.x, distanceJointDef.localAnchorA.y, distanceJointDef.localAnchorB.x, distanceJointDef.localAnchorB.y, distanceJointDef.length, distanceJointDef.frequencyHz, distanceJointDef.dampingRatio);
        }
        if (jointDef.type == JointDef.JointType.FrictionJoint) {
            FrictionJointDef frictionJointDef = (FrictionJointDef)jointDef;
            return this.jniCreateFrictionJoint(this.addr, frictionJointDef.bodyA.addr, frictionJointDef.bodyB.addr, frictionJointDef.collideConnected, frictionJointDef.localAnchorA.x, frictionJointDef.localAnchorA.y, frictionJointDef.localAnchorB.x, frictionJointDef.localAnchorB.y, frictionJointDef.maxForce, frictionJointDef.maxTorque);
        }
        if (jointDef.type == JointDef.JointType.GearJoint) {
            GearJointDef gearJointDef = (GearJointDef)jointDef;
            return this.jniCreateGearJoint(this.addr, gearJointDef.bodyA.addr, gearJointDef.bodyB.addr, gearJointDef.collideConnected, gearJointDef.joint1.addr, gearJointDef.joint2.addr, gearJointDef.ratio);
        }
        if (jointDef.type == JointDef.JointType.LineJoint) {
            LineJointDef lineJointDef = (LineJointDef)jointDef;
            return this.jniCreateLineJoint(this.addr, lineJointDef.bodyA.addr, lineJointDef.bodyB.addr, lineJointDef.collideConnected, lineJointDef.localAnchorA.x, lineJointDef.localAnchorA.y, lineJointDef.localAnchorB.x, lineJointDef.localAnchorB.y, lineJointDef.localAxisA.x, lineJointDef.localAxisA.y, lineJointDef.enableLimit, lineJointDef.lowerTranslation, lineJointDef.upperTranslation, lineJointDef.enableMotor, lineJointDef.maxMotorForce, lineJointDef.motorSpeed);
        }
        if (jointDef.type == JointDef.JointType.MouseJoint) {
            MouseJointDef mouseJointDef = (MouseJointDef)jointDef;
            return this.jniCreateMouseJoint(this.addr, mouseJointDef.bodyA.addr, mouseJointDef.bodyB.addr, mouseJointDef.collideConnected, mouseJointDef.target.x, mouseJointDef.target.y, mouseJointDef.maxForce, mouseJointDef.frequencyHz, mouseJointDef.dampingRatio);
        }
        if (jointDef.type == JointDef.JointType.PrismaticJoint) {
            PrismaticJointDef prismaticJointDef = (PrismaticJointDef)jointDef;
            return this.jniCreatePrismaticJoint(this.addr, prismaticJointDef.bodyA.addr, prismaticJointDef.bodyB.addr, prismaticJointDef.collideConnected, prismaticJointDef.localAnchorA.x, prismaticJointDef.localAnchorA.y, prismaticJointDef.localAnchorB.x, prismaticJointDef.localAnchorB.y, prismaticJointDef.localAxis1.x, prismaticJointDef.localAxis1.y, prismaticJointDef.referenceAngle, prismaticJointDef.enableLimit, prismaticJointDef.lowerTranslation, prismaticJointDef.upperTranslation, prismaticJointDef.enableMotor, prismaticJointDef.maxMotorForce, prismaticJointDef.motorSpeed);
        }
        if (jointDef.type == JointDef.JointType.PulleyJoint) {
            PulleyJointDef pulleyJointDef = (PulleyJointDef)jointDef;
            return this.jniCreatePulleyJoint(this.addr, pulleyJointDef.bodyA.addr, pulleyJointDef.bodyB.addr, pulleyJointDef.collideConnected, pulleyJointDef.groundAnchorA.x, pulleyJointDef.groundAnchorA.y, pulleyJointDef.groundAnchorB.x, pulleyJointDef.groundAnchorB.y, pulleyJointDef.localAnchorA.x, pulleyJointDef.localAnchorA.y, pulleyJointDef.localAnchorB.x, pulleyJointDef.localAnchorB.y, pulleyJointDef.lengthA, pulleyJointDef.maxLengthA, pulleyJointDef.lengthB, pulleyJointDef.maxLengthB, pulleyJointDef.ratio);
        }
        if (jointDef.type == JointDef.JointType.RevoluteJoint) {
            RevoluteJointDef revoluteJointDef = (RevoluteJointDef)jointDef;
            return this.jniCreateRevoluteJoint(this.addr, revoluteJointDef.bodyA.addr, revoluteJointDef.bodyB.addr, revoluteJointDef.collideConnected, revoluteJointDef.localAnchorA.x, revoluteJointDef.localAnchorA.y, revoluteJointDef.localAnchorB.x, revoluteJointDef.localAnchorB.y, revoluteJointDef.referenceAngle, revoluteJointDef.enableLimit, revoluteJointDef.lowerAngle, revoluteJointDef.upperAngle, revoluteJointDef.enableMotor, revoluteJointDef.motorSpeed, revoluteJointDef.maxMotorTorque);
        }
        if (jointDef.type != JointDef.JointType.WeldJoint) return 0;
        WeldJointDef weldJointDef = (WeldJointDef)jointDef;
        return this.jniCreateWeldJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.referenceAngle);
    }

    private void endContact(long l) {
        this.contact.addr = l;
        this.contact.GetWorldManifold();
        if (this.contactListener == null) return;
        this.contactListener.endContact(this.contact);
    }

    private native void jniClearForces(long var1);

    private native long jniCreateBody(long var1, int var3, float var4, float var5, float var6, float var7, float var8, float var9, float var10, float var11, boolean var12, boolean var13, boolean var14, boolean var15, boolean var16, float var17);

    private native long jniCreateDistanceJoint(long var1, long var3, long var5, boolean var7, float var8, float var9, float var10, float var11, float var12, float var13, float var14);

    private native long jniCreateFrictionJoint(long var1, long var3, long var5, boolean var7, float var8, float var9, float var10, float var11, float var12, float var13);

    private native long jniCreateGearJoint(long var1, long var3, long var5, boolean var7, long var8, long var10, float var12);

    private native long jniCreateLineJoint(long var1, long var3, long var5, boolean var7, float var8, float var9, float var10, float var11, float var12, float var13, boolean var14, float var15, float var16, boolean var17, float var18, float var19);

    private native long jniCreateMouseJoint(long var1, long var3, long var5, boolean var7, float var8, float var9, float var10, float var11, float var12);

    private native long jniCreatePrismaticJoint(long var1, long var3, long var5, boolean var7, float var8, float var9, float var10, float var11, float var12, float var13, float var14, boolean var15, float var16, float var17, boolean var18, float var19, float var20);

    private native long jniCreatePulleyJoint(long var1, long var3, long var5, boolean var7, float var8, float var9, float var10, float var11, float var12, float var13, float var14, float var15, float var16, float var17, float var18, float var19, float var20);

    private native long jniCreateRevoluteJoint(long var1, long var3, long var5, boolean var7, float var8, float var9, float var10, float var11, float var12, boolean var13, float var14, float var15, boolean var16, float var17, float var18);

    private native long jniCreateWeldJoint(long var1, long var3, long var5, boolean var7, float var8, float var9, float var10, float var11, float var12);

    private native void jniDestroyBody(long var1, long var3);

    private native void jniDestroyJoint(long var1, long var3);

    private native void jniDispose(long var1);

    private native boolean jniGetAutoClearForces(long var1);

    private native int jniGetBodyCount(long var1);

    private native int jniGetContactCount(long var1);

    private native void jniGetContactList(long var1, long[] var3);

    private native void jniGetGravity(long var1, float[] var3);

    private native int jniGetJointcount(long var1);

    private native int jniGetProxyCount(long var1);

    private native boolean jniIsLocked(long var1);

    private native void jniQueryAABB(long var1, float var3, float var4, float var5, float var6);

    private native void jniSetAutoClearForces(long var1, boolean var3);

    private native void jniSetContiousPhysics(long var1, boolean var3);

    private native void jniSetGravity(long var1, float var3, float var4);

    private native void jniSetWarmStarting(long var1, boolean var3);

    private native void jniStep(long var1, float var3, int var4, int var5);

    private native long newWorld(float var1, float var2, boolean var3);

    private boolean reportFixture(long l) {
        if (this.queryCallback == null) return false;
        return this.queryCallback.reportFixture(this.fixtures.get(l));
    }

    public void QueryAABB(QueryCallback queryCallback, float f, float f2, float f3, float f4) {
        this.queryCallback = queryCallback;
        this.jniQueryAABB(this.addr, f, f2, f3, f4);
    }

    public void clearForces() {
        this.jniClearForces(this.addr);
    }

    public Body createBody(BodyDef bodyDef) {
        Body body = new Body(this, this.jniCreateBody(this.addr, bodyDef.type.getValue(), bodyDef.position.x, bodyDef.position.y, bodyDef.angle, bodyDef.linearVelocity.x, bodyDef.linearVelocity.y, bodyDef.angularVelocity, bodyDef.linearDamping, bodyDef.angularDamping, bodyDef.allowSleep, bodyDef.awake, bodyDef.fixedRotation, bodyDef.bullet, bodyDef.active, bodyDef.inertiaScale));
        this.bodies.put(body.addr, body);
        return body;
    }

    public Joint createJoint(JointDef jointDef) {
        long l = this.createProperJoint(jointDef);
        JointDef.JointType jointType = jointDef.type;
        JointDef.JointType jointType2 = JointDef.JointType.DistanceJoint;
        Joint joint = null;
        if (jointType == jointType2) {
            joint = new DistanceJoint(this, l);
        }
        if (jointDef.type == JointDef.JointType.FrictionJoint) {
            joint = new FrictionJoint(this, l);
        }
        if (jointDef.type == JointDef.JointType.GearJoint) {
            joint = new GearJoint(this, l);
        }
        if (jointDef.type == JointDef.JointType.LineJoint) {
            joint = new LineJoint(this, l);
        }
        if (jointDef.type == JointDef.JointType.MouseJoint) {
            joint = new MouseJoint(this, l);
        }
        if (jointDef.type == JointDef.JointType.PrismaticJoint) {
            joint = new PrismaticJoint(this, l);
        }
        if (jointDef.type == JointDef.JointType.PulleyJoint) {
            joint = new PulleyJoint(this, l);
        }
        if (jointDef.type == JointDef.JointType.RevoluteJoint) {
            joint = new RevoluteJoint(this, l);
        }
        if (jointDef.type == JointDef.JointType.WeldJoint) {
            joint = new WeldJoint(this, l);
        }
        if (joint != null) {
            this.joints.put(joint.addr, joint);
        }
        JointEdge jointEdge = new JointEdge(jointDef.bodyB, joint);
        JointEdge jointEdge2 = new JointEdge(jointDef.bodyA, joint);
        joint.jointEdgeA = jointEdge;
        joint.jointEdgeB = jointEdge2;
        jointDef.bodyA.joints.add(jointEdge);
        jointDef.bodyB.joints.add(jointEdge2);
        return joint;
    }

    /*
     * Enabled aggressive block sorting
     */
    public void destroyBody(Body body) {
        this.bodies.remove(body.addr);
        int n = 0;
        do {
            if (n >= body.getFixtureList().size()) break;
            this.fixtures.remove(body.getFixtureList().get((int)n).addr);
            ++n;
        } while (true);
        for (int i = 0; i < body.getJointList().size(); ++i) {
            this.joints.remove(body.getJointList().get((int)i).joint.addr);
        }
        this.jniDestroyBody(this.addr, body.addr);
    }

    public void destroyJoint(Joint joint) {
        this.joints.remove(joint.addr);
        joint.jointEdgeA.other.joints.remove(joint.jointEdgeB);
        joint.jointEdgeB.other.joints.remove(joint.jointEdgeA);
        this.jniDestroyJoint(this.addr, joint.addr);
    }

    public void dispose() {
        this.jniDispose(this.addr);
    }

    public boolean getAutoClearForces() {
        return this.jniGetAutoClearForces(this.addr);
    }

    public Iterable<Body> getBodies() {
        return this.bodies.values();
    }

    public int getBodyCount() {
        return this.jniGetBodyCount(this.addr);
    }

    public int getContactCount() {
        return this.jniGetContactCount(this.addr);
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     */
    public List<Contact> getContactList() {
        var1_1 = this.getContactCount();
        if (var1_1 > this.contactAddrs.length) {
            this.contactAddrs = new long[var1_1];
        }
        ** if (var1_1 <= this.freeContacts.size()) goto lbl-1000
lbl5: // 1 sources:
        var5_2 = this.freeContacts.size();
        var6_3 = 0;
        do {
            if (var6_3 >= var1_1 - var5_2) lbl-1000: // 2 sources:
            {
                this.jniGetContactList(this.addr, this.contactAddrs);
                break;
            }
            this.freeContacts.add(new Contact(this, 0));
            ++var6_3;
        } while (true);
        this.contacts.clear();
        for (var2_4 = 0; var2_4 < var1_1; ++var2_4) {
            var3_5 = this.freeContacts.get(var2_4);
            var3_5.addr = this.contactAddrs[var2_4];
            this.contacts.add(var3_5);
        }
        return this.contacts;
    }

    public Vector2 getGravity() {
        this.jniGetGravity(this.addr, this.tmpGravity);
        this.gravity.x = this.tmpGravity[0];
        this.gravity.y = this.tmpGravity[1];
        return this.gravity;
    }

    public int getJointCount() {
        return this.jniGetJointcount(this.addr);
    }

    public Iterable<Joint> getJoints() {
        return this.joints.values();
    }

    public int getProxyCount() {
        return this.jniGetProxyCount(this.addr);
    }

    public boolean isLocked() {
        return this.jniIsLocked(this.addr);
    }

    public void setAutoClearForces(boolean bl) {
        this.jniSetAutoClearForces(this.addr, bl);
    }

    public void setContactFilter(ContactFilter contactFilter) {
        this.contactFilter = contactFilter;
    }

    public void setContactListener(ContactListener contactListener) {
        this.contactListener = contactListener;
    }

    public void setContinuousPhysics(boolean bl) {
        this.jniSetContiousPhysics(this.addr, bl);
    }

    public void setDestructionListener(DestructionListener destructionListener) {
    }

    public void setGravity(Vector2 vector2) {
        this.jniSetGravity(this.addr, vector2.x, vector2.y);
    }

    public void setWarmStarting(boolean bl) {
        this.jniSetWarmStarting(this.addr, bl);
    }

    public void step(float f, int n, int n2) {
        this.jniStep(this.addr, f, n, n2);
    }
}

