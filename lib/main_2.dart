// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:news_app/Layout/Cubit/States.dart';
// import 'package:news_app/Layout/Cubit/edit_cubit.dart';
// import 'package:news_app/Layout/News_Layout/News_Layout.dart';
// import 'package:news_app/Moduls/jfhgh.dart';
// import 'package:news_app/Shared/Cubit/edit_cubit.dart';
// import 'package:news_app/Shared/Cubit/state.dart';
// import 'package:news_app/Shared/remote/dio_helper.dart';
//
// void main(){
//   DioHelper.init();
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (BuildContext context) => AppCubit(),
//         child: BlocConsumer<AppCubit, AppState>(
//           listener: (context, state){},
//           builder: (context, state){
//             return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               theme: ThemeData(
//                   textTheme: TextTheme(
//                       bodyText1: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18,
//                           color: Colors.black
//                       )
//                   ),
//                   appBarTheme: AppBarTheme(
//                       systemOverlayStyle: SystemUiOverlayStyle(
//                         statusBarColor: Colors.white,
//                         statusBarIconBrightness: Brightness.dark,
//                       ),
//                       color: Colors.white,
//                       elevation: 0.0,
//                       titleTextStyle: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold
//                       ),
//                       iconTheme: IconThemeData(
//                           color: Colors.black
//                       )
//                   ),
//
//                   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                     type: BottomNavigationBarType.fixed,
//                     elevation: 20,
//                     selectedItemColor: Colors.deepOrange,
//                     unselectedItemColor: Colors.grey,
//                     backgroundColor: Colors.white,
//                   )
//               ),
//               darkTheme: ThemeData(
//                 textTheme: TextTheme(
//                     bodyText1: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18,
//                         color: Colors.white
//                     )
//                 ),
//                 appBarTheme: AppBarTheme(
//                     backgroundColor: HexColor("333739"),
//                     backwardsCompatibility: false,
//                     systemOverlayStyle: SystemUiOverlayStyle(
//                       statusBarColor: HexColor("333739"),
//                       statusBarIconBrightness: Brightness.light,
//                     ),
//                     color: Colors.white,
//                     elevation: 0.0,
//                     titleTextStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold
//                     ),
//                     iconTheme: IconThemeData(
//                         color: Colors.white
//                     )
//                 ),
//                 bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                   type: BottomNavigationBarType.fixed,
//                   elevation: 20,
//                   selectedItemColor: Colors.deepOrange,
//                   unselectedItemColor: Colors.grey,
//                   backgroundColor: HexColor("333739"),
//                 ),
//               ),
//               themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
//               home: App(),
//             );
//           },
//         )
//     );
//   }
// }
//
