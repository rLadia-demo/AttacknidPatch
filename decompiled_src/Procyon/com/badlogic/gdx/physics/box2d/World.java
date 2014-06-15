package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.utils.*;
import com.badlogic.gdx.math.*;
import com.badlogic.gdx.physics.box2d.joints.*;
import java.util.*;

public class World
{
    private final long addr;
    protected final LongHashMap<Body> bodies;
    private final Contact contact;
    private long[] contactAddrs;
    protected ContactFilter contactFilter;
    protected ContactListener contactListener;
    private final ArrayList<Contact> contacts;
    protected final LongHashMap<Fixture> fixtures;
    private final ArrayList<Contact> freeContacts;
    private int freeIdx;
    final Vector2 gravity;
    protected final LongHashMap<Joint> joints;
    private QueryCallback queryCallback;
    final float[] tmpGravity;
    
    public World(final Vector2 vector2, final boolean b) {
        super();
        this.bodies = new LongHashMap<Body>(100);
        this.fixtures = new LongHashMap<Fixture>(100);
        this.joints = new LongHashMap<Joint>(100);
        this.contactFilter = null;
        this.contactListener = null;
        this.tmpGravity = new float[2];
        this.gravity = new Vector2();
        this.queryCallback = null;
        this.contactAddrs = new long[200];
        this.contacts = new ArrayList<Contact>();
        this.freeContacts = new ArrayList<Contact>();
        this.freeIdx = 0;
        this.contact = new Contact(this, 0L);
        this.addr = this.newWorld(vector2.x, vector2.y, b);
        for (int i = 0; i < 200; ++i) {
            this.freeContacts.add(new Contact(this, 0L));
        }
    }
    
    private void beginContact(final long addr) {
        this.contact.addr = addr;
        if (this.contactListener != null) {
            this.contactListener.beginContact(this.contact);
        }
    }
    
    private boolean contactFilter(final long n, final long n2) {
        boolean shouldCollide = true;
        if (this.contactFilter != null) {
            shouldCollide = this.contactFilter.shouldCollide(this.fixtures.get(n), this.fixtures.get(n2));
        }
        else {
            final Filter filterData = this.fixtures.get(n).getFilterData();
            final Filter filterData2 = this.fixtures.get(n2).getFilterData();
            if (filterData.groupIndex != filterData2.groupIndex || filterData.groupIndex == 0) {
                return (filterData.maskBits & filterData2.categoryBits) != 0x0 && (filterData.categoryBits & filterData2.maskBits) != 0x0 && shouldCollide;
            }
            if (filterData.groupIndex <= 0) {
                return false;
            }
        }
        return shouldCollide;
    }
    
    private long createProperJoint(final JointDef jointDef) {
        if (jointDef.type == JointDef.JointType.DistanceJoint) {
            final DistanceJointDef distanceJointDef = (DistanceJointDef)jointDef;
            return this.jniCreateDistanceJoint(this.addr, distanceJointDef.bodyA.addr, distanceJointDef.bodyB.addr, distanceJointDef.collideConnected, distanceJointDef.localAnchorA.x, distanceJointDef.localAnchorA.y, distanceJointDef.localAnchorB.x, distanceJointDef.localAnchorB.y, distanceJointDef.length, distanceJointDef.frequencyHz, distanceJointDef.dampingRatio);
        }
        if (jointDef.type == JointDef.JointType.FrictionJoint) {
            final FrictionJointDef frictionJointDef = (FrictionJointDef)jointDef;
            return this.jniCreateFrictionJoint(this.addr, frictionJointDef.bodyA.addr, frictionJointDef.bodyB.addr, frictionJointDef.collideConnected, frictionJointDef.localAnchorA.x, frictionJointDef.localAnchorA.y, frictionJointDef.localAnchorB.x, frictionJointDef.localAnchorB.y, frictionJointDef.maxForce, frictionJointDef.maxTorque);
        }
        if (jointDef.type == JointDef.JointType.GearJoint) {
            final GearJointDef gearJointDef = (GearJointDef)jointDef;
            return this.jniCreateGearJoint(this.addr, gearJointDef.bodyA.addr, gearJointDef.bodyB.addr, gearJointDef.collideConnected, gearJointDef.joint1.addr, gearJointDef.joint2.addr, gearJointDef.ratio);
        }
        if (jointDef.type == JointDef.JointType.LineJoint) {
            final LineJointDef lineJointDef = (LineJointDef)jointDef;
            return this.jniCreateLineJoint(this.addr, lineJointDef.bodyA.addr, lineJointDef.bodyB.addr, lineJointDef.collideConnected, lineJointDef.localAnchorA.x, lineJointDef.localAnchorA.y, lineJointDef.localAnchorB.x, lineJointDef.localAnchorB.y, lineJointDef.localAxisA.x, lineJointDef.localAxisA.y, lineJointDef.enableLimit, lineJointDef.lowerTranslation, lineJointDef.upperTranslation, lineJointDef.enableMotor, lineJointDef.maxMotorForce, lineJointDef.motorSpeed);
        }
        if (jointDef.type == JointDef.JointType.MouseJoint) {
            final MouseJointDef mouseJointDef = (MouseJointDef)jointDef;
            return this.jniCreateMouseJoint(this.addr, mouseJointDef.bodyA.addr, mouseJointDef.bodyB.addr, mouseJointDef.collideConnected, mouseJointDef.target.x, mouseJointDef.target.y, mouseJointDef.maxForce, mouseJointDef.frequencyHz, mouseJointDef.dampingRatio);
        }
        if (jointDef.type == JointDef.JointType.PrismaticJoint) {
            final PrismaticJointDef prismaticJointDef = (PrismaticJointDef)jointDef;
            return this.jniCreatePrismaticJoint(this.addr, prismaticJointDef.bodyA.addr, prismaticJointDef.bodyB.addr, prismaticJointDef.collideConnected, prismaticJointDef.localAnchorA.x, prismaticJointDef.localAnchorA.y, prismaticJointDef.localAnchorB.x, prismaticJointDef.localAnchorB.y, prismaticJointDef.localAxis1.x, prismaticJointDef.localAxis1.y, prismaticJointDef.referenceAngle, prismaticJointDef.enableLimit, prismaticJointDef.lowerTranslation, prismaticJointDef.upperTranslation, prismaticJointDef.enableMotor, prismaticJointDef.maxMotorForce, prismaticJointDef.motorSpeed);
        }
        if (jointDef.type == JointDef.JointType.PulleyJoint) {
            final PulleyJointDef pulleyJointDef = (PulleyJointDef)jointDef;
            return this.jniCreatePulleyJoint(this.addr, pulleyJointDef.bodyA.addr, pulleyJointDef.bodyB.addr, pulleyJointDef.collideConnected, pulleyJointDef.groundAnchorA.x, pulleyJointDef.groundAnchorA.y, pulleyJointDef.groundAnchorB.x, pulleyJointDef.groundAnchorB.y, pulleyJointDef.localAnchorA.x, pulleyJointDef.localAnchorA.y, pulleyJointDef.localAnchorB.x, pulleyJointDef.localAnchorB.y, pulleyJointDef.lengthA, pulleyJointDef.maxLengthA, pulleyJointDef.lengthB, pulleyJointDef.maxLengthB, pulleyJointDef.ratio);
        }
        if (jointDef.type == JointDef.JointType.RevoluteJoint) {
            final RevoluteJointDef revoluteJointDef = (RevoluteJointDef)jointDef;
            return this.jniCreateRevoluteJoint(this.addr, revoluteJointDef.bodyA.addr, revoluteJointDef.bodyB.addr, revoluteJointDef.collideConnected, revoluteJointDef.localAnchorA.x, revoluteJointDef.localAnchorA.y, revoluteJointDef.localAnchorB.x, revoluteJointDef.localAnchorB.y, revoluteJointDef.referenceAngle, revoluteJointDef.enableLimit, revoluteJointDef.lowerAngle, revoluteJointDef.upperAngle, revoluteJointDef.enableMotor, revoluteJointDef.motorSpeed, revoluteJointDef.maxMotorTorque);
        }
        if (jointDef.type == JointDef.JointType.WeldJoint) {
            final WeldJointDef weldJointDef = (WeldJointDef)jointDef;
            return this.jniCreateWeldJoint(this.addr, weldJointDef.bodyA.addr, weldJointDef.bodyB.addr, weldJointDef.collideConnected, weldJointDef.localAnchorA.x, weldJointDef.localAnchorA.y, weldJointDef.localAnchorB.x, weldJointDef.localAnchorB.y, weldJointDef.referenceAngle);
        }
        return 0L;
    }
    
    private void endContact(final long addr) {
        this.contact.addr = addr;
        this.contact.GetWorldManifold();
        if (this.contactListener != null) {
            this.contactListener.endContact(this.contact);
        }
    }
    
    private native void jniClearForces(final long p0);
    
    private native long jniCreateBody(final long p0, final int p1, final float p2, final float p3, final float p4, final float p5, final float p6, final float p7, final float p8, final float p9, final boolean p10, final boolean p11, final boolean p12, final boolean p13, final boolean p14, final float p15);
    
    private native long jniCreateDistanceJoint(final long p0, final long p1, final long p2, final boolean p3, final float p4, final float p5, final float p6, final float p7, final float p8, final float p9, final float p10);
    
    private native long jniCreateFrictionJoint(final long p0, final long p1, final long p2, final boolean p3, final float p4, final float p5, final float p6, final float p7, final float p8, final float p9);
    
    private native long jniCreateGearJoint(final long p0, final long p1, final long p2, final boolean p3, final long p4, final long p5, final float p6);
    
    private native long jniCreateLineJoint(final long p0, final long p1, final long p2, final boolean p3, final float p4, final float p5, final float p6, final float p7, final float p8, final float p9, final boolean p10, final float p11, final float p12, final boolean p13, final float p14, final float p15);
    
    private native long jniCreateMouseJoint(final long p0, final long p1, final long p2, final boolean p3, final float p4, final float p5, final float p6, final float p7, final float p8);
    
    private native long jniCreatePrismaticJoint(final long p0, final long p1, final long p2, final boolean p3, final float p4, final float p5, final float p6, final float p7, final float p8, final float p9, final float p10, final boolean p11, final float p12, final float p13, final boolean p14, final float p15, final float p16);
    
    private native long jniCreatePulleyJoint(final long p0, final long p1, final long p2, final boolean p3, final float p4, final float p5, final float p6, final float p7, final float p8, final float p9, final float p10, final float p11, final float p12, final float p13, final float p14, final float p15, final float p16);
    
    private native long jniCreateRevoluteJoint(final long p0, final long p1, final long p2, final boolean p3, final float p4, final float p5, final float p6, final float p7, final float p8, final boolean p9, final float p10, final float p11, final boolean p12, final float p13, final float p14);
    
    private native long jniCreateWeldJoint(final long p0, final long p1, final long p2, final boolean p3, final float p4, final float p5, final float p6, final float p7, final float p8);
    
    private native void jniDestroyBody(final long p0, final long p1);
    
    private native void jniDestroyJoint(final long p0, final long p1);
    
    private native void jniDispose(final long p0);
    
    private native boolean jniGetAutoClearForces(final long p0);
    
    private native int jniGetBodyCount(final long p0);
    
    private native int jniGetContactCount(final long p0);
    
    private native void jniGetContactList(final long p0, final long[] p1);
    
    private native void jniGetGravity(final long p0, final float[] p1);
    
    private native int jniGetJointcount(final long p0);
    
    private native int jniGetProxyCount(final long p0);
    
    private native boolean jniIsLocked(final long p0);
    
    private native void jniQueryAABB(final long p0, final float p1, final float p2, final float p3, final float p4);
    
    private native void jniSetAutoClearForces(final long p0, final boolean p1);
    
    private native void jniSetContiousPhysics(final long p0, final boolean p1);
    
    private native void jniSetGravity(final long p0, final float p1, final float p2);
    
    private native void jniSetWarmStarting(final long p0, final boolean p1);
    
    private native void jniStep(final long p0, final float p1, final int p2, final int p3);
    
    private native long newWorld(final float p0, final float p1, final boolean p2);
    
    private boolean reportFixture(final long n) {
        return this.queryCallback != null && this.queryCallback.reportFixture(this.fixtures.get(n));
    }
    
    public void QueryAABB(final QueryCallback queryCallback, final float n, final float n2, final float n3, final float n4) {
        this.queryCallback = queryCallback;
        this.jniQueryAABB(this.addr, n, n2, n3, n4);
    }
    
    public void clearForces() {
        this.jniClearForces(this.addr);
    }
    
    public Body createBody(final BodyDef bodyDef) {
        final Body body = new Body(this, this.jniCreateBody(this.addr, bodyDef.type.getValue(), bodyDef.position.x, bodyDef.position.y, bodyDef.angle, bodyDef.linearVelocity.x, bodyDef.linearVelocity.y, bodyDef.angularVelocity, bodyDef.linearDamping, bodyDef.angularDamping, bodyDef.allowSleep, bodyDef.awake, bodyDef.fixedRotation, bodyDef.bullet, bodyDef.active, bodyDef.inertiaScale));
        this.bodies.put(body.addr, body);
        return body;
    }
    
    public Joint createJoint(final JointDef jointDef) {
        final long properJoint = this.createProperJoint(jointDef);
        final JointDef.JointType type = jointDef.type;
        final JointDef.JointType distanceJoint = JointDef.JointType.DistanceJoint;
        Joint joint = null;
        if (type == distanceJoint) {
            joint = new DistanceJoint(this, properJoint);
        }
        if (jointDef.type == JointDef.JointType.FrictionJoint) {
            joint = new FrictionJoint(this, properJoint);
        }
        if (jointDef.type == JointDef.JointType.GearJoint) {
            joint = new GearJoint(this, properJoint);
        }
        if (jointDef.type == JointDef.JointType.LineJoint) {
            joint = new LineJoint(this, properJoint);
        }
        if (jointDef.type == JointDef.JointType.MouseJoint) {
            joint = new MouseJoint(this, properJoint);
        }
        if (jointDef.type == JointDef.JointType.PrismaticJoint) {
            joint = new PrismaticJoint(this, properJoint);
        }
        if (jointDef.type == JointDef.JointType.PulleyJoint) {
            joint = new PulleyJoint(this, properJoint);
        }
        if (jointDef.type == JointDef.JointType.RevoluteJoint) {
            joint = new RevoluteJoint(this, properJoint);
        }
        if (jointDef.type == JointDef.JointType.WeldJoint) {
            joint = new WeldJoint(this, properJoint);
        }
        if (joint != null) {
            this.joints.put(joint.addr, joint);
        }
        final JointEdge jointEdgeA = new JointEdge(jointDef.bodyB, joint);
        final JointEdge jointEdgeB = new JointEdge(jointDef.bodyA, joint);
        joint.jointEdgeA = jointEdgeA;
        joint.jointEdgeB = jointEdgeB;
        jointDef.bodyA.joints.add(jointEdgeA);
        jointDef.bodyB.joints.add(jointEdgeB);
        return joint;
    }
    
    public void destroyBody(final Body body) {
        this.bodies.remove(body.addr);
        for (int i = 0; i < body.getFixtureList().size(); ++i) {
            this.fixtures.remove(body.getFixtureList().get(i).addr);
        }
        for (int j = 0; j < body.getJointList().size(); ++j) {
            this.joints.remove(body.getJointList().get(j).joint.addr);
        }
        this.jniDestroyBody(this.addr, body.addr);
    }
    
    public void destroyJoint(final Joint joint) {
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
    
    public List<Contact> getContactList() {
        final int contactCount = this.getContactCount();
        if (contactCount > this.contactAddrs.length) {
            this.contactAddrs = new long[contactCount];
        }
        if (contactCount > this.freeContacts.size()) {
            for (int size = this.freeContacts.size(), i = 0; i < contactCount - size; ++i) {
                this.freeContacts.add(new Contact(this, 0L));
            }
        }
        this.jniGetContactList(this.addr, this.contactAddrs);
        this.contacts.clear();
        for (int j = 0; j < contactCount; ++j) {
            final Contact contact = this.freeContacts.get(j);
            contact.addr = this.contactAddrs[j];
            this.contacts.add(contact);
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
    
    public void setAutoClearForces(final boolean b) {
        this.jniSetAutoClearForces(this.addr, b);
    }
    
    public void setContactFilter(final ContactFilter contactFilter) {
        this.contactFilter = contactFilter;
    }
    
    public void setContactListener(final ContactListener contactListener) {
        this.contactListener = contactListener;
    }
    
    public void setContinuousPhysics(final boolean b) {
        this.jniSetContiousPhysics(this.addr, b);
    }
    
    public void setDestructionListener(final DestructionListener destructionListener) {
    }
    
    public void setGravity(final Vector2 vector2) {
        this.jniSetGravity(this.addr, vector2.x, vector2.y);
    }
    
    public void setWarmStarting(final boolean b) {
        this.jniSetWarmStarting(this.addr, b);
    }
    
    public void step(final float n, final int n2, final int n3) {
        this.jniStep(this.addr, n, n2, n3);
    }
}
