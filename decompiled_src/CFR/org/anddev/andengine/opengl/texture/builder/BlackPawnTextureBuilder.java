/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.texture.builder;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import org.anddev.andengine.opengl.texture.BuildableTexture;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.builder.ITextureBuilder;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.util.Callback;

public class BlackPawnTextureBuilder
implements ITextureBuilder {
    private static final Comparator<ITextureSource> TEXTURESOURCE_COMPARATOR = new Comparator<ITextureSource>(){

        @Override
        public int compare(ITextureSource iTextureSource, ITextureSource iTextureSource2) {
            int n = iTextureSource2.getWidth() - iTextureSource.getWidth();
            if (n == 0) return iTextureSource2.getHeight() - iTextureSource.getHeight();
            return n;
        }
    };
    private final int mTextureSourceSpacing;

    public BlackPawnTextureBuilder(int n) {
        this.mTextureSourceSpacing = n;
    }

    @Override
    public void pack(BuildableTexture buildableTexture, ArrayList<BuildableTexture.TextureSourceWithWithLocationCallback> arrayList) throws IllegalArgumentException {
        Collections.sort(arrayList, BlackPawnTextureBuilder.TEXTURESOURCE_COMPARATOR);
        Node node = new Node(new Rect(0, 0, buildableTexture.getWidth(), buildableTexture.getHeight()));
        int n = arrayList.size();
        int n2 = 0;
        while (n2 < n) {
            ITextureSource iTextureSource;
            BuildableTexture.TextureSourceWithWithLocationCallback textureSourceWithWithLocationCallback;
            Node node2;
            if ((node2 = node.insert(iTextureSource = (textureSourceWithWithLocationCallback = arrayList.get(n2)).getTextureSource(), buildableTexture.getWidth(), buildableTexture.getHeight(), this.mTextureSourceSpacing)) == null) {
                throw new IllegalArgumentException("Could not pack: " + iTextureSource.toString());
            }
            Texture.TextureSourceWithLocation textureSourceWithLocation = buildableTexture.addTextureSource(iTextureSource, node2.mRect.mLeft, node2.mRect.mTop);
            textureSourceWithWithLocationCallback.getCallback().onCallback(textureSourceWithLocation);
            ++n2;
        }
        return;
    }

    public static class Node {
        private Node mChildA;
        private Node mChildB;
        private final Rect mRect;
        private ITextureSource mTextureSource;

        public Node(int n, int n2, int n3, int n4) {
            this(new Rect(n, n2, n3, n4));
        }

        public Node(Rect rect) {
            this.mRect = rect;
        }

        /*
         * Enabled aggressive block sorting
         */
        private Node createChildren(ITextureSource iTextureSource, int n, int n2, int n3, int n4, int n5) {
            Rect rect = this.mRect;
            if (n4 >= n5) {
                this.mChildA = new Node(rect.getLeft(), rect.getTop(), n3 + iTextureSource.getWidth(), rect.getHeight());
                this.mChildB = new Node(rect.getLeft() + n3 + iTextureSource.getWidth(), rect.getTop(), rect.getWidth() - n3 + iTextureSource.getWidth(), rect.getHeight());
                return this.mChildA.insert(iTextureSource, n, n2, n3);
            } else {
                this.mChildA = new Node(rect.getLeft(), rect.getTop(), rect.getWidth(), n3 + iTextureSource.getHeight());
                this.mChildB = new Node(rect.getLeft(), rect.getTop() + n3 + iTextureSource.getHeight(), rect.getWidth(), rect.getHeight() - n3 + iTextureSource.getHeight());
            }
            return this.mChildA.insert(iTextureSource, n, n2, n3);
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

        /*
         * Enabled aggressive block sorting
         */
        public Node insert(ITextureSource iTextureSource, int n, int n2, int n3) throws IllegalArgumentException {
            if (this.mChildA != null && this.mChildB != null) {
                Node node = this.mChildA.insert(iTextureSource, n, n2, n3);
                if (node == null) return this.mChildB.insert(iTextureSource, n, n2, n3);
                return node;
            }
            if (this.mTextureSource != null) {
                return null;
            }
            int n4 = iTextureSource.getWidth();
            int n5 = iTextureSource.getHeight();
            int n6 = this.mRect.getWidth();
            int n7 = this.mRect.getHeight();
            if (n4 > n6) return null;
            if (n5 > n7) {
                return null;
            }
            int n8 = n4 + n3;
            int n9 = n5 + n3;
            int n10 = this.mRect.getLeft();
            int n11 = this.mRect.getTop();
            boolean bl = n5 == n7 && n11 + n5 == n2;
            boolean bl2 = n4 == n6 && n10 + n4 == n;
            if (n8 == n6) {
                if (n9 == n7) {
                    this.mTextureSource = iTextureSource;
                    return this;
                }
                if (bl) {
                    this.mTextureSource = iTextureSource;
                    return this;
                }
            }
            if (bl2) {
                if (n9 == n7) {
                    this.mTextureSource = iTextureSource;
                    return this;
                }
                if (bl) {
                    this.mTextureSource = iTextureSource;
                    return this;
                }
                if (n9 <= n7) return this.createChildren(iTextureSource, n, n2, n3, n6 - n4, n7 - n9);
                return null;
            }
            if (bl) {
                if (n8 == n6) {
                    this.mTextureSource = iTextureSource;
                    return this;
                }
                if (n8 <= n6) return this.createChildren(iTextureSource, n, n2, n3, n6 - n8, n7 - n5);
                return null;
            }
            if (n8 > n6) return null;
            if (n9 <= n7) return this.createChildren(iTextureSource, n, n2, n3, n6 - n8, n7 - n9);
            return null;
        }
    }

    public static class Rect {
        private final int mHeight;
        private final int mLeft;
        private final int mTop;
        private final int mWidth;

        public Rect(int n, int n2, int n3, int n4) {
            this.mLeft = n;
            this.mTop = n2;
            this.mWidth = n3;
            this.mHeight = n4;
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

        public String toString() {
            return "@: " + this.mLeft + "/" + this.mTop + " * " + this.mWidth + "x" + this.mHeight;
        }
    }

}

