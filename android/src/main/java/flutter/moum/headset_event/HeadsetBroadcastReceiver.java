package flutter.moum.headset_event;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

public class HeadsetBroadcastReceiver extends BroadcastReceiver {
    private static final String TAG = "log";

    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction().equals(Intent.ACTION_HEADSET_PLUG)) {
            int state = intent.getIntExtra("state", -1);
            switch (state) {
                case 0:
                    HeadsetEventPlugin.headsetUnplugged();
                    Log.d(TAG, "Headset is unplugged");
                    break;
                case 1:
                    HeadsetEventPlugin.headsetPlugged();
                    Log.d(TAG, "Headset is plugged");
                    break;
                default:
                    Log.d(TAG, "I have no idea what the headset state is");
            }
        }
    }
}
