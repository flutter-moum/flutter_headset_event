package flutter.moum.headset_event;

import android.content.Intent;
import android.content.IntentFilter;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** HeadsetEventPlugin */
public class HeadsetEventPlugin implements MethodCallHandler{

  public static MethodChannel headsetEventChannel;
  public static int currentState = -1;
  private static HeadsetBroadcastReceiver hReceiver;
  private static final String TAG = "HeadsetEventPlugin";

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    headsetEventChannel = new MethodChannel(registrar.messenger(), "flutter.moum/headset_event");
    headsetEventChannel.setMethodCallHandler(new HeadsetEventPlugin());
    hReceiver = new HeadsetBroadcastReceiver(headsetEventListener);
    IntentFilter filter = new IntentFilter();
    filter.addAction(Intent.ACTION_HEADSET_PLUG);
    filter.addAction(Intent.ACTION_MEDIA_BUTTON);
    registrar.activeContext().registerReceiver(hReceiver, filter);

  }



  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("register")) {
        // invoke

    } else if(call.method.equals("unregister")) {

    } else if(call.method.equals("getCurrentState")) {
      result.success(currentState);
    } else {
      result.notImplemented();
    }
  }

  static HeadsetEventListener headsetEventListener = new HeadsetEventListener() {
      @Override
      public void onHeadsetConnect() {
          headsetEventChannel.invokeMethod("connect", "true");
      }

      @Override
      public void onHeadsetDisconnect() {
          headsetEventChannel.invokeMethod("disconnect", "true");
      }

      @Override
      public void onNextButtonPress() {
          headsetEventChannel.invokeMethod("nextButton", "true");
      }

      @Override
      public void onPrevButtonPress() {
          headsetEventChannel.invokeMethod("prevButton", "true");
      }
  };
}
