package org.anddev.andengine.util;

import java.io.IOException;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;

public class SocketUtils
{
  public static final String SOCKETEXCEPTION_MESSAGE_SOCKET_CLOSED = "socket closed";
  public static final String SOCKETEXCEPTION_MESSAGE_SOCKET_IS_CLOSED = "Socket is closed";
  
  public static void closeSocket(ServerSocket paramServerSocket)
  {
    if ((paramServerSocket != null) && (!paramServerSocket.isClosed())) {}
    try
    {
      paramServerSocket.close();
      return;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
  }
  
  public static void closeSocket(Socket paramSocket)
  {
    if ((paramSocket != null) && (!paramSocket.isClosed())) {}
    try
    {
      paramSocket.close();
      return;
    }
    catch (IOException localIOException)
    {
      System.err.println(localIOException.getStackTrace());
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.util.SocketUtils
 * JD-Core Version:    0.7.0.1
 */