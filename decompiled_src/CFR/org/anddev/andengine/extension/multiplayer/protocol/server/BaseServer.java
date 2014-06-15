/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Iterator;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.server.BaseClientConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.server.ClientConnector;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ProtocolConstants;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.SocketUtils;

public abstract class BaseServer<CC extends ClientConnector>
extends Thread
implements ProtocolConstants {
    private final BaseClientConnectionListener mClientConnectionListener;
    protected final ArrayList<CC> mClientConnectors = new ArrayList<CC>();
    private boolean mRunning = false;
    private final int mServerPort;
    private ServerSocket mServerSocket;
    private final IServerStateListener mServerStateListener;
    private boolean mTerminated = false;

    public BaseServer() {
        this(4444);
    }

    public BaseServer(int n) {
        this(n, new BaseClientConnectionListener.DefaultClientConnectionListener());
    }

    public BaseServer(int n, BaseClientConnectionListener baseClientConnectionListener) {
        this(n, baseClientConnectionListener, new IServerStateListener.DefaultServerStateListener());
    }

    public BaseServer(int n, BaseClientConnectionListener baseClientConnectionListener, IServerStateListener iServerStateListener) {
        this.mServerStateListener = iServerStateListener;
        if (n < 0) {
            this.mServerStateListener.onException(new IllegalArgumentException("Illegal port '< 0'."));
            throw new IllegalArgumentException();
        }
        this.mServerPort = n;
        this.mClientConnectionListener = baseClientConnectionListener;
        this.initName();
    }

    public BaseServer(int n, IServerStateListener iServerStateListener) {
        this(n, new BaseClientConnectionListener.DefaultClientConnectionListener(), iServerStateListener);
    }

    public BaseServer(BaseClientConnectionListener baseClientConnectionListener) {
        this(4444, baseClientConnectionListener);
    }

    public BaseServer(BaseClientConnectionListener baseClientConnectionListener, IServerStateListener iServerStateListener) {
        this(4444, baseClientConnectionListener, iServerStateListener);
    }

    public BaseServer(IServerStateListener iServerStateListener) {
        this(4444, iServerStateListener);
    }

    private void initName() {
        this.setName(this.getClass().getName());
    }

    protected void finalize() throws Throwable {
        this.interrupt();
        super.finalize();
    }

    @Override
    public void interrupt() {
        try {
            this.mTerminated = true;
            super.interrupt();
            Iterator<CC> iterator = this.mClientConnectors.iterator();
            do {
                if (!iterator.hasNext()) {
                    this.mClientConnectors.clear();
                    Thread.sleep(1000);
                    SocketUtils.closeSocket(this.mServerSocket);
                    this.mRunning = false;
                    return;
                }
                ((ClientConnector)iterator.next()).interrupt();
            } while (true);
        }
        catch (Exception var1_2) {
            this.mServerStateListener.onException(var1_2);
            return;
        }
    }

    public boolean isRunning() {
        return this.mRunning;
    }

    public boolean isTerminated() {
        return this.mTerminated;
    }

    protected abstract CC newClientConnector(Socket var1, BaseClientConnectionListener var2) throws Exception;

    /*
     * Exception decompiling
     */
    @Override
    public void run() {
        // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
        // org.benf.cfr.reader.util.ConfusedCFRException: Tried to end blocks [0[TRYBLOCK]], but top level block is 7[CATCHBLOCK]
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op04StructuredStatement.processEndingBlocks(Op04StructuredStatement.java:406)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op04StructuredStatement.buildNestedBlocks(Op04StructuredStatement.java:458)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.createInitialStructuredBlock(Op03SimpleStatement.java:2648)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisInner(CodeAnalyser.java:670)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisOrWrapFail(CodeAnalyser.java:185)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysis(CodeAnalyser.java:143)
        // org.benf.cfr.reader.entities.attributes.AttributeCode.analyse(AttributeCode.java:78)
        // org.benf.cfr.reader.entities.Method.analyse(Method.java:364)
        // org.benf.cfr.reader.entities.ClassFile.analyseMid(ClassFile.java:683)
        // org.benf.cfr.reader.entities.ClassFile.analyseTop(ClassFile.java:616)
        // org.benf.cfr.reader.Main.doJar(Main.java:116)
        // org.benf.cfr.reader.Main.main(Main.java:167)
        throw new IllegalStateException("Decompilation failed");
    }

    public void sendBroadcastServerMessage(BaseServerMessage baseServerMessage) throws IOException {
        if (!this.mRunning || this.mTerminated) return;
        Iterator<CC> iterator = this.mClientConnectors.iterator();
        while (iterator.hasNext()) {
            ClientConnector clientConnector = (ClientConnector)iterator.next();
            try {
                clientConnector.sendServerMessage(baseServerMessage);
                continue;
            }
            catch (IOException var4_4) {
                this.mServerStateListener.onException(var4_4);
                continue;
            }
            break;
        }
        return;
    }

    public interface IServerStateListener {
        public void onException(Throwable var1);

        public void onStarted(int var1);

        public void onTerminated(int var1);

        public static class DefaultServerStateListener
        implements IServerStateListener {
            @Override
            public void onException(Throwable throwable) {
                Debug.e(throwable);
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

