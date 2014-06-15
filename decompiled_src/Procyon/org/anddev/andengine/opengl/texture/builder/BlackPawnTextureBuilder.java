package org.anddev.andengine.opengl.texture.builder;

import org.anddev.andengine.opengl.texture.source.*;
import org.anddev.andengine.opengl.texture.*;
import java.util.*;

public class BlackPawnTextureBuilder implements ITextureBuilder
{
    private static final Comparator<ITextureSource> TEXTURESOURCE_COMPARATOR;
    private final int mTextureSourceSpacing;
    
    static {
        TEXTURESOURCE_COMPARATOR = new Comparator<ITextureSource>() {
            @Override
            public int compare(final ITextureSource textureSource, final ITextureSource textureSource2) {
                final int n = textureSource2.getWidth() - textureSource.getWidth();
                if (n != 0) {
                    return n;
                }
                return textureSource2.getHeight() - textureSource.getHeight();
            }
        };
    }
    
    public BlackPawnTextureBuilder(final int mTextureSourceSpacing) {
        super();
        this.mTextureSourceSpacing = mTextureSourceSpacing;
    }
    
    @Override
    public void pack(final BuildableTexture buildableTexture, final ArrayList<BuildableTexture.TextureSourceWithWithLocationCallback> list) throws IllegalArgumentException {
        Collections.sort((List<Object>)list, (Comparator<? super Object>)BlackPawnTextureBuilder.TEXTURESOURCE_COMPARATOR);
        final Node node = new Node(new Rect(0, 0, buildableTexture.getWidth(), buildableTexture.getHeight()));
        for (int size = list.size(), i = 0; i < size; ++i) {
            final BuildableTexture.TextureSourceWithWithLocationCallback textureSourceWithWithLocationCallback = list.get(i);
            final ITextureSource textureSource = textureSourceWithWithLocationCallback.getTextureSource();
            final Node insert = node.insert(textureSource, buildableTexture.getWidth(), buildableTexture.getHeight(), this.mTextureSourceSpacing);
            if (insert == null) {
                throw new IllegalArgumentException("Could not pack: " + textureSource.toString());
            }
            textureSourceWithWithLocationCallback.getCallback().onCallback(buildableTexture.addTextureSource(textureSource, insert.mRect.mLeft, insert.mRect.mTop));
        }
    }
    
    protected static class Node
    {
        private Node mChildA;
        private Node mChildB;
        private final Rect mRect;
        private ITextureSource mTextureSource;
        
        public Node(final int n, final int n2, final int n3, final int n4) {
            this(new Rect(n, n2, n3, n4));
        }
        
        public Node(final Rect mRect) {
            super();
            this.mRect = mRect;
        }
        
        private Node createChildren(final ITextureSource textureSource, final int n, final int n2, final int n3, final int n4, final int n5) {
            final Rect mRect = this.mRect;
            if (n4 >= n5) {
                this.mChildA = new Node(mRect.getLeft(), mRect.getTop(), n3 + textureSource.getWidth(), mRect.getHeight());
                this.mChildB = new Node(mRect.getLeft() + (n3 + textureSource.getWidth()), mRect.getTop(), mRect.getWidth() - (n3 + textureSource.getWidth()), mRect.getHeight());
            }
            else {
                this.mChildA = new Node(mRect.getLeft(), mRect.getTop(), mRect.getWidth(), n3 + textureSource.getHeight());
                this.mChildB = new Node(mRect.getLeft(), mRect.getTop() + (n3 + textureSource.getHeight()), mRect.getWidth(), mRect.getHeight() - (n3 + textureSource.getHeight()));
            }
            return this.mChildA.insert(textureSource, n, n2, n3);
        }
        
        public Node getChildA() {
            return this.mChildA;
        }
        
        public Node getChildB() {
            return this.mChildB;
        }
        
        public Rect getRect() {
            return this.mRect;
        }
        
        public Node insert(final ITextureSource mTextureSource, final int n, final int n2, final int n3) throws IllegalArgumentException {
            if (this.mChildA != null && this.mChildB != null) {
                final Node insert = this.mChildA.insert(mTextureSource, n, n2, n3);
                if (insert != null) {
                    return insert;
                }
                return this.mChildB.insert(mTextureSource, n, n2, n3);
            }
            else {
                if (this.mTextureSource != null) {
                    return null;
                }
                final int width = mTextureSource.getWidth();
                final int height = mTextureSource.getHeight();
                final int width2 = this.mRect.getWidth();
                final int height2 = this.mRect.getHeight();
                if (width > width2 || height > height2) {
                    return null;
                }
                final int n4 = width + n3;
                final int n5 = height + n3;
                final int left = this.mRect.getLeft();
                final int top = this.mRect.getTop();
                final boolean b = height == height2 && top + height == n2;
                final boolean b2 = width == width2 && left + width == n;
                if (n4 == width2) {
                    if (n5 == height2) {
                        this.mTextureSource = mTextureSource;
                        return this;
                    }
                    if (b) {
                        this.mTextureSource = mTextureSource;
                        return this;
                    }
                }
                if (b2) {
                    if (n5 == height2) {
                        this.mTextureSource = mTextureSource;
                        return this;
                    }
                    if (b) {
                        this.mTextureSource = mTextureSource;
                        return this;
                    }
                    if (n5 > height2) {
                        return null;
                    }
                    return this.createChildren(mTextureSource, n, n2, n3, width2 - width, height2 - n5);
                }
                else if (b) {
                    if (n4 == width2) {
                        this.mTextureSource = mTextureSource;
                        return this;
                    }
                    if (n4 > width2) {
                        return null;
                    }
                    return this.createChildren(mTextureSource, n, n2, n3, width2 - n4, height2 - height);
                }
                else {
                    if (n4 > width2 || n5 > height2) {
                        return null;
                    }
                    return this.createChildren(mTextureSource, n, n2, n3, width2 - n4, height2 - n5);
                }
            }
        }
    }
    
    protected static class Rect
    {
        private final int mHeight;
        private final int mLeft;
        private final int mTop;
        private final int mWidth;
        
        public Rect(final int mLeft, final int mTop, final int mWidth, final int mHeight) {
            super();
            this.mLeft = mLeft;
            this.mTop = mTop;
            this.mWidth = mWidth;
            this.mHeight = mHeight;
        }
        
        public int getBottom() {
            return this.mTop + this.mHeight;
        }
        
        public int getHeight() {
            return this.mHeight;
        }
        
        public int getLeft() {
            return this.mLeft;
        }
        
        public int getRight() {
            return this.mLeft + this.mWidth;
        }
        
        public int getTop() {
            return this.mTop;
        }
        
        public int getWidth() {
            return this.mWidth;
        }
        
        @Override
        public String toString() {
            return "@: " + this.mLeft + "/" + this.mTop + " * " + this.mWidth + "x" + this.mHeight;
        }
    }
}
