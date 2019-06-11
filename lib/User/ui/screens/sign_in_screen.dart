import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreen createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {

  UserBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: bloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot = data = FirebaseUser
        if (!snapshot.hasData || snapshot.hasError) {
          return _signInGoogleUi();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget _signInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome \n this is your Travel App',
                style: TextStyle(
                  fontSize: 37,
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(
                text: "Login with Gmail",
                onTap: (){
                  bloc.signIn().then((user) {
                    print("Su nombre es ${user.displayName}");
                  }).catchError((error) {
                    print("Existe un error ${error.toString()}");
                  });
                },
                width: 300,
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }

}