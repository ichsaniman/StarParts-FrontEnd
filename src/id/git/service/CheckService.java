package id.git.service;

import java.util.Set;

import sun.jvmstat.monitor.HostIdentifier;
import sun.jvmstat.monitor.MonitoredHost;
import sun.jvmstat.monitor.MonitoredVm;
import sun.jvmstat.monitor.MonitoredVmUtil;
import sun.jvmstat.monitor.VmIdentifier;

public class CheckService {
	public static boolean CheckSend() {
		boolean running = false;
		String processName = "id.git.main.MainSend";

		try {
			HostIdentifier hostIdentifier = new HostIdentifier("local://localhost");

			MonitoredHost monitoredHost;
			monitoredHost = MonitoredHost.getMonitoredHost(hostIdentifier);

			Set activeVms = monitoredHost.activeVms();
			for (Object activeVmId : activeVms) {
				VmIdentifier vmIdentifier = new VmIdentifier("//" + String.valueOf(activeVmId) + "?mode=r");
				MonitoredVm monitoredVm = monitoredHost.getMonitoredVm(vmIdentifier);
				if (monitoredVm != null) {
					String mainClass = MonitoredVmUtil.mainClass(monitoredVm, true);
					if (mainClass.toLowerCase().equals(processName.toLowerCase())) {
						running = true;
						break;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Check send" + e.getMessage());
		}

		System.out.println("Check Send: " + running);
		return running;
	}

	public static boolean CheckGen() {
		boolean running = false;
		String processName = "id.git.main.Main";

		try {
			HostIdentifier hostIdentifier = new HostIdentifier("local://localhost");

			MonitoredHost monitoredHost;
			monitoredHost = MonitoredHost.getMonitoredHost(hostIdentifier);

			Set activeVms = monitoredHost.activeVms();
			for (Object activeVmId : activeVms) {
				VmIdentifier vmIdentifier = new VmIdentifier("//" + String.valueOf(activeVmId) + "?mode=r");
				MonitoredVm monitoredVm = monitoredHost.getMonitoredVm(vmIdentifier);
				if (monitoredVm != null) {
					String mainClass = MonitoredVmUtil.mainClass(monitoredVm, true);
					if (mainClass.toLowerCase().equals(processName.toLowerCase())) {
						running = true;
						break;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Check gen" + e.getMessage());
		}

		System.out.println("Check gen: " + running);
		return running;
	}
}
