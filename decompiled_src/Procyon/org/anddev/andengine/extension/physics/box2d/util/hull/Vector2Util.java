package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.*;

class Vector2Util
{
    public static float area2(final Vector2 vector2, final Vector2 vector2, final Vector2 vector3) {
        return (vector2.x - vector2.x) * (vector3.y - vector2.y) - (vector3.x - vector2.x) * (vector2.y - vector2.y);
    }
    
    public static float area2(final Vector2 vector2, final Vector2Line vector2Line) {
        return area2(vector2, vector2Line.mVertexA, vector2Line.mVertexB);
    }
    
    public static float getManhattanDistance(final Vector2 vector2, final Vector2 vector2) {
        return Math.abs(vector2.x - vector2.x) + Math.abs(vector2.y - vector2.y);
    }
    
    public static boolean isBetween(final Vector2 vector2, final Vector2 vector2, final Vector2 vector3) {
        return getManhattanDistance(vector2, vector3) >= getManhattanDistance(vector2, vector2) + getManhattanDistance(vector2, vector3);
    }
    
    public static boolean isConvex(final Vector2 vector2, final Vector2 vector2, final Vector2 vector3) {
        final float area2 = area2(vector2, vector2, vector3);
        return area2 < 0.0f || (area2 == 0.0f && !isBetween(vector2, vector2, vector3));
    }
    
    public static boolean isLess(final Vector2 vector2, final Vector2 vector2) {
        final float cross = vector2.cross(vector2);
        return cross > 0.0f || (cross == 0.0f && isLonger(vector2, vector2));
    }
    
    public static boolean isLonger(final Vector2 vector2, final Vector2 vector2) {
        return vector2.lenManhattan() > vector2.lenManhattan();
    }
    
    public static boolean isRightOf(final Vector2 vector2, final Vector2Line vector2Line) {
        return area2(vector2, vector2Line) < 0.0f;
    }
}
