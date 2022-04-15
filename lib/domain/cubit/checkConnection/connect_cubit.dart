import 'package:breakapp/domain/cubit/checkConnection/connect_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckConnectionCubit extends Cubit<CheckConnectionState>
{
  CheckConnectionCubit() : super(LoadingConnection());
  final connectivity = Connectivity();
  bool ?hasConnected;
  initialConnection()async{
    connectivity.onConnectivityChanged.listen((event) { });
  }
 Future<bool?> checkConnection(ConnectivityResult result)async{
    if (result==ConnectivityResult.none){
      hasConnected=false;
      emit(DisConnect());
    }else{
      hasConnected=true;
      emit(Connect());
    }
    return null;
  }
}