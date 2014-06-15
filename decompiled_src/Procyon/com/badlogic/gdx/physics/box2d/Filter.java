package com.badlogic.gdx.physics.box2d;

public class Filter
{
    public short categoryBits;
    public short groupIndex;
    public short maskBits;
    
    public Filter() {
        super();
        this.categoryBits = 1;
        this.maskBits = -1;
        this.groupIndex = 0;
    }
}
