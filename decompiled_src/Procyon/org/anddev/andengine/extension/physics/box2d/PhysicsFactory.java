package org.anddev.andengine.extension.physics.box2d;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.*;
import com.badlogic.gdx.physics.box2d.*;
import org.anddev.andengine.entity.primitive.*;
import com.badlogic.gdx.math.*;
import java.util.*;

public class PhysicsFactory
{
    public static Body createBoxBody(final PhysicsWorld physicsWorld, final Shape shape, final BodyDef.BodyType bodyType, final FixtureDef fixtureDef) {
        return createBoxBody(physicsWorld, shape, bodyType, fixtureDef, 32.0f);
    }
    
    public static Body createBoxBody(final PhysicsWorld physicsWorld, final Shape shape, final BodyDef.BodyType type, final FixtureDef fixtureDef, final float n) {
        final BodyDef bodyDef = new BodyDef();
        bodyDef.type = type;
        final float[] sceneCenterCoordinates = shape.getSceneCenterCoordinates();
        bodyDef.position.x = sceneCenterCoordinates[0] / n;
        bodyDef.position.y = sceneCenterCoordinates[1] / n;
        bodyDef.linearVelocity.set(shape.getVelocityX(), shape.getVelocityY());
        bodyDef.angularVelocity = shape.getAngularVelocity();
        final Body body = physicsWorld.createBody(bodyDef);
        final PolygonShape shape2 = new PolygonShape();
        shape2.setAsBox(0.5f * shape.getWidthScaled() / n, 0.5f * shape.getHeightScaled() / n);
        fixtureDef.shape = shape2;
        body.createFixture(fixtureDef);
        shape2.dispose();
        body.setTransform(body.getWorldCenter(), MathUtils.degToRad(shape.getRotation()));
        return body;
    }
    
    public static Body createCircleBody(final PhysicsWorld physicsWorld, final Shape shape, final BodyDef.BodyType bodyType, final FixtureDef fixtureDef) {
        return createCircleBody(physicsWorld, shape, bodyType, fixtureDef, 32.0f);
    }
    
    public static Body createCircleBody(final PhysicsWorld physicsWorld, final Shape shape, final BodyDef.BodyType type, final FixtureDef fixtureDef, final float n) {
        final BodyDef bodyDef = new BodyDef();
        bodyDef.type = type;
        final float[] sceneCenterCoordinates = shape.getSceneCenterCoordinates();
        bodyDef.position.x = sceneCenterCoordinates[0] / n;
        bodyDef.position.y = sceneCenterCoordinates[1] / n;
        bodyDef.angle = MathUtils.degToRad(shape.getRotation());
        bodyDef.linearVelocity.set(shape.getVelocityX(), shape.getVelocityY());
        bodyDef.angularVelocity = shape.getAngularVelocity();
        final Body body = physicsWorld.createBody(bodyDef);
        final CircleShape shape2 = new CircleShape();
        (fixtureDef.shape = shape2).setRadius(0.5f * shape.getWidthScaled() / n);
        body.createFixture(fixtureDef);
        shape2.dispose();
        return body;
    }
    
    public static FixtureDef createFixtureDef(final float n, final float n2, final float n3) {
        return createFixtureDef(n, n2, n3, false);
    }
    
    public static FixtureDef createFixtureDef(final float density, final float restitution, final float friction, final boolean isSensor) {
        final FixtureDef fixtureDef = new FixtureDef();
        fixtureDef.density = density;
        fixtureDef.restitution = restitution;
        fixtureDef.friction = friction;
        fixtureDef.isSensor = isSensor;
        return fixtureDef;
    }
    
    public static FixtureDef createFixtureDef(final float density, final float restitution, final float friction, final boolean isSensor, final short categoryBits, final short maskBits, final short groupIndex) {
        final FixtureDef fixtureDef = new FixtureDef();
        fixtureDef.density = density;
        fixtureDef.restitution = restitution;
        fixtureDef.friction = friction;
        fixtureDef.isSensor = isSensor;
        final Filter filter = fixtureDef.filter;
        filter.categoryBits = categoryBits;
        filter.maskBits = maskBits;
        filter.groupIndex = groupIndex;
        return fixtureDef;
    }
    
    public static Body createLineBody(final PhysicsWorld physicsWorld, final Line line, final FixtureDef fixtureDef) {
        return createLineBody(physicsWorld, line, fixtureDef, 32.0f);
    }
    
    public static Body createLineBody(final PhysicsWorld physicsWorld, final Line line, final FixtureDef fixtureDef, final float n) {
        final BodyDef bodyDef = new BodyDef();
        bodyDef.type = BodyDef.BodyType.StaticBody;
        final Body body = physicsWorld.createBody(bodyDef);
        final PolygonShape shape = new PolygonShape();
        shape.setAsEdge(new Vector2(line.getX1() / n, line.getY1() / n), new Vector2(line.getX2() / n, line.getY2() / n));
        fixtureDef.shape = shape;
        body.createFixture(fixtureDef);
        shape.dispose();
        return body;
    }
    
    public static Body createPolygonBody(final PhysicsWorld physicsWorld, final Shape shape, final Vector2[] array, final BodyDef.BodyType bodyType, final FixtureDef fixtureDef) {
        return createPolygonBody(physicsWorld, shape, array, bodyType, fixtureDef, 32.0f);
    }
    
    public static Body createPolygonBody(final PhysicsWorld physicsWorld, final Shape shape, final Vector2[] array, final BodyDef.BodyType type, final FixtureDef fixtureDef, final float n) {
        final BodyDef bodyDef = new BodyDef();
        bodyDef.type = type;
        final float[] sceneCenterCoordinates = shape.getSceneCenterCoordinates();
        bodyDef.position.x = sceneCenterCoordinates[0] / n;
        bodyDef.position.y = sceneCenterCoordinates[1] / n;
        bodyDef.linearVelocity.set(shape.getVelocityX(), shape.getVelocityY());
        bodyDef.angularVelocity = shape.getAngularVelocity();
        final Body body = physicsWorld.createBody(bodyDef);
        final PolygonShape shape2 = new PolygonShape();
        shape2.set(array);
        fixtureDef.shape = shape2;
        body.createFixture(fixtureDef);
        shape2.dispose();
        return body;
    }
    
    public static Body createTrianglulatedBody(final PhysicsWorld physicsWorld, final Shape shape, final List<Vector2> list, final BodyDef.BodyType bodyType, final FixtureDef fixtureDef) {
        return createTrianglulatedBody(physicsWorld, shape, list, bodyType, fixtureDef, 32.0f);
    }
    
    public static Body createTrianglulatedBody(final PhysicsWorld physicsWorld, final Shape shape, final List<Vector2> list, final BodyDef.BodyType type, final FixtureDef fixtureDef, final float n) {
        final Vector2[] array = new Vector2[3];
        final BodyDef bodyDef = new BodyDef();
        bodyDef.type = type;
        final float[] sceneCenterCoordinates = shape.getSceneCenterCoordinates();
        bodyDef.position.x = sceneCenterCoordinates[0] / n;
        bodyDef.position.y = sceneCenterCoordinates[1] / n;
        bodyDef.linearVelocity.set(shape.getVelocityX(), shape.getVelocityY());
        bodyDef.angularVelocity = shape.getAngularVelocity();
        final Body body = physicsWorld.createBody(bodyDef);
        int n4;
        for (int size = list.size(), i = 0; i < size; i = n4) {
            final PolygonShape shape2 = new PolygonShape();
            final int n2 = i + 1;
            array[2] = list.get(i);
            final int n3 = n2 + 1;
            array[1] = list.get(n2);
            n4 = n3 + 1;
            array[0] = list.get(n3);
            shape2.set(array);
            fixtureDef.shape = shape2;
            body.createFixture(fixtureDef);
            shape2.dispose();
        }
        return body;
    }
}
