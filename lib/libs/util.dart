class Util{

     // 延迟函数
     Util.setTimeOut(int time, [Function result]){ // 1.延迟时间秒  2.返回函数
       Future.delayed(new Duration(seconds: time),result);
     }
}
