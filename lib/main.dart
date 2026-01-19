import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:saundvibe/app.dart';

void main () async {
runZonedGuarded((){
   WidgetsFlutterBinding.ensureInitialized();
   runApp(
     App(),
   );
}, (error , stackTrace){

});

}