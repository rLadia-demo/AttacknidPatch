/*
 * Decompiled with CFR 0_79.
 */
package com.badlogic.gdx.physics.box2d;

import com.badlogic.gdx.physics.box2d.Body;
import com.badlogic.gdx.physics.box2d.Joint;

public class JointEdge {
    public final Joint joint;
    public final Body other;

    protected JointEdge(Body body, Joint joint) {
        this.other = body;
        this.joint = joint;
    }
}

