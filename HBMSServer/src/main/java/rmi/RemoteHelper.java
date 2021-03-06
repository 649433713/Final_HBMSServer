package rmi;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;

/**
 * @author 凡
 *
 */
public class RemoteHelper {
	static DataRemoteObject dataRemoteObject;
	public RemoteHelper(){
		initServer();
	}
	
	public void initServer(){
		try {
			dataRemoteObject = new DataRemoteObject();
			LocateRegistry.createRegistry(8888);
//			Naming.rebind("rmi://192.168.43.168:8888/DataRemoteObject",dataRemoteObject);
			
			Naming.rebind("rmi://127.0.0.1:8888/DataRemoteObject",dataRemoteObject);
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
	}
}
