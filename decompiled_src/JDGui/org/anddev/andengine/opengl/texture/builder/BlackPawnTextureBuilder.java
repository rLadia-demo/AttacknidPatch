package org.anddev.andengine.opengl.texture.builder;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import org.anddev.andengine.opengl.texture.BuildableTexture;
import org.anddev.andengine.opengl.texture.BuildableTexture.TextureSourceWithWithLocationCallback;
import org.anddev.andengine.opengl.texture.Texture.TextureSourceWithLocation;
import org.anddev.andengine.opengl.texture.source.ITextureSource;
import org.anddev.andengine.util.Callback;

public class BlackPawnTextureBuilder
  implements ITextureBuilder
{
  private static final Comparator<ITextureSource> TEXTURESOURCE_COMPARATOR = new Comparator()
  {
    public int compare(ITextureSource paramAnonymousITextureSource1, ITextureSource paramAnonymousITextureSource2)
    {
      int i = paramAnonymousITextureSource2.getWidth() - paramAnonymousITextureSource1.getWidth();
      if (i != 0) {
        return i;
      }
      return paramAnonymousITextureSource2.getHeight() - paramAnonymousITextureSource1.getHeight();
    }
  };
  private final int mTextureSourceSpacing;
  
  public BlackPawnTextureBuilder(int paramInt)
  {
    this.mTextureSourceSpacing = paramInt;
  }
  
  public void pack(BuildableTexture paramBuildableTexture, ArrayList<BuildableTexture.TextureSourceWithWithLocationCallback> paramArrayList)
    throws IllegalArgumentException
  {
    Collections.sort(paramArrayList, TEXTURESOURCE_COMPARATOR);
    Node localNode1 = new Node(new Rect(0, 0, paramBuildableTexture.getWidth(), paramBuildableTexture.getHeight()));
    int i = paramArrayList.size();
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return;
      }
      BuildableTexture.TextureSourceWithWithLocationCallback localTextureSourceWithWithLocationCallback = (BuildableTexture.TextureSourceWithWithLocationCallback)paramArrayList.get(j);
      ITextureSource localITextureSource = localTextureSourceWithWithLocationCallback.getTextureSource();
      Node localNode2 = localNode1.insert(localITextureSource, paramBuildableTexture.getWidth(), paramBuildableTexture.getHeight(), this.mTextureSourceSpacing);
      if (localNode2 == null) {
        throw new IllegalArgumentException("Could not pack: " + localITextureSource.toString());
      }
      Texture.TextureSourceWithLocation localTextureSourceWithLocation = paramBuildableTexture.addTextureSource(localITextureSource, Node.access$0(localNode2).mLeft, Node.access$0(localNode2).mTop);
      localTextureSourceWithWithLocationCallback.getCallback().onCallback(localTextureSourceWithLocation);
    }
  }
  
  protected static class Node
  {
    private Node mChildA;
    private Node mChildB;
    private final BlackPawnTextureBuilder.Rect mRect;
    private ITextureSource mTextureSource;
    
    public Node(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      this(new BlackPawnTextureBuilder.Rect(paramInt1, paramInt2, paramInt3, paramInt4));
    }
    
    public Node(BlackPawnTextureBuilder.Rect paramRect)
    {
      this.mRect = paramRect;
    }
    
    private Node createChildren(ITextureSource paramITextureSource, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
    {
      BlackPawnTextureBuilder.Rect localRect = this.mRect;
      if (paramInt4 >= paramInt5) {
        this.mChildA = new Node(localRect.getLeft(), localRect.getTop(), paramInt3 + paramITextureSource.getWidth(), localRect.getHeight());
      }
      for (this.mChildB = new Node(localRect.getLeft() + (paramInt3 + paramITextureSource.getWidth()), localRect.getTop(), localRect.getWidth() - (paramInt3 + paramITextureSource.getWidth()), localRect.getHeight());; this.mChildB = new Node(localRect.getLeft(), localRect.getTop() + (paramInt3 + paramITextureSource.getHeight()), localRect.getWidth(), localRect.getHeight() - (paramInt3 + paramITextureSource.getHeight())))
      {
        return this.mChildA.insert(paramITextureSource, paramInt1, paramInt2, paramInt3);
        this.mChildA = new Node(localRect.getLeft(), localRect.getTop(), localRect.getWidth(), paramInt3 + paramITextureSource.getHeight());
      }
    }
    
    public Node getChildA()
    {
      return this.mChildA;
    }
    
    public Node getChildB()
    {
      return this.mChildB;
    }
    
    public BlackPawnTextureBuilder.Rect getRect()
    {
      return this.mRect;
    }
    
    public Node insert(ITextureSource paramITextureSource, int paramInt1, int paramInt2, int paramInt3)
      throws IllegalArgumentException
    {
      if ((this.mChildA != null) && (this.mChildB != null))
      {
        Node localNode = this.mChildA.insert(paramITextureSource, paramInt1, paramInt2, paramInt3);
        if (localNode != null) {
          return localNode;
        }
        return this.mChildB.insert(paramITextureSource, paramInt1, paramInt2, paramInt3);
      }
      if (this.mTextureSource != null) {
        return null;
      }
      int i = paramITextureSource.getWidth();
      int j = paramITextureSource.getHeight();
      int k = this.mRect.getWidth();
      int m = this.mRect.getHeight();
      if ((i > k) || (j > m)) {
        return null;
      }
      int n = i + paramInt3;
      int i1 = j + paramInt3;
      int i2 = this.mRect.getLeft();
      int i3 = this.mRect.getTop();
      int i4;
      int i5;
      if ((j == m) && (i3 + j == paramInt2))
      {
        i4 = 1;
        if ((i != k) || (i2 + i != paramInt1)) {
          break label205;
        }
        i5 = 1;
      }
      for (;;)
      {
        if (n == k)
        {
          if (i1 == m)
          {
            this.mTextureSource = paramITextureSource;
            return this;
            i4 = 0;
            break;
            label205:
            i5 = 0;
            continue;
          }
          if (i4 != 0)
          {
            this.mTextureSource = paramITextureSource;
            return this;
          }
        }
      }
      if (i5 != 0)
      {
        if (i1 == m)
        {
          this.mTextureSource = paramITextureSource;
          return this;
        }
        if (i4 != 0)
        {
          this.mTextureSource = paramITextureSource;
          return this;
        }
        if (i1 > m) {
          return null;
        }
        return createChildren(paramITextureSource, paramInt1, paramInt2, paramInt3, k - i, m - i1);
      }
      if (i4 != 0)
      {
        if (n == k)
        {
          this.mTextureSource = paramITextureSource;
          return this;
        }
        if (n > k) {
          return null;
        }
        return createChildren(paramITextureSource, paramInt1, paramInt2, paramInt3, k - n, m - j);
      }
      if ((n > k) || (i1 > m)) {
        return null;
      }
      return createChildren(paramITextureSource, paramInt1, paramInt2, paramInt3, k - n, m - i1);
    }
  }
  
  protected static class Rect
  {
    private final int mHeight;
    private final int mLeft;
    private final int mTop;
    private final int mWidth;
    
    public Rect(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      this.mLeft = paramInt1;
      this.mTop = paramInt2;
      this.mWidth = paramInt3;
      this.mHeight = paramInt4;
    }
    
    public int getBottom()
    {
      return this.mTop + this.mHeight;
    }
    
    public int getHeight()
    {
      return this.mHeight;
    }
    
    public int getLeft()
    {
      return this.mLeft;
    }
    
    public int getRight()
    {
      return this.mLeft + this.mWidth;
    }
    
    public int getTop()
    {
      return this.mTop;
    }
    
    public int getWidth()
    {
      return this.mWidth;
    }
    
    public String toString()
    {
      return "@: " + this.mLeft + "/" + this.mTop + " * " + this.mWidth + "x" + this.mHeight;
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.opengl.texture.builder.BlackPawnTextureBuilder
 * JD-Core Version:    0.7.0.1
 */