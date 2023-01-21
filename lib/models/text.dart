
import 'dart:ui';

import 'package:flutter/material.dart';

var richText = RichText(
                text: TextSpan(
                  style: style,
                children: [
                  TextSpan(
                    text: "T",
                  style: TextStyle(
                    color: Colors.red,
              
              ),
              ),
              TextSpan(text: "ota",
                  style: TextStyle(
                     color: Colors.amber,
              
              ),
              ),
              TextSpan(text: "l",
                  style: TextStyle(
                    color: Colors.red,
              ),
              ),
              TextSpan(text: " Ex",
                  style: TextStyle(
                     
                    color: Colors.red,
              
              ),
              ),
              TextSpan(text: "pen",
                  style: TextStyle(
                    color: Colors.amber,
              ),
              ),
              TextSpan(text: "se",
                  style: TextStyle(
                    color: Colors.red,
              ),
              ),
                ],
                
              )
              );
var style = TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 20,
                    shadows: [const Shadow(
                 offset: Offset(4,2),
                      color: Colors.black38,
                      blurRadius: 5
                    )],
                    fontWeight: FontWeight.lerp(FontWeight.w900, FontWeight.w300, 0.4)
                  );
var noTranscationText = RichText(
  textAlign: TextAlign.center,
                text: TextSpan(
                  style: style,
                  children: [
                    TextSpan(
                      text: 'N',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      ),
                       TextSpan(
                      text: 'o',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                      ),
                       TextSpan(
                      text: ' Tra',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      ),
                       TextSpan(
                      text: 'nsact',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                      ),
                       TextSpan(
                      text: 'ion\n\n',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      ),
                       TextSpan(
                      text: 'A',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      ),
                       TextSpan(
                      text: 'dde',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                      ),
                       TextSpan(
                      text: 'd',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      ),
                       TextSpan(
                      text: ' y',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      ),
                       TextSpan(
                      text: 'e',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                      ),
                       TextSpan(
                      text: 't',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                      )

                  ]
              )
              );

var simpleTextShadow = [const Shadow(
                 offset: Offset(4,2),
                      color: Colors.black38,
                      blurRadius: 5
                    )];

// var switchdecoration = BoxDecoration(
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color:  ? Colors.black38.withOpacity(0.2): Colors.red.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 20,
//                     offset: Offset(0, 1),
//                   )
//                 ]
//             );
var rotatedContainer1 =  Container( // gray box
  child: new Center(
    child:  new Transform(
      child:  new Text(
        "z",
        style: TextStyle(
          fontSize: 100,
          fontFamily: 'PressStart2P',
          color: Colors.red,
          shadows: simpleTextShadow
        ),
      ),
      alignment: FractionalOffset.center,
      transform: new Matrix4.identity()
        ..rotateZ(15 * 3.1415927 / 180),
    ), 
  ),
);
var rotatedContainer2 = Container( // gray box
  child: new Center(
    child:  new Transform(
      child:  new Text(
        "z",
        style: TextStyle(
          fontSize: 60,
          fontFamily: 'PressStart2P',
          color: Colors.amber,
          shadows: simpleTextShadow
        ),
      ),
      alignment: FractionalOffset.center,
      transform: new Matrix4.identity()
        ..rotateZ(15 * 3.1415927 / -180),
    ), 
  ),
);

var rotatedContainer3 = Container( // gray box
  child: new Center(
    child:  new Transform(
      child:  new Text(
        "z",
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'PressStart2P',
          color: Colors.red,
          shadows: simpleTextShadow
        ),
      ),
      alignment: FractionalOffset.center,
      transform: new Matrix4.identity()
        ..rotateZ(15 * 3.1415927 / 180),
    ), 
  ),
);
var rotatedContainer4 = Container( // gray box
  child: new Center(
    child:  new Transform(
      child:  new Text(
        "z",
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'PressStart2P',
          color: Colors.amber,
          shadows: simpleTextShadow
        ),
      ),
      alignment: FractionalOffset.center,
      transform: new Matrix4.identity()
        ..rotateZ(15 * 3.1415927 / -250),
    ), 
  ),
);

var showChart = RichText(
                text: TextSpan(
                  style: TextStyle(
                    shadows: simpleTextShadow,
                    fontFamily: 'PressStart2P'
                  ),
                children: [
                  TextSpan(
                    text: "S",
                  style: TextStyle(
                    color: Colors.red,
              
              ),
              ),
              TextSpan(text: "ho",
                  style: TextStyle(
                     color: Colors.amber,
              
              ),
              ),
              TextSpan(text: "w",
                  style: TextStyle(
                    color: Colors.red,
              ),
              ),
              TextSpan(text: " C",
                  style: TextStyle(
                     
                    color: Colors.red,
              
              ),
              ),
              TextSpan(text: "har",
                  style: TextStyle(
                    color: Colors.amber,
              ),
              ),
              TextSpan(text: "t",
                  style: TextStyle(
                    color: Colors.red,
              ),
              ),
                ],
                
              )
              );

var appBarTextStyle = TextStyle(
  color: Colors.amber,
                    fontFamily: 'PressStart2P',
                    fontSize: 20,
                    shadows: [const Shadow(
                 offset: Offset(4,2),
                      color: Colors.black38,
                      blurRadius: 5
                    )],
                    fontWeight: FontWeight.lerp(FontWeight.w900, FontWeight.w300, 0.4)
                  );
var shadowforContainer = [BoxShadow(
  blurRadius: 20,
  color: Colors.black38,
  offset: Offset(3, 2),
  spreadRadius: 1

  )];
