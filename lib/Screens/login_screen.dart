import 'package:flutter/material.dart';
import 'package:flutter_app_loja/Models/user_model.dart';
import 'package:flutter_app_loja/Screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text("CRIAR CONTA",
                style: TextStyle(fontSize: 15.0),
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=>SignUpScreen())
                );
              },
            )
          ],
        ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (text){
                    if(text.isEmpty || !text.contains("@")) return "E-mail inválido!";
                  },
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  decoration: InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  // ignore: missing_return
                  validator: (text){
                    if(text.isEmpty || text.length < 6) return "Senha inválida!";
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: (){},
                    child: Text("Esqueci minha senha",
                      textAlign: TextAlign.right,),
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: 16.0,),
                RaisedButton(
                  child: Text("Entrar",
                    style: TextStyle(fontSize: 18.0),),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    if(_formKey.currentState.validate()){

                    }
                    model.singIn();

                  },
                ),

              ],

            ),
          );
        },
      ),

    );
  }
}

