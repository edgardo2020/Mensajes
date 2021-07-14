import 'package:chat_flutter/widgets/botonAzul.dart';
import 'package:chat_flutter/widgets/custom_text.dart';
import 'package:chat_flutter/widgets/custom_textField.dart';
import 'package:chat_flutter/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * .9,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Logo(
                      titulo: 'Messenger',
                    ),
                    _Form(),
                    CustomText(
                      texto: "¿No tienes cuenta?",
                      colorFont: Colors.black54,
                      sizeFont: 15,
                      fontWeigt: FontWeight.w300,
                    ),
                    CustomText(
                      texto: "Crear una ahora",
                      colorFont: Colors.blue[600],
                      sizeFont: 18,
                      fontWeigt: FontWeight.bold,
                      click: true,
                      route: 'register',
                    ),
                    //_Labels(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: CustomText(
                        texto: "Términos y condiciones de uso",
                        fontWeigt: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            keyboardType: TextInputType.visiblePassword,
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
            text: "Ingrese",
            onPressed: () {
              print(passCtrl.text);
              print(emailCtrl.text);
            },
          )
          // CustomInput(),
        ],
      ),
    );
  }
}
