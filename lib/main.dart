import 'package:breakapp/app_route.dart';
import 'package:breakapp/data/data.local/casheHelper.dart';
import 'package:breakapp/domain/cubit/checkConnection/connect_cubit.dart';
import 'package:breakapp/domain/cubit/checkConnection/connect_state.dart';
import 'package:breakapp/presentation/dialogues/noInterNet.dart';
import 'package:breakapp/presentation/modules/introductionScreen.dart';
import 'package:breakapp/presentation/modules/splashScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:sizer/sizer.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
await CasheHelper.init();
  runApp(
      DevicePreview(
        enabled: true,
          builder:(_)=> const MyApp(

          ))
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CheckConnectionCubit()..initialConnection())
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) =>
            BlocListener<CheckConnectionCubit,CheckConnectionState>(
            listener: (context,state){
             if (state is DisConnect){
               print('Internet Disconnected');
               
               OneContext().showDialog(
                   barrierDismissible: false,
                   builder: (context)=>NoInterNetDialogue());
             } else if(state is Connect){
               print('Connected');
               OneContext().popAllDialogs();
             }
      },
              child: MaterialApp(

          debugShowCheckedModeBanner: false,
          //     locale: DevicePreview.locale(context),
          //     builder: DevicePreview.appBuilder,
          // useInheritedMediaQuery: true,
          onGenerateRoute: AppRoute().onGenerateRoute,
          builder: OneContext().builder,

          home: SplashScreen(nextScreen: IntroductionScreen(),),

        ),
            ),
      ),
    );
  }
}

