import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iamh/models/user.dart';
import 'package:provider/provider.dart';

//final GlobalKey<ScaffoldState> scaffoldDrawerformkey = GlobalKey();
// final scaffoldKey = GlobalKey<ScaffoldState>();
// _displayDrawer(BuildContext context) {
//   scaffoldKey.currentState.openEndDrawer();
// }
class UserProfileScreen extends StatefulWidget {
  static const routeName = 'userprofileScreen';
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var _userInfo = Provider.of<User>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.1,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Stack(
            children: [
              ClipPath(
                clipper: MyCustumClipper3(),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              ClipPath(
                clipper: MyCustumClipper2(),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              ClipPath(
                clipper: MyCustumClipper4(),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              ClipPath(
                clipper: MyCustumClipper5(),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              ClipPath(
                clipper: MyCustumClipper(),
                child: Container(
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 20,
                top: 70,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    //border:Border.all(width: 2,color:Colors.white),
                    color: Colors.grey[350],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          /////////////////////////////////////////فتح المعرض
                        }),
                  ),
                ),
              ),

              Positioned(
                left: 20,
                top: 170,
                right: 20,
               bottom: 20,
                child: Container(
                  //  color: Colors.black,
                  width: 300,
                  height: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      ///////********/
                      children: [
                        Flexible(
                          flex: 0,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                ///////********/
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "Emran Aldaqaq",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "Flutter Developer",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 20,
                                    indent: 40,
                                    endIndent: 40,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        ///item 1
                        Flexible(
                          flex: 0,
                          child: ListTile(
                            title: Text(
                             " _userInfo.users[0].email",
                              style: TextStyle(color: Colors.grey),
                            ),
                            // trailing: Text(
                            //   _userInfo.users[0].firstname,
                            //   style: TextStyle(fontSize: 20),
                            // ),
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                          indent:13,
                        ),
                        //item 2
                        Flexible(
                          flex: 0,
                          child: ListTile(
                            title: Text("_userInfo.users[0].lastname",
                                style: TextStyle(fontSize: 20)),
                            trailing: Icon(Icons.ac_unit),
                          ),
                        ),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        //item 3
                        Flexible(
                          flex: 0,
                          child: ListTile(
                            title: Text("_userInfo.users[0].email",
                                style: TextStyle(fontSize: 20)),
                            trailing: Icon(Icons.ac_unit),
                          ),
                        ),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        //item 4
                        Flexible(
                          flex: 0,
                          child: ListTile(
                            title: Text("data", style: TextStyle(fontSize: 20)),
                            trailing: Icon(Icons.ac_unit),
                          ),
                        ),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Flexible(
                          flex: 0,
                          child: ListTile(
                            title: Text("data", style: TextStyle(fontSize: 20)),
                            trailing: Icon(Icons.ac_unit),
                          ),
                        ),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Flexible(
                          flex: 0,
                          child: ListTile(
                            title: Text("data", style: TextStyle(fontSize: 20)),
                            trailing: Icon(Icons.ac_unit),
                          ),
                        ),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(20.0),
              //   child: ClipPath(
              //     clipper: InnerCustumClipper(),
              //     child: Container(color: Colors.black,),
              //   ),
              // ),
              //width: 100,
              // Padding(
              //   padding: EdgeInsets.all(20.0),
              //   child: ClipPath(
              //     clipper: InnerCustumClipper(),
              //     child: Container(
              //       // width: 100,

              //       child: SingleChildScrollView(
              //         child: Column(
              //           children: [
              //             Flexible(
              //                 flex: 0,
              //                 child: Card(
              //                   child: ListTile(
              //                     title: Text("data"),
              //                     trailing: Icon(Icons.ac_unit),
              //                   ),
              //                 ),),
              //                 Flexible(
              //                 flex: 0,
              //                 child: Card(
              //                   child: ListTile(
              //                     title: Text("data"),
              //                     trailing: Icon(Icons.ac_unit),
              //                   ),
              //                 ),),
              //                 Flexible(
              //                 flex: 0,
              //                 child: Card(
              //                   child: ListTile(
              //                     title: Text("data"),
              //                     trailing: Icon(Icons.ac_unit),
              //                   ),
              //                 ),),
              //                 Flexible(
              //                 flex: 0,
              //                 child: Card(
              //                   child: ListTile(
              //                     title: Text("data"),
              //                     trailing: Icon(Icons.ac_unit),
              //                   ),
              //                 ),),
              //                 Flexible(
              //                 flex: 0,
              //                 child: Card(
              //                   child: ListTile(
              //                     title: Text("data"),
              //                     trailing: Icon(Icons.ac_unit),
              //                   ),
              //                 ),),
              //                 Flexible(
              //                 flex: 0,
              //                 child: Card(
              //                   child: ListTile(
              //                     title: Text("data"),
              //                     trailing: Icon(Icons.ac_unit),
              //                   ),
              //                 ),),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 150);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyCustumClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 50);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyCustumClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 100);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyCustumClipper4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 60);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 150);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyCustumClipper5 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 30);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 150);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

// class InnerCustumClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.moveTo(0, 180);
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 180);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
