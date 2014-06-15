package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.physics.box2d.Body;
import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.entity.shape.Shape;

public class PhysicsConnectorManager
  extends ArrayList<PhysicsConnector>
  implements IUpdateHandler
{
  private static final long serialVersionUID = 412969510084261799L;
  
  public Body findBodyByShape(Shape paramShape)
  {
    for (int i = -1 + size();; i--)
    {
      if (i < 0) {
        return null;
      }
      PhysicsConnector localPhysicsConnector = (PhysicsConnector)get(i);
      if (localPhysicsConnector.mShape == paramShape) {
        return localPhysicsConnector.mBody;
      }
    }
  }
  
  public PhysicsConnector findPhysicsConnectorByShape(Shape paramShape)
  {
    for (int i = -1 + size();; i--)
    {
      PhysicsConnector localPhysicsConnector;
      if (i < 0) {
        localPhysicsConnector = null;
      }
      do
      {
        return localPhysicsConnector;
        localPhysicsConnector = (PhysicsConnector)get(i);
      } while (localPhysicsConnector.mShape == paramShape);
    }
  }
  
  public void onUpdate(float paramFloat)
  {
    for (int i = -1 + size();; i--)
    {
      if (i < 0) {
        return;
      }
      ((PhysicsConnector)get(i)).onUpdate(paramFloat);
    }
  }
  
  public void reset()
  {
    for (int i = -1 + size();; i--)
    {
      if (i < 0) {
        return;
      }
      ((PhysicsConnector)get(i)).reset();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.PhysicsConnectorManager
 * JD-Core Version:    0.7.0.1
 */