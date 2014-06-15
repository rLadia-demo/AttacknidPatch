/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d;

import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.BodyDef;
import com.badlogic.gdx.physics.box2d.CircleShape;
import com.badlogic.gdx.physics.box2d.Filter;
import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.physics.box2d.FixtureDef;
import com.badlogic.gdx.physics.box2d.PolygonShape;
import com.badlogic.gdx.physics.box2d.Shape;
import java.util.List;
import org.anddev.andengine.entity.primitive.Line;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.extension.physics.box2d.PhysicsWorld;
import org.anddev.andengine.util.MathUtils;

public class PhysicsFactory {
    public static Body createBoxBody(PhysicsWorld physicsWorld, org.anddev.andengine.entity.shape.Shape shape, BodyDef.BodyType bodyType, FixtureDef fixtureDef) {
        return PhysicsFactory.createBoxBody(physicsWorld, shape, bodyType, fixtureDef, 32.0f);
    }

    public static Body createBoxBody(PhysicsWorld physicsWorld, org.anddev.andengine.entity.shape.Shape shape, BodyDef.BodyType bodyType, FixtureDef fixtureDef, float f) {
        BodyDef bodyDef = new BodyDef();
        bodyDef.type = bodyType;
        float[] arrf = shape.getSceneCenterCoordinates();
        bodyDef.position.x = arrf[0] / f;
        bodyDef.position.y = arrf[1] / f;
        bodyDef.linearVelocity.set(shape.getVelocityX(), shape.getVelocityY());
        bodyDef.angularVelocity = shape.getAngularVelocity();
        Body body = physicsWorld.createBody(bodyDef);
        PolygonShape polygonShape = new PolygonShape();
        polygonShape.setAsBox(0.5f * shape.getWidthScaled() / f, 0.5f * shape.getHeightScaled() / f);
        fixtureDef.shape = polygonShape;
        body.createFixture(fixtureDef);
        polygonShape.dispose();
        body.setTransform(body.getWorldCenter(), MathUtils.degToRad(shape.getRotation()));
        return body;
    }

    public static Body createCircleBody(PhysicsWorld physicsWorld, org.anddev.andengine.entity.shape.Shape shape, BodyDef.BodyType bodyType, FixtureDef fixtureDef) {
        return PhysicsFactory.createCircleBody(physicsWorld, shape, bodyType, fixtureDef, 32.0f);
    }

    public static Body createCircleBody(PhysicsWorld physicsWorld, org.anddev.andengine.entity.shape.Shape shape, BodyDef.BodyType bodyType, FixtureDef fixtureDef, float f) {
        CircleShape circleShape;
        BodyDef bodyDef = new BodyDef();
        bodyDef.type = bodyType;
        float[] arrf = shape.getSceneCenterCoordinates();
        bodyDef.position.x = arrf[0] / f;
        bodyDef.position.y = arrf[1] / f;
        bodyDef.angle = MathUtils.degToRad(shape.getRotation());
        bodyDef.linearVelocity.set(shape.getVelocityX(), shape.getVelocityY());
        bodyDef.angularVelocity = shape.getAngularVelocity();
        Body body = physicsWorld.createBody(bodyDef);
        fixtureDef.shape = circleShape = new CircleShape();
        circleShape.setRadius(0.5f * shape.getWidthScaled() / f);
        body.createFixture(fixtureDef);
        circleShape.dispose();
        return body;
    }

    public static FixtureDef createFixtureDef(float f, float f2, float f3) {
        return PhysicsFactory.createFixtureDef(f, f2, f3, false);
    }

    public static FixtureDef createFixtureDef(float f, float f2, float f3, boolean bl) {
        FixtureDef fixtureDef = new FixtureDef();
        fixtureDef.density = f;
        fixtureDef.restitution = f2;
        fixtureDef.friction = f3;
        fixtureDef.isSensor = bl;
        return fixtureDef;
    }

    public static FixtureDef createFixtureDef(float f, float f2, float f3, boolean bl, short s, short s2, short s3) {
        FixtureDef fixtureDef = new FixtureDef();
        fixtureDef.density = f;
        fixtureDef.restitution = f2;
        fixtureDef.friction = f3;
        fixtureDef.isSensor = bl;
        Filter filter = fixtureDef.filter;
        filter.categoryBits = s;
        filter.maskBits = s2;
        filter.groupIndex = s3;
        return fixtureDef;
    }

    public static Body createLineBody(PhysicsWorld physicsWorld, Line line, FixtureDef fixtureDef) {
        return PhysicsFactory.createLineBody(physicsWorld, line, fixtureDef, 32.0f);
    }

    public static Body createLineBody(PhysicsWorld physicsWorld, Line line, FixtureDef fixtureDef, float f) {
        BodyDef bodyDef = new BodyDef();
        bodyDef.type = BodyDef.BodyType.StaticBody;
        Body body = physicsWorld.createBody(bodyDef);
        PolygonShape polygonShape = new PolygonShape();
        polygonShape.setAsEdge(new Vector2(line.getX1() / f, line.getY1() / f), new Vector2(line.getX2() / f, line.getY2() / f));
        fixtureDef.shape = polygonShape;
        body.createFixture(fixtureDef);
        polygonShape.dispose();
        return body;
    }

    public static Body createPolygonBody(PhysicsWorld physicsWorld, org.anddev.andengine.entity.shape.Shape shape, Vector2[] arrvector2, BodyDef.BodyType bodyType, FixtureDef fixtureDef) {
        return PhysicsFactory.createPolygonBody(physicsWorld, shape, arrvector2, bodyType, fixtureDef, 32.0f);
    }

    public static Body createPolygonBody(PhysicsWorld physicsWorld, org.anddev.andengine.entity.shape.Shape shape, Vector2[] arrvector2, BodyDef.BodyType bodyType, FixtureDef fixtureDef, float f) {
        BodyDef bodyDef = new BodyDef();
        bodyDef.type = bodyType;
        float[] arrf = shape.getSceneCenterCoordinates();
        bodyDef.position.x = arrf[0] / f;
        bodyDef.position.y = arrf[1] / f;
        bodyDef.linearVelocity.set(shape.getVelocityX(), shape.getVelocityY());
        bodyDef.angularVelocity = shape.getAngularVelocity();
        Body body = physicsWorld.createBody(bodyDef);
        PolygonShape polygonShape = new PolygonShape();
        polygonShape.set(arrvector2);
        fixtureDef.shape = polygonShape;
        body.createFixture(fixtureDef);
        polygonShape.dispose();
        return body;
    }

    public static Body createTrianglulatedBody(PhysicsWorld physicsWorld, org.anddev.andengine.entity.shape.Shape shape, List<Vector2> list, BodyDef.BodyType bodyType, FixtureDef fixtureDef) {
        return PhysicsFactory.createTrianglulatedBody(physicsWorld, shape, list, bodyType, fixtureDef, 32.0f);
    }

    public static Body createTrianglulatedBody(PhysicsWorld physicsWorld, org.anddev.andengine.entity.shape.Shape shape, List<Vector2> list, BodyDef.BodyType bodyType, FixtureDef fixtureDef, float f) {
        Vector2[] arrvector2 = new Vector2[3];
        BodyDef bodyDef = new BodyDef();
        bodyDef.type = bodyType;
        float[] arrf = shape.getSceneCenterCoordinates();
        bodyDef.position.x = arrf[0] / f;
        bodyDef.position.y = arrf[1] / f;
        bodyDef.linearVelocity.set(shape.getVelocityX(), shape.getVelocityY());
        bodyDef.angularVelocity = shape.getAngularVelocity();
        Body body = physicsWorld.createBody(bodyDef);
        int n = list.size();
        int n2 = 0;
        while (n2 < n) {
            PolygonShape polygonShape = new PolygonShape();
            int n3 = n2 + 1;
            arrvector2[2] = list.get(n2);
            int n4 = n3 + 1;
            arrvector2[1] = list.get(n3);
            int n5 = n4 + 1;
            arrvector2[0] = list.get(n4);
            polygonShape.set(arrvector2);
            fixtureDef.shape = polygonShape;
            body.createFixture(fixtureDef);
            polygonShape.dispose();
            n2 = n5;
        }
        return body;
    }
}

