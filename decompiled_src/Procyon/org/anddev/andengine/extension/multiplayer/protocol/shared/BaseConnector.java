package org.anddev.andengine.extension.multiplayer.protocol.shared;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;
import java.net.*;
import java.io.*;
import org.anddev.andengine.util.*;

public abstract class BaseConnector<M extends IMessage> extends Thread
{
    private boolean mConnectionCloseSent;
    private final BaseConnectionListener<M, BaseConnector<M>> mConnectionListener;
    private final DataInputStream mDataInputStream;
    private final DataOutputStream mDataOutputStream;
    private final BaseMessageExtractor<M> mMessageExtractor;
    private final IMessageSwitch<M> mMessageSwitch;
    private final Socket mSocket;
    
    public BaseConnector(final Socket mSocket, final BaseConnectionListener<M, BaseConnector<M>> mConnectionListener, final BaseMessageExtractor<M> mMessageExtractor, final IMessageSwitch<M> mMessageSwitch) throws IOException {
        super();
        this.mConnectionCloseSent = false;
        this.mSocket = mSocket;
        this.mConnectionListener = mConnectionListener;
        this.mMessageExtractor = mMessageExtractor;
        this.mMessageSwitch = mMessageSwitch;
        this.mDataInputStream = new DataInputStream(mSocket.getInputStream());
        this.mDataOutputStream = new DataOutputStream(mSocket.getOutputStream());
    }
    
    private void closeConnection() {
        if (!this.mConnectionCloseSent && this.mSocket != null && !this.mSocket.isClosed()) {
            this.mConnectionCloseSent = true;
            this.onSendConnectionClose();
        }
        SocketUtils.closeSocket(this.mSocket);
        if (this.mConnectionListener != null) {
            this.mConnectionListener.onDisconnect(this);
        }
    }
    
    public BaseConnectionListener<M, BaseConnector<M>> getConnectionListener() {
        return this.mConnectionListener;
    }
    
    protected DataInputStream getDataInputStream() {
        return this.mDataInputStream;
    }
    
    protected DataOutputStream getDataOutputStream() {
        return this.mDataOutputStream;
    }
    
    public IMessageSwitch<M> getMessageSwitch() {
        return this.mMessageSwitch;
    }
    
    public Socket getSocket() {
        return this.mSocket;
    }
    
    protected abstract void handleMessage(final M p0) throws IOException;
    
    public boolean hasConnectionListener() {
        return this.mConnectionListener != null;
    }
    
    @Override
    public void interrupt() {
        this.closeConnection();
        super.interrupt();
    }
    
    protected abstract void onSendConnectionClose();
    
    @Override
    public void run() {
        if (this.mConnectionListener != null) {
            this.mConnectionListener.onConnect(this);
        }
        Thread.currentThread().setPriority(1);
        try {
            while (!this.isInterrupted()) {
                try {
                    this.handleMessage(this.mMessageExtractor.readMessage(this.mMessageExtractor.readMessageFlag(this.mDataInputStream), this.mDataInputStream));
                }
                catch (SocketException ex) {
                    this.interrupt();
                }
                catch (EOFException ex2) {
                    this.interrupt();
                }
                catch (Throwable t) {
                    Debug.e(t);
                }
            }
        }
        catch (Throwable t2) {}
    }
}
