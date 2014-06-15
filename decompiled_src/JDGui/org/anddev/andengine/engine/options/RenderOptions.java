package org.anddev.andengine.engine.options;

public class RenderOptions
{
  private boolean mDisableExtensionVertexBufferObjects = false;
  
  public RenderOptions disableExtensionVertexBufferObjects()
  {
    return setDisableExtensionVertexBufferObjects(true);
  }
  
  public RenderOptions enableExtensionVertexBufferObjects()
  {
    return setDisableExtensionVertexBufferObjects(false);
  }
  
  public boolean isDisableExtensionVertexBufferObjects()
  {
    return this.mDisableExtensionVertexBufferObjects;
  }
  
  public RenderOptions setDisableExtensionVertexBufferObjects(boolean paramBoolean)
  {
    this.mDisableExtensionVertexBufferObjects = paramBoolean;
    return this;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.engine.options.RenderOptions
 * JD-Core Version:    0.7.0.1
 */