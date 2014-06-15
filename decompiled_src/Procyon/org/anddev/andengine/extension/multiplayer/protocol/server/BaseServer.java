package org.anddev.andengine.extension.multiplayer.protocol.server;

import org.anddev.andengine.extension.multiplayer.protocol.util.constants.*;
import java.util.*;
import javax.net.*;
import java.net.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import java.io.*;
import org.anddev.andengine.util.*;

public abstract class BaseServer<CC extends ClientConnector> extends Thread implements ProtocolConstants
{
    private final BaseClientConnectionListener mClientConnectionListener;
    protected final ArrayList<CC> mClientConnectors;
    private boolean mRunning;
    private final int mServerPort;
    private ServerSocket mServerSocket;
    private final IServerStateListener mServerStateListener;
    private boolean mTerminated;
    
    public BaseServer() {
        this(4444);
    }
    
    public BaseServer(final int n) {
        this(n, new BaseClientConnectionListener.DefaultClientConnectionListener());
    }
    
    public BaseServer(final int n, final BaseClientConnectionListener baseClientConnectionListener) {
        this(n, baseClientConnectionListener, new DefaultServerStateListener());
    }
    
    public BaseServer(final int mServerPort, final BaseClientConnectionListener mClientConnectionListener, final IServerStateListener mServerStateListener) {
        super();
        this.mClientConnectors = new ArrayList<CC>();
        this.mRunning = false;
        this.mTerminated = false;
        this.mServerStateListener = mServerStateListener;
        if (mServerPort < 0) {
            this.mServerStateListener.onException(new IllegalArgumentException("Illegal port '< 0'."));
            throw new IllegalArgumentException();
        }
        this.mServerPort = mServerPort;
        this.mClientConnectionListener = mClientConnectionListener;
        this.initName();
    }
    
    public BaseServer(final int n, final IServerStateListener serverStateListener) {
        this(n, new BaseClientConnectionListener.DefaultClientConnectionListener(), serverStateListener);
    }
    
    public BaseServer(final BaseClientConnectionListener baseClientConnectionListener) {
        this(4444, baseClientConnectionListener);
    }
    
    public BaseServer(final BaseClientConnectionListener baseClientConnectionListener, final IServerStateListener serverStateListener) {
        this(4444, baseClientConnectionListener, serverStateListener);
    }
    
    public BaseServer(final IServerStateListener serverStateListener) {
        this(4444, serverStateListener);
    }
    
    private void initName() {
        this.setName(this.getClass().getName());
    }
    
    @Override
    protected void finalize() throws Throwable {
        this.interrupt();
        super.finalize();
    }
    
    @Override
    public void interrupt() {
        try {
            this.mTerminated = true;
            super.interrupt();
            final Iterator<CC> iterator = this.mClientConnectors.iterator();
            while (iterator.hasNext()) {
                iterator.next().interrupt();
            }
            this.mClientConnectors.clear();
            Thread.sleep(1000L);
            SocketUtils.closeSocket(this.mServerSocket);
            this.mRunning = false;
        }
        catch (Exception ex) {
            this.mServerStateListener.onException(ex);
        }
    }
    
    public boolean isRunning() {
        return this.mRunning;
    }
    
    public boolean isTerminated() {
        return this.mTerminated;
    }
    
    protected abstract CC newClientConnector(final Socket p0, final BaseClientConnectionListener p1) throws Exception;
    
    @Override
    public void run() {
        this.mRunning = true;
        this.mTerminated = false;
        this.mServerStateListener.onStarted(this.mServerPort);
        try {
            Thread.currentThread().setPriority(1);
            this.mServerSocket = ServerSocketFactory.getDefault().createServerSocket(this.mServerPort);
            while (!Thread.interrupted()) {
                try {
                    final ClientConnector clientConnector = this.newClientConnector(this.mServerSocket.accept(), this.mClientConnectionListener);
                    this.mClientConnectors.add((CC)clientConnector);
                    clientConnector.start();
                }
                catch (SocketException ex) {
                    if (!ex.getMessage().equals("socket closed") && !ex.getMessage().equals("Socket is closed")) {
                        this.mServerStateListener.onException(ex);
                        break;
                    }
                    break;
                }
                catch (Throwable t) {
                    this.mServerStateListener.onException(t);
                }
            }
        }
        catch (Throwable t2) {}
        finally {
            this.mRunning = false;
            this.mTerminated = true;
            SocketUtils.closeSocket(this.mServerSocket);
            this.mServerStateListener.onTerminated(this.mServerPort);
        }
    }
    
    public void sendBroadcastServerMessage(final BaseServerMessage baseServerMessage) throws IOException {
        if (this.mRunning && !this.mTerminated) {
            for (final ClientConnector clientConnector : this.mClientConnectors) {
                try {
                    clientConnector.sendServerMessage(baseServerMessage);
                }
                catch (IOException ex) {
                    this.mServerStateListener.onException(ex);
                }
            }
        }
    }
    
    public interface IServerStateListener
    {
        void onException(Throwable p0);
        
        void onStarted(int p0);
        
        void onTerminated(int p0);
        
        public static class DefaultServerStateListener implements IServerStateListener
        {
            @Override
            public void onException(Throwable t) {
                Debug.e(t);
            }
            
            @Override
            public void onStarted(int n) {
                Debug.d("AndRemote-Server is listening on Port: " + n);
            }
            
            @Override
            public void onTerminated(int n) {
                Debug.d("AndRemote-Server terminated on Port: " + n);
            }
        }
    }
}
