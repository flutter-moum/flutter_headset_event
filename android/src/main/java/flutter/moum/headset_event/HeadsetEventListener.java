package flutter.moum.headset_event;

public interface HeadsetEventListener {
    void onHeadsetConnect();
    void onHeadsetDisconnect();
    void onNextButtonPress();
    void onPrevButtonPress();
}
