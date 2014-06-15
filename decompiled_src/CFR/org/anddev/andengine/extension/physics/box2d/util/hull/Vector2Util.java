/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.physics.box2d.util.hull;

import com.badlogic.gdx.math.Vector2;
import org.anddev.andengine.extension.physics.box2d.util.hull.Vector2Line;

class Vector2Util {
    Vector2Util() {
    }

    public static float area2(Vector2 vector2, Vector2 vector22, Vector2 vector23) {
        return (vector22.x - vector2.x) * (vector23.y - vector2.y) - (vector23.x - vector2.x) * (vector22.y - vector2.y);
    }

    public static float area2(Vector2 vector2, Vector2Line vector2Line) {
        return Vector2Util.area2(vector2, vector2Line.mVertexA, vector2Line.mVertexB);
    }

    public static float getManhattanDistance(Vector2 vector2, Vector2 vector22) {
        return Math.abs(vector2.x - vector22.x) + Math.abs(vector2.y - vector22.y);
    }

    public static boolean isBetween(Vector2 vector2, Vector2 vector22, Vector2 vector23) {
        if (Vector2Util.getManhattanDistance(vector22, vector23) < Vector2Util.getManhattanDistance(vector2, vector22) + Vector2Util.getManhattanDistance(vector2, vector23)) return false;
        return true;
    }

    public static boolean isConvex(Vector2 vector2, Vector2 vector22, Vector2 vector23) {
        float f = Vector2Util.area2(vector2, vector22, vector23);
        if (f < 0.0f || f == 0.0f && !Vector2Util.isBetween(vector2, vector22, vector23)) return true;
        return false;
    }

    public static boolean isLess(Vector2 vector2, Vector2 vector22) {
        float f = vector2.cross(vector22);
        if (f > 0.0f || f == 0.0f && Vector2Util.isLonger(vector2, vector22)) return true;
        return false;
    }

    public static boolean isLonger(Vector2 vector2, Vector2 vector22) {
        if (vector2.lenManhattan() <= vector22.lenManhattan()) return false;
        return true;
    }

    public static boolean isRightOf(Vector2 vector2, Vector2Line vector2Line) {
        if (Vector2Util.area2(vector2, vector2Line) >= 0.0f) return false;
        return true;
    }
}

