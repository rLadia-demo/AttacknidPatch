package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.math.Vector2;
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

public class World
{
  private final long addr;
  protected final LongHashMap<Body> bodies = new LongHashMap(100);
  private final Contact contact = new Contact(this, 0L);
  private long[] contactAddrs = new long['È'];
  protected ContactFilter contactFilter = null;
  protected ContactListener contactListener = null;
  private final ArrayList<Contact> contacts = new ArrayList();
  protected final LongHashMap<Fixture> fixtures = new LongHashMap(100);
  private final ArrayList<Contact> freeContacts = new ArrayList();
  private int freeIdx = 0;
  final Vector2 gravity = new Vector2();
  protected final LongHashMap<Joint> joints = new LongHashMap(100);
  private QueryCallback queryCallback = null;
  final float[] tmpGravity = new float[2];
  
  public World(Vector2 paramVector2, boolean paramBoolean)
  {
    this.addr = newWorld(paramVector2.x, paramVector2.y, paramBoolean);
    for (int i = 0;; i++)
    {
      if (i >= 200) {
        return;
      }
      this.freeContacts.add(new Contact(this, 0L));
    }
  }
  
  private void beginContact(long paramLong)
  {
    this.contact.addr = paramLong;
    if (this.contactListener != null) {
      this.contactListener.beginContact(this.contact);
    }
  }
  
  private boolean contactFilter(long paramLong1, long paramLong2)
  {
    boolean bool = true;
    if (this.contactFilter != null) {
      bool = this.contactFilter.shouldCollide((Fixture)this.fixtures.get(paramLong1), (Fixture)this.fixtures.get(paramLong2));
    }
    Filter localFilter1;
    Filter localFilter2;
    do
    {
      return bool;
      localFilter1 = ((Fixture)this.fixtures.get(paramLong1)).getFilterData();
      localFilter2 = ((Fixture)this.fixtures.get(paramLong2)).getFilterData();
      if ((localFilter1.groupIndex != localFilter2.groupIndex) || (localFilter1.groupIndex == 0)) {
        break;
      }
    } while (localFilter1.groupIndex > 0);
    return false;
    if (((localFilter1.maskBits & localFilter2.categoryBits) != 0) && ((localFilter1.categoryBits & localFilter2.maskBits) != 0)) {
      return bool;
    }
    return false;
  }
  
  private long createProperJoint(JointDef paramJointDef)
  {
    if (paramJointDef.type == JointDef.JointType.DistanceJoint)
    {
      DistanceJointDef localDistanceJointDef = (DistanceJointDef)paramJointDef;
      return jniCreateDistanceJoint(this.addr, localDistanceJointDef.bodyA.addr, localDistanceJointDef.bodyB.addr, localDistanceJointDef.collideConnected, localDistanceJointDef.localAnchorA.x, localDistanceJointDef.localAnchorA.y, localDistanceJointDef.localAnchorB.x, localDistanceJointDef.localAnchorB.y, localDistanceJointDef.length, localDistanceJointDef.frequencyHz, localDistanceJointDef.dampingRatio);
    }
    if (paramJointDef.type == JointDef.JointType.FrictionJoint)
    {
      FrictionJointDef localFrictionJointDef = (FrictionJointDef)paramJointDef;
      return jniCreateFrictionJoint(this.addr, localFrictionJointDef.bodyA.addr, localFrictionJointDef.bodyB.addr, localFrictionJointDef.collideConnected, localFrictionJointDef.localAnchorA.x, localFrictionJointDef.localAnchorA.y, localFrictionJointDef.localAnchorB.x, localFrictionJointDef.localAnchorB.y, localFrictionJointDef.maxForce, localFrictionJointDef.maxTorque);
    }
    if (paramJointDef.type == JointDef.JointType.GearJoint)
    {
      GearJointDef localGearJointDef = (GearJointDef)paramJointDef;
      return jniCreateGearJoint(this.addr, localGearJointDef.bodyA.addr, localGearJointDef.bodyB.addr, localGearJointDef.collideConnected, localGearJointDef.joint1.addr, localGearJointDef.joint2.addr, localGearJointDef.ratio);
    }
    if (paramJointDef.type == JointDef.JointType.LineJoint)
    {
      LineJointDef localLineJointDef = (LineJointDef)paramJointDef;
      return jniCreateLineJoint(this.addr, localLineJointDef.bodyA.addr, localLineJointDef.bodyB.addr, localLineJointDef.collideConnected, localLineJointDef.localAnchorA.x, localLineJointDef.localAnchorA.y, localLineJointDef.localAnchorB.x, localLineJointDef.localAnchorB.y, localLineJointDef.localAxisA.x, localLineJointDef.localAxisA.y, localLineJointDef.enableLimit, localLineJointDef.lowerTranslation, localLineJointDef.upperTranslation, localLineJointDef.enableMotor, localLineJointDef.maxMotorForce, localLineJointDef.motorSpeed);
    }
    if (paramJointDef.type == JointDef.JointType.MouseJoint)
    {
      MouseJointDef localMouseJointDef = (MouseJointDef)paramJointDef;
      return jniCreateMouseJoint(this.addr, localMouseJointDef.bodyA.addr, localMouseJointDef.bodyB.addr, localMouseJointDef.collideConnected, localMouseJointDef.target.x, localMouseJointDef.target.y, localMouseJointDef.maxForce, localMouseJointDef.frequencyHz, localMouseJointDef.dampingRatio);
    }
    if (paramJointDef.type == JointDef.JointType.PrismaticJoint)
    {
      PrismaticJointDef localPrismaticJointDef = (PrismaticJointDef)paramJointDef;
      return jniCreatePrismaticJoint(this.addr, localPrismaticJointDef.bodyA.addr, localPrismaticJointDef.bodyB.addr, localPrismaticJointDef.collideConnected, localPrismaticJointDef.localAnchorA.x, localPrismaticJointDef.localAnchorA.y, localPrismaticJointDef.localAnchorB.x, localPrismaticJointDef.localAnchorB.y, localPrismaticJointDef.localAxis1.x, localPrismaticJointDef.localAxis1.y, localPrismaticJointDef.referenceAngle, localPrismaticJointDef.enableLimit, localPrismaticJointDef.lowerTranslation, localPrismaticJointDef.upperTranslation, localPrismaticJointDef.enableMotor, localPrismaticJointDef.maxMotorForce, localPrismaticJointDef.motorSpeed);
    }
    if (paramJointDef.type == JointDef.JointType.PulleyJoint)
    {
      PulleyJointDef localPulleyJointDef = (PulleyJointDef)paramJointDef;
      return jniCreatePulleyJoint(this.addr, localPulleyJointDef.bodyA.addr, localPulleyJointDef.bodyB.addr, localPulleyJointDef.collideConnected, localPulleyJointDef.groundAnchorA.x, localPulleyJointDef.groundAnchorA.y, localPulleyJointDef.groundAnchorB.x, localPulleyJointDef.groundAnchorB.y, localPulleyJointDef.localAnchorA.x, localPulleyJointDef.localAnchorA.y, localPulleyJointDef.localAnchorB.x, localPulleyJointDef.localAnchorB.y, localPulleyJointDef.lengthA, localPulleyJointDef.maxLengthA, localPulleyJointDef.lengthB, localPulleyJointDef.maxLengthB, localPulleyJointDef.ratio);
    }
    if (paramJointDef.type == JointDef.JointType.RevoluteJoint)
    {
      RevoluteJointDef localRevoluteJointDef = (RevoluteJointDef)paramJointDef;
      return jniCreateRevoluteJoint(this.addr, localRevoluteJointDef.bodyA.addr, localRevoluteJointDef.bodyB.addr, localRevoluteJointDef.collideConnected, localRevoluteJointDef.localAnchorA.x, localRevoluteJointDef.localAnchorA.y, localRevoluteJointDef.localAnchorB.x, localRevoluteJointDef.localAnchorB.y, localRevoluteJointDef.referenceAngle, localRevoluteJointDef.enableLimit, localRevoluteJointDef.lowerAngle, localRevoluteJointDef.upperAngle, localRevoluteJointDef.enableMotor, localRevoluteJointDef.motorSpeed, localRevoluteJointDef.maxMotorTorque);
    }
    if (paramJointDef.type == JointDef.JointType.WeldJoint)
    {
      WeldJointDef localWeldJointDef = (WeldJointDef)paramJointDef;
      return jniCreateWeldJoint(this.addr, localWeldJointDef.bodyA.addr, localWeldJointDef.bodyB.addr, localWeldJointDef.collideConnected, localWeldJointDef.localAnchorA.x, localWeldJointDef.localAnchorA.y, localWeldJointDef.localAnchorB.x, localWeldJointDef.localAnchorB.y, localWeldJointDef.referenceAngle);
    }
    return 0L;
  }
  
  private void endContact(long paramLong)
  {
    this.contact.addr = paramLong;
    this.contact.GetWorldManifold();
    if (this.contactListener != null) {
      this.contactListener.endContact(this.contact);
    }
  }
  
  private native void jniClearForces(long paramLong);
  
  private native long jniCreateBody(long paramLong, int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, float paramFloat9);
  
  private native long jniCreateDistanceJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7);
  
  private native long jniCreateFrictionJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6);
  
  private native long jniCreateGearJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, long paramLong4, long paramLong5, float paramFloat);
  
  private native long jniCreateLineJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean1, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, boolean paramBoolean2, float paramFloat7, float paramFloat8, boolean paramBoolean3, float paramFloat9, float paramFloat10);
  
  private native long jniCreateMouseJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5);
  
  private native long jniCreatePrismaticJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean1, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, boolean paramBoolean2, float paramFloat8, float paramFloat9, boolean paramBoolean3, float paramFloat10, float paramFloat11);
  
  private native long jniCreatePulleyJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, float paramFloat10, float paramFloat11, float paramFloat12, float paramFloat13);
  
  private native long jniCreateRevoluteJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean1, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, boolean paramBoolean2, float paramFloat6, float paramFloat7, boolean paramBoolean3, float paramFloat8, float paramFloat9);
  
  private native long jniCreateWeldJoint(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5);
  
  private native void jniDestroyBody(long paramLong1, long paramLong2);
  
  private native void jniDestroyJoint(long paramLong1, long paramLong2);
  
  private native void jniDispose(long paramLong);
  
  private native boolean jniGetAutoClearForces(long paramLong);
  
  private native int jniGetBodyCount(long paramLong);
  
  private native int jniGetContactCount(long paramLong);
  
  private native void jniGetContactList(long paramLong, long[] paramArrayOfLong);
  
  private native void jniGetGravity(long paramLong, float[] paramArrayOfFloat);
  
  private native int jniGetJointcount(long paramLong);
  
  private native int jniGetProxyCount(long paramLong);
  
  private native boolean jniIsLocked(long paramLong);
  
  private native void jniQueryAABB(long paramLong, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  private native void jniSetAutoClearForces(long paramLong, boolean paramBoolean);
  
  private native void jniSetContiousPhysics(long paramLong, boolean paramBoolean);
  
  private native void jniSetGravity(long paramLong, float paramFloat1, float paramFloat2);
  
  private native void jniSetWarmStarting(long paramLong, boolean paramBoolean);
  
  private native void jniStep(long paramLong, float paramFloat, int paramInt1, int paramInt2);
  
  private native long newWorld(float paramFloat1, float paramFloat2, boolean paramBoolean);
  
  private boolean reportFixture(long paramLong)
  {
    if (this.queryCallback != null) {
      return this.queryCallback.reportFixture((Fixture)this.fixtures.get(paramLong));
    }
    return false;
  }
  
  public void QueryAABB(QueryCallback paramQueryCallback, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.queryCallback = paramQueryCallback;
    jniQueryAABB(this.addr, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void clearForces()
  {
    jniClearForces(this.addr);
  }
  
  public Body createBody(BodyDef paramBodyDef)
  {
    Body localBody = new Body(this, jniCreateBody(this.addr, paramBodyDef.type.getValue(), paramBodyDef.position.x, paramBodyDef.position.y, paramBodyDef.angle, paramBodyDef.linearVelocity.x, paramBodyDef.linearVelocity.y, paramBodyDef.angularVelocity, paramBodyDef.linearDamping, paramBodyDef.angularDamping, paramBodyDef.allowSleep, paramBodyDef.awake, paramBodyDef.fixedRotation, paramBodyDef.bullet, paramBodyDef.active, paramBodyDef.inertiaScale));
    this.bodies.put(localBody.addr, localBody);
    return localBody;
  }
  
  public Joint createJoint(JointDef paramJointDef)
  {
    long l = createProperJoint(paramJointDef);
    JointDef.JointType localJointType1 = paramJointDef.type;
    JointDef.JointType localJointType2 = JointDef.JointType.DistanceJoint;
    Object localObject = null;
    if (localJointType1 == localJointType2) {
      localObject = new DistanceJoint(this, l);
    }
    if (paramJointDef.type == JointDef.JointType.FrictionJoint) {
      localObject = new FrictionJoint(this, l);
    }
    if (paramJointDef.type == JointDef.JointType.GearJoint) {
      localObject = new GearJoint(this, l);
    }
    if (paramJointDef.type == JointDef.JointType.LineJoint) {
      localObject = new LineJoint(this, l);
    }
    if (paramJointDef.type == JointDef.JointType.MouseJoint) {
      localObject = new MouseJoint(this, l);
    }
    if (paramJointDef.type == JointDef.JointType.PrismaticJoint) {
      localObject = new PrismaticJoint(this, l);
    }
    if (paramJointDef.type == JointDef.JointType.PulleyJoint) {
      localObject = new PulleyJoint(this, l);
    }
    if (paramJointDef.type == JointDef.JointType.RevoluteJoint) {
      localObject = new RevoluteJoint(this, l);
    }
    if (paramJointDef.type == JointDef.JointType.WeldJoint) {
      localObject = new WeldJoint(this, l);
    }
    if (localObject != null) {
      this.joints.put(((Joint)localObject).addr, localObject);
    }
    JointEdge localJointEdge1 = new JointEdge(paramJointDef.bodyB, (Joint)localObject);
    JointEdge localJointEdge2 = new JointEdge(paramJointDef.bodyA, (Joint)localObject);
    ((Joint)localObject).jointEdgeA = localJointEdge1;
    ((Joint)localObject).jointEdgeB = localJointEdge2;
    paramJointDef.bodyA.joints.add(localJointEdge1);
    paramJointDef.bodyB.joints.add(localJointEdge2);
    return localObject;
  }
  
  public void destroyBody(Body paramBody)
  {
    this.bodies.remove(paramBody.addr);
    int i = 0;
    if (i >= paramBody.getFixtureList().size()) {}
    for (int j = 0;; j++)
    {
      if (j >= paramBody.getJointList().size())
      {
        jniDestroyBody(this.addr, paramBody.addr);
        return;
        this.fixtures.remove(((Fixture)paramBody.getFixtureList().get(i)).addr);
        i++;
        break;
      }
      this.joints.remove(((JointEdge)paramBody.getJointList().get(j)).joint.addr);
    }
  }
  
  public void destroyJoint(Joint paramJoint)
  {
    this.joints.remove(paramJoint.addr);
    paramJoint.jointEdgeA.other.joints.remove(paramJoint.jointEdgeB);
    paramJoint.jointEdgeB.other.joints.remove(paramJoint.jointEdgeA);
    jniDestroyJoint(this.addr, paramJoint.addr);
  }
  
  public void dispose()
  {
    jniDispose(this.addr);
  }
  
  public boolean getAutoClearForces()
  {
    return jniGetAutoClearForces(this.addr);
  }
  
  public Iterable<Body> getBodies()
  {
    return this.bodies.values();
  }
  
  public int getBodyCount()
  {
    return jniGetBodyCount(this.addr);
  }
  
  public int getContactCount()
  {
    return jniGetContactCount(this.addr);
  }
  
  public List<Contact> getContactList()
  {
    int i = getContactCount();
    if (i > this.contactAddrs.length) {
      this.contactAddrs = new long[i];
    }
    int m;
    if (i > this.freeContacts.size())
    {
      int k = this.freeContacts.size();
      m = 0;
      if (m < i - k) {}
    }
    else
    {
      jniGetContactList(this.addr, this.contactAddrs);
      this.contacts.clear();
    }
    for (int j = 0;; j++)
    {
      if (j >= i)
      {
        return this.contacts;
        this.freeContacts.add(new Contact(this, 0L));
        m++;
        break;
      }
      Contact localContact = (Contact)this.freeContacts.get(j);
      localContact.addr = this.contactAddrs[j];
      this.contacts.add(localContact);
    }
  }
  
  public Vector2 getGravity()
  {
    jniGetGravity(this.addr, this.tmpGravity);
    this.gravity.x = this.tmpGravity[0];
    this.gravity.y = this.tmpGravity[1];
    return this.gravity;
  }
  
  public int getJointCount()
  {
    return jniGetJointcount(this.addr);
  }
  
  public Iterable<Joint> getJoints()
  {
    return this.joints.values();
  }
  
  public int getProxyCount()
  {
    return jniGetProxyCount(this.addr);
  }
  
  public boolean isLocked()
  {
    return jniIsLocked(this.addr);
  }
  
  public void setAutoClearForces(boolean paramBoolean)
  {
    jniSetAutoClearForces(this.addr, paramBoolean);
  }
  
  public void setContactFilter(ContactFilter paramContactFilter)
  {
    this.contactFilter = paramContactFilter;
  }
  
  public void setContactListener(ContactListener paramContactListener)
  {
    this.contactListener = paramContactListener;
  }
  
  public void setContinuousPhysics(boolean paramBoolean)
  {
    jniSetContiousPhysics(this.addr, paramBoolean);
  }
  
  public void setDestructionListener(DestructionListener paramDestructionListener) {}
  
  public void setGravity(Vector2 paramVector2)
  {
    jniSetGravity(this.addr, paramVector2.x, paramVector2.y);
  }
  
  public void setWarmStarting(boolean paramBoolean)
  {
    jniSetWarmStarting(this.addr, paramBoolean);
  }
  
  public void step(float paramFloat, int paramInt1, int paramInt2)
  {
    jniStep(this.addr, paramFloat, paramInt1, paramInt2);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.World
 * JD-Core Version:    0.7.0.1
 */