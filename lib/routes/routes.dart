import 'package:chat_flutter/page/chat_page.dart';
import 'package:chat_flutter/page/loading_page.dart';
import 'package:chat_flutter/page/login_page.dart';
import 'package:chat_flutter/page/register_page.dart';
import 'package:chat_flutter/page/usuarios_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'loading': (_) => LoadingPage(),
  'register': (_) => RegisterPage(),
  'login': (_) => LoginPage(),
};
