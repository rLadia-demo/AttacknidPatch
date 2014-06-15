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

public class PhysicsWorld
  implements IUpdateHandler
{
  public static final int POSITION_ITERATIONS_DEFAULT = 8;
  public static final int VELOCITY_ITERATIONS_DEFAULT = 8;
  protected final PhysicsConnectorManager mPhysicsConnectorManager = new PhysicsConnectorManager();
  protected int mPositionIterations = 8;
  protected final RunnableHandler mRunnableHandler = new RunnableHandler();
  protected int mVelocityIterations = 8;
  protected final World mWorld;
  
  static
  {
    System.loadLibrary("andenginephysicsbox2dextension");
  }
  
  public PhysicsWorld(Vector2 paramVector2, boolean paramBoolean)
  {
    this(paramVector2, paramBoolean, 8, 8);
  }
  
  public PhysicsWorld(Vector2 paramVector2, boolean paramBoolean, int paramInt1, int paramInt2)
  {
    this.mWorld = new World(paramVector2, paramBoolean);
  }
  
  public void QueryAABB(QueryCallback paramQueryCallback, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    this.mWorld.QueryAABB(paramQueryCallback, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void clearForces()
  {
    this.mWorld.clearForces();
  }
  
  public void clearPhysicsConnectors()
  {
    this.mPhysicsConnectorManager.clear();
  }
  
  public Body createBody(BodyDef paramBodyDef)
  {
    return this.mWorld.createBody(paramBodyDef);
  }
  
  public Joint createJoint(JointDef paramJointDef)
  {
    return this.mWorld.createJoint(paramJointDef);
  }
  
  public void destroyBody(Body paramBody)
  {
    this.mWorld.destroyBody(paramBody);
  }
  
  public void destroyJoint(Joint paramJoint)
  {
    this.mWorld.destroyJoint(paramJoint);
  }
  
  public void dispose()
  {
    this.mWorld.dispose();
  }
  
  public boolean getAutoClearForces()
  {
    return this.mWorld.getAutoClearForces();
  }
  
  public Iterable<Body> getBodies()
  {
    return this.mWorld.getBodies();
  }
  
  public int getBodyCount()
  {
    return this.mWorld.getBodyCount();
  }
  
  public int getContactCount()
  {
    return this.mWorld.getContactCount();
  }
  
  public List<Contact> getContactList()
  {
    return this.mWorld.getContactList();
  }
  
  public Vector2 getGravity()
  {
    return this.mWorld.getGravity();
  }
  
  public int getJointCount()
  {
    return this.mWorld.getJointCount();
  }
  
  public Iterable<Joint> getJoints()
  {
    return this.mWorld.getJoints();
  }
  
  public PhysicsConnectorManager getPhysicsConnectorManager()
  {
    return this.mPhysicsConnectorManager;
  }
  
  public int getPositionIterations()
  {
    return this.mPositionIterations;
  }
  
  public int getProxyCount()
  {
    return this.mWorld.getProxyCount();
  }
  
  public int getVelocityIterations()
  {
    return this.mVelocityIterations;
  }
  
  public boolean isLocked()
  {
    return this.mWorld.isLocked();
  }
  
  public void onUpdate(float paramFloat)
  {
    this.mRunnableHandler.onUpdate(paramFloat);
    this.mWorld.step(paramFloat, this.mVelocityIterations, this.mPositionIterations);
    this.mPhysicsConnectorManager.onUpdate(paramFloat);
  }
  
  public void postRunnable(Runnable paramRunnable)
  {
    this.mRunnableHandler.postRunnable(paramRunnable);
  }
  
  public void registerPhysicsConnector(PhysicsConnector paramPhysicsConnector)
  {
    this.mPhysicsConnectorManager.add(paramPhysicsConnector);
  }
  
  public void reset()
  {
    this.mPhysicsConnectorManager.reset();
    this.mRunnableHandler.reset();
  }
  
  public void setAutoClearForces(boolean paramBoolean)
  {
    this.mWorld.setAutoClearForces(paramBoolean);
  }
  
  public void setContactFilter(ContactFilter paramContactFilter)
  {
    this.mWorld.setContactFilter(paramContactFilter);
  }
  
  public void setContactListener(ContactListener paramContactListener)
  {
    this.mWorld.setContactListener(paramContactListener);
  }
  
  public void setContinuousPhysics(boolean paramBoolean)
  {
    this.mWorld.setContinuousPhysics(paramBoolean);
  }
  
  public void setDestructionListener(DestructionListener paramDestructionListener)
  {
    this.mWorld.setDestructionListener(paramDestructionListener);
  }
  
  public void setGravity(Vector2 paramVector2)
  {
    this.mWorld.setGravity(paramVector2);
  }
  
  public void setPositionIterations(int paramInt)
  {
    this.mPositionIterations = paramInt;
  }
  
  public void setVelocityIterations(int paramInt)
  {
    this.mVelocityIterations = paramInt;
  }
  
  public void setWarmStarting(boolean paramBoolean)
  {
    this.mWorld.setWarmStarting(paramBoolean);
  }
  
  public void unregisterPhysicsConnector(PhysicsConnector paramPhysicsConnector)
  {
    this.mPhysicsConnectorManager.remove(paramPhysicsConnector);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.PhysicsWorld
 * JD-Core Version:    0.7.0.1
 */