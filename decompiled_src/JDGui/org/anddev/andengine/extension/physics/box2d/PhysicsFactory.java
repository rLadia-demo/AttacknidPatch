package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.BodyDef.BodyType;
import com.badlogic.gdx.physics.box2d.CircleShape;
import com.badlogic.gdx.physics.box2d.Filter;
import com.badlogic.gdx.physics.box2d.FixtureDef;
import com.badlogic.gdx.physics.box2d.PolygonShape;
import java.util.List;
import org.anddev.andengine.entity.primitive.Line;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.util.MathUtils;

public class PhysicsFactory
{
  public static Body createBoxBody(PhysicsWorld paramPhysicsWorld, Shape paramShape, BodyDef.BodyType paramBodyType, FixtureDef paramFixtureDef)
  {
    return createBoxBody(paramPhysicsWorld, paramShape, paramBodyType, paramFixtureDef, 32.0F);
  }
  
  public static Body createBoxBody(PhysicsWorld paramPhysicsWorld, Shape paramShape, BodyDef.BodyType paramBodyType, FixtureDef paramFixtureDef, float paramFloat)
  {
    BodyDef localBodyDef = new BodyDef();
    localBodyDef.type = paramBodyType;
    float[] arrayOfFloat = paramShape.getSceneCenterCoordinates();
    localBodyDef.position.x = (arrayOfFloat[0] / paramFloat);
    localBodyDef.position.y = (arrayOfFloat[1] / paramFloat);
    localBodyDef.linearVelocity.set(paramShape.getVelocityX(), paramShape.getVelocityY());
    localBodyDef.angularVelocity = paramShape.getAngularVelocity();
    Body localBody = paramPhysicsWorld.createBody(localBodyDef);
    PolygonShape localPolygonShape = new PolygonShape();
    localPolygonShape.setAsBox(0.5F * paramShape.getWidthScaled() / paramFloat, 0.5F * paramShape.getHeightScaled() / paramFloat);
    paramFixtureDef.shape = localPolygonShape;
    localBody.createFixture(paramFixtureDef);
    localPolygonShape.dispose();
    localBody.setTransform(localBody.getWorldCenter(), MathUtils.degToRad(paramShape.getRotation()));
    return localBody;
  }
  
  public static Body createCircleBody(PhysicsWorld paramPhysicsWorld, Shape paramShape, BodyDef.BodyType paramBodyType, FixtureDef paramFixtureDef)
  {
    return createCircleBody(paramPhysicsWorld, paramShape, paramBodyType, paramFixtureDef, 32.0F);
  }
  
  public static Body createCircleBody(PhysicsWorld paramPhysicsWorld, Shape paramShape, BodyDef.BodyType paramBodyType, FixtureDef paramFixtureDef, float paramFloat)
  {
    BodyDef localBodyDef = new BodyDef();
    localBodyDef.type = paramBodyType;
    float[] arrayOfFloat = paramShape.getSceneCenterCoordinates();
    localBodyDef.position.x = (arrayOfFloat[0] / paramFloat);
    localBodyDef.position.y = (arrayOfFloat[1] / paramFloat);
    localBodyDef.angle = MathUtils.degToRad(paramShape.getRotation());
    localBodyDef.linearVelocity.set(paramShape.getVelocityX(), paramShape.getVelocityY());
    localBodyDef.angularVelocity = paramShape.getAngularVelocity();
    Body localBody = paramPhysicsWorld.createBody(localBodyDef);
    CircleShape localCircleShape = new CircleShape();
    paramFixtureDef.shape = localCircleShape;
    localCircleShape.setRadius(0.5F * paramShape.getWidthScaled() / paramFloat);
    localBody.createFixture(paramFixtureDef);
    localCircleShape.dispose();
    return localBody;
  }
  
  public static FixtureDef createFixtureDef(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    return createFixtureDef(paramFloat1, paramFloat2, paramFloat3, false);
  }
  
  public static FixtureDef createFixtureDef(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean)
  {
    FixtureDef localFixtureDef = new FixtureDef();
    localFixtureDef.density = paramFloat1;
    localFixtureDef.restitution = paramFloat2;
    localFixtureDef.friction = paramFloat3;
    localFixtureDef.isSensor = paramBoolean;
    return localFixtureDef;
  }
  
  public static FixtureDef createFixtureDef(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean, short paramShort1, short paramShort2, short paramShort3)
  {
    FixtureDef localFixtureDef = new FixtureDef();
    localFixtureDef.density = paramFloat1;
    localFixtureDef.restitution = paramFloat2;
    localFixtureDef.friction = paramFloat3;
    localFixtureDef.isSensor = paramBoolean;
    Filter localFilter = localFixtureDef.filter;
    localFilter.categoryBits = paramShort1;
    localFilter.maskBits = paramShort2;
    localFilter.groupIndex = paramShort3;
    return localFixtureDef;
  }
  
  public static Body createLineBody(PhysicsWorld paramPhysicsWorld, Line paramLine, FixtureDef paramFixtureDef)
  {
    return createLineBody(paramPhysicsWorld, paramLine, paramFixtureDef, 32.0F);
  }
  
  public static Body createLineBody(PhysicsWorld paramPhysicsWorld, Line paramLine, FixtureDef paramFixtureDef, float paramFloat)
  {
    BodyDef localBodyDef = new BodyDef();
    localBodyDef.type = BodyDef.BodyType.StaticBody;
    Body localBody = paramPhysicsWorld.createBody(localBodyDef);
    PolygonShape localPolygonShape = new PolygonShape();
    localPolygonShape.setAsEdge(new Vector2(paramLine.getX1() / paramFloat, paramLine.getY1() / paramFloat), new Vector2(paramLine.getX2() / paramFloat, paramLine.getY2() / paramFloat));
    paramFixtureDef.shape = localPolygonShape;
    localBody.createFixture(paramFixtureDef);
    localPolygonShape.dispose();
    return localBody;
  }
  
  public static Body createPolygonBody(PhysicsWorld paramPhysicsWorld, Shape paramShape, Vector2[] paramArrayOfVector2, BodyDef.BodyType paramBodyType, FixtureDef paramFixtureDef)
  {
    return createPolygonBody(paramPhysicsWorld, paramShape, paramArrayOfVector2, paramBodyType, paramFixtureDef, 32.0F);
  }
  
  public static Body createPolygonBody(PhysicsWorld paramPhysicsWorld, Shape paramShape, Vector2[] paramArrayOfVector2, BodyDef.BodyType paramBodyType, FixtureDef paramFixtureDef, float paramFloat)
  {
    BodyDef localBodyDef = new BodyDef();
    localBodyDef.type = paramBodyType;
    float[] arrayOfFloat = paramShape.getSceneCenterCoordinates();
    localBodyDef.position.x = (arrayOfFloat[0] / paramFloat);
    localBodyDef.position.y = (arrayOfFloat[1] / paramFloat);
    localBodyDef.linearVelocity.set(paramShape.getVelocityX(), paramShape.getVelocityY());
    localBodyDef.angularVelocity = paramShape.getAngularVelocity();
    Body localBody = paramPhysicsWorld.createBody(localBodyDef);
    PolygonShape localPolygonShape = new PolygonShape();
    localPolygonShape.set(paramArrayOfVector2);
    paramFixtureDef.shape = localPolygonShape;
    localBody.createFixture(paramFixtureDef);
    localPolygonShape.dispose();
    return localBody;
  }
  
  public static Body createTrianglulatedBody(PhysicsWorld paramPhysicsWorld, Shape paramShape, List<Vector2> paramList, BodyDef.BodyType paramBodyType, FixtureDef paramFixtureDef)
  {
    return createTrianglulatedBody(paramPhysicsWorld, paramShape, paramList, paramBodyType, paramFixtureDef, 32.0F);
  }
  
  public static Body createTrianglulatedBody(PhysicsWorld paramPhysicsWorld, Shape paramShape, List<Vector2> paramList, BodyDef.BodyType paramBodyType, FixtureDef paramFixtureDef, float paramFloat)
  {
    Vector2[] arrayOfVector2 = new Vector2[3];
    BodyDef localBodyDef = new BodyDef();
    localBodyDef.type = paramBodyType;
    float[] arrayOfFloat = paramShape.getSceneCenterCoordinates();
    localBodyDef.position.x = (arrayOfFloat[0] / paramFloat);
    localBodyDef.position.y = (arrayOfFloat[1] / paramFloat);
    localBodyDef.linearVelocity.set(paramShape.getVelocityX(), paramShape.getVelocityY());
    localBodyDef.angularVelocity = paramShape.getAngularVelocity();
    Body localBody = paramPhysicsWorld.createBody(localBodyDef);
    int i = paramList.size();
    int n;
    for (int j = 0;; j = n)
    {
      if (j >= i) {
        return localBody;
      }
      PolygonShape localPolygonShape = new PolygonShape();
      int k = j + 1;
      arrayOfVector2[2] = ((Vector2)paramList.get(j));
      int m = k + 1;
      arrayOfVector2[1] = ((Vector2)paramList.get(k));
      n = m + 1;
      arrayOfVector2[0] = ((Vector2)paramList.get(m));
      localPolygonShape.set(arrayOfVector2);
      paramFixtureDef.shape = localPolygonShape;
      localBody.createFixture(paramFixtureDef);
      localPolygonShape.dispose();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.PhysicsFactory
 * JD-Core Version:    0.7.0.1
 */