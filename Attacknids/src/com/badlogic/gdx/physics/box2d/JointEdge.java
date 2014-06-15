package com.badlogic.gdx.physics.box2d;

public class JointEdge
{
  public final Joint joint;
  public final Body other;
  
  protected JointEdge(Body paramBody, Joint paramJoint)
  {
    this.other = paramBody;
    this.joint = paramJoint;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.badlogic.gdx.physics.box2d.JointEdge
 * JD-Core Version:    0.7.0.1
 */