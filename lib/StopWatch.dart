
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StopWatch extends StatefulWidget {

  @override
  _stopWatchState createState() => _stopWatchState();

}

class _stopWatchState extends State<StopWatch>  with SingleTickerProviderStateMixin {

  Duration _elapsed = Duration.zero;
  // 2. declare Ticker
  late final Ticker _ticker;
  @override
  void initState() {
    super.initState();
    // 3. initialize Ticker
    _ticker = this.createTicker((elapsed) {
      // 4. update state
      setState(() {
        _elapsed = elapsed;
      });
    });
    // 5. start ticker
    _ticker.start();
  }

  @override
  void dispose() {
    // 6. don't forget to dispose it
    _ticker.dispose();
    super.dispose();
  }
stopTicker(){
setState((){
  _ticker.stop();
});
}
  @override
  Widget build(BuildContext context) {
    // 7. pass the elapsed time to a widget
    // that shows the formatted text as mm:ss:hh
    return Column(
      children: [
        Text(""+_elapsed.toString()),
      SizedBox(height: 30,),
      TextButton(
        onPressed: (){
          _ticker.stop(); }, child: Text(        "stop",
      ),
      ),
        TextButton(
          onPressed: (){
            _ticker.start();
          }, child: Text(        "Start",
        ),
        ),

      ],
    );
  }
}