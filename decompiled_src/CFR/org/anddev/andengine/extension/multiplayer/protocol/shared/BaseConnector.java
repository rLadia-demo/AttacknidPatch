/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.shared;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.shared.IMessageSwitch;
import org.anddev.andengine.util.SocketUtils;

public abstract class BaseConnector<M extends IMessage>
extends Thread {
    private boolean mConnectionCloseSent = false;
    private final BaseConnectionListener<M, BaseConnector<M>> mConnectionListener;
    private final DataInputStream mDataInputStream;
    private final DataOutputStream mDataOutputStream;
    private final BaseMessageExtractor<M> mMessageExtractor;
    private final IMessageSwitch<M> mMessageSwitch;
    private final Socket mSocket;

    public BaseConnector(Socket socket, BaseConnectionListener<M, BaseConnector<M>> baseConnectionListener, BaseMessageExtractor<M> baseMessageExtractor, IMessageSwitch<M> iMessageSwitch) throws IOException {
        this.mSocket = socket;
        this.mConnectionListener = baseConnectionListener;
        this.mMessageExtractor = baseMessageExtractor;
        this.mMessageSwitch = iMessageSwitch;
        this.mDataInputStream = new DataInputStream(socket.getInputStream());
        this.mDataOutputStream = new DataOutputStream(socket.getOutputStream());
    }

    private void closeConnection() {
        if (!(this.mConnectionCloseSent || this.mSocket == null || this.mSocket.isClosed())) {
            this.mConnectionCloseSent = true;
            this.onSendConnectionClose();
        }
        SocketUtils.closeSocket(this.mSocket);
        if (this.mConnectionListener == null) return;
        this.mConnectionListener.onDisconnect(this);
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

    protected abstract void handleMessage(M var1) throws IOException;

    public boolean hasConnectionListener() {
        if (this.mConnectionListener == null) return false;
        return true;
    }

    @Override
    public void interrupt() {
        this.closeConnection();
        super.interrupt();
    }

    protected abstract void onSendConnectionClose();

    /*
     * Exception decompiling
     */
    @Override
    public void run() {
        // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
        // org.benf.cfr.reader.util.ConfusedCFRException: Tried to end blocks [0[TRYBLOCK]], but top level block is 10[CATCHBLOCK]
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
}

