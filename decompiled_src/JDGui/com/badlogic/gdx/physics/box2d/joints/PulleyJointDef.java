package com.badlogic.gdx.physics.box2d.joints;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.JointDef;
import com.badlogic.gdx.physics.box2d.JointDef.JointType;

public class PulleyJointDef
  extends JointDef
{
  private static final float minPulleyLength = 2.0F;
  public final Vector2 groundAnchorA = new Vector2(-1.0F, 1.0F);
  public final Vector2 groundAnchorB = new Vector2(1.0F, 1.0F);
  public float lengthA = 0.0F;
  public float lengthB = 0.0F;
  public final Vector2 localAnchorA = new Vector2(-1.0F, 0.0F);
  public final Vector2 localAnchorB = new Vector2(1.0F, 0.0F);
  public float maxLengthA = 0.0F;
  public float maxLengthB = 0.0F;
  public float ratio = 1.0F;
  
  public PulleyJointDef()
  {
    this.type = JointDef.JointType.PulleyJoint;
    this.collideConnected = true;
  }
  
  public void initialize(Body paramBody1, Body paramBody2, Vector2 paramVector21, Vector2 paramVector22, Vector2 paramVector23, Vector2 paramVector24, float paramFloat)
  {
    this.bodyA = paramBody1;
    this.bodyB = paramBody2;
    this.groundAnchorA.set(paramVector21);
    this.groundAnchorB.set(paramVector22);
    this.localAnchorA.set(paramBody1.getLocalPoint(paramVector23));
    this.localAnchorB.set(paramBody2.getLocalPoint(paramVector24));
    this.lengthA = paramVector23.dst(paramVector21);
    this.lengthB = paramVector24.dst(paramVector22);
    this.ratio = paramFloat;
    float f = this.lengthA + paramFloat * this.lengthB;
    this.maxLengthA = (f - paramFloat * 2.0F);
    this.maxLengthB = ((f - 2.0F) / paramFloat);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.joints.PulleyJointDef
 * JD-Core Version:    0.7.0.1
 */