import 'dart:async';
import 'package:get/get.dart';


class CountdownTimer extends GetxController {
    Timer? _timer;
    int  remainingSeconds=1;
    final time="00:30".obs;
  @override
  void onReady() {
    
      _starTimer(30);
    // TODO: implement onReady
    super.onReady();
  }

 _starTimer(int seconds){
  const duration=Duration(seconds:1);
  remainingSeconds=seconds;
  _timer=Timer.periodic(duration, (Timer timer) {

       if(remainingSeconds==0){
              timer.cancel();
            }
        
            else{
            int minutes=remainingSeconds~/60;

            int seconds=remainingSeconds%60;
            time.value=minutes.toString().padLeft(2,'0')+":"+seconds.toString().padLeft(2,"0");
             remainingSeconds--; 
            }
        


   });

}


@override
  void onClose() {
    
    if(_timer!=null){
      _timer!.cancel();
    }
    
    
      super.onClose();
  }

}
