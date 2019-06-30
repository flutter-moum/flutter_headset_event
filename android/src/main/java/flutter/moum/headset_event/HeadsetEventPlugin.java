package flutter.moum.headset_event;

import android.content.Intent;
import android.content.IntentFilter;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** HeadsetEventPlugin */
public class HeadsetEventPlugin implements MethodCallHandler {

  public static MethodChannel headsetEventChannel;
  private static HeadsetBroadcastReceiver hReceiver;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    headsetEventChannel = new MethodChannel(registrar.messenger(), "flutter.moum/headset_event");
    headsetEventChannel.setMethodCallHandler(new HeadsetEventPlugin());

    hReceiver = new HeadsetBroadcastReceiver();
    IntentFilter filter = new IntentFilter(Intent.ACTION_HEADSET_PLUG);
    registrar.activeContext().registerReceiver(hReceiver, filter);

  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("register")){

    } else {
      result.notImplemented();
    }
  }

  public static void headsetPlugged() {
    headsetEventChannel.invokeMethod("plugged", "true");
  }
  public static void headsetUnplugged() {
    headsetEventChannel.invokeMethod("plugged", "false");
  }

}
