import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'categoryselection.dart';
import 'amplifyconfiguration.dart'; // Import your configuration file
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:groceryapp/models/ModelProvider.dart';
import 'shopowners.dart';
import 'pickfrompage.dart';
import 'cartprovider.dart';
import 'Signinpage.dart';
import 'Useridprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserIdProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugins([
      AmplifyAuthCognito(),
      AmplifyAPI(modelProvider: ModelProvider.instance),
      AmplifyStorageS3(),
    ]);

    await Amplify.configure(amplifyconfig);
    print('Successfully configured Amplify');
  } catch (e) {
    print('Error configuring Amplify: $e');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define a MaterialColor for black
    const Map<int, Color> blackSwatch = {
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    };
    final MaterialColor customBlack = MaterialColor(0xFF000000, blackSwatch);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
      theme: ThemeData(
        primarySwatch: customBlack,
        // Define other theme properties if needed
      ),
    );
  }
}




