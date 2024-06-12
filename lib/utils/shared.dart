
import 'package:tale/core/models/user_model.dart';
import 'package:uuid/uuid.dart';


Uuid uuid = const Uuid();//// this used to Generate a unique ID


UserModel sharedUser = UserModel.empty() ;

String oldemail="";//store the user's old email