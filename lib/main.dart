import 'package:simple_wallet/helpers/firebase_instance.dart';
import 'package:simple_wallet/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:simple_wallet/routing/route_names.dart';
import 'package:simple_wallet/routing/routes.dart';
import 'package:provider/provider.dart';
import 'helpers/auth_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseApp().then((value) => {
        runApp(MultiProvider(providers: [
          ChangeNotifierProvider.value(value: AuthProvider.initialize())
        ], child: MyApp()))
      });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample Wallet App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: PageControllerRoute,
    );
  }
}

class AppPagesController extends StatelessWidget {
  const AppPagesController({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AuthStateBuilder();
  }
}
