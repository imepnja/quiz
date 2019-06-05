import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quiz/main.dart';

class RightAnswerOverlay extends StatefulWidget {

  final bool _isCorrect;
  final VoidCallback _onTap;

  RightAnswerOverlay(this._isCorrect, this._onTap);

  @override
  State createState() => new RightAnswerOverlayState();
}

class RightAnswerOverlayState extends State<RightAnswerOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ICON
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * 3.141,
                child: new Icon(widget._isCorrect ? Icons.done : Icons.clear, size: _iconAnimation.value *  80,),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),

            // Correct or Wrong
            new Text(widget._isCorrect ? "Correct" : "Wrong", style: new TextStyle(color: Colors.white, fontSize: 30),),
            
            // Tap to continue
            /*new Align(
                alignment: FractionalOffset.bottomCenter,
                child: Text("Tap to continue"),
            )
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                
                child: Text("Tap to continue"),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}