import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mission_app/module/calculator_page/calculator_view.dart';
import 'package:mission_app/shared/app_cubit/cubit.dart';
import 'package:mission_app/shared/app_cubit/states.dart';
import 'package:mission_app/shared/componants/componants.dart';

// 1. create database
// 2. create tables
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database

class HomeLayout extends StatelessWidget {
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsartDatabase) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(CalculatorScreen());
                    },
                    icon: Icon(Icons.calculate_outlined)),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff40D876),
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insartToDatabase(titleController.text,
                        dateController.text, timeController.text);
                    // insartToDatabase(titleController.text, dateController.text,
                    //         timeController.text)
                    //     .then((value) {
                    //   getDataFromDatabase(database).then((value) {
                    //     // setState(() {
                    //     //
                    //     //   isBottomSheetShown = false;
                    //     //   flabIcon = Icons.edit;
                    //     //   tasks = value;
                    //     // });
                    //     //print(tasks[0]);
                    //   }).catchError((error) {
                    //     print('ERROR GET DATA ******* ${error.toString()}');
                    //   });
                    // });
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                customTextFeild(
                                  controller: titleController,
                                  inputType: TextInputType.text,
                                  title: 'Text Title',
                                  tap: () {},
                                  pIcon: Icons.title,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Title must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                customTextFeild(
                                  controller: timeController,
                                  inputType: TextInputType.datetime,
                                  title: 'Text Time',
                                  pIcon: Icons.watch_later_outlined,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Time must not be empty';
                                    }
                                    return null;
                                  },
                                  tap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      timeController.text =
                                          value!.format(context).toString();
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                customTextFeild(
                                  controller: dateController,
                                  inputType: TextInputType.datetime,
                                  title: 'Text Date',
                                  pIcon: Icons.calendar_today,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'Date must not be empty';
                                    }
                                    return null;
                                  },
                                  tap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.parse('2022-08-19'))
                                        .then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        elevation: 25.0,
                      )
                      .closed
                      .then((value) {
                    //Navigator.pop(context);
                    cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
                    titleController.clear();
                    dateController.clear();
                    timeController.clear();
                  });
                  cubit.changeBottomSheet(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.flabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.ChangeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archive'),
              ],
            ),
            body: Center(
              child: ConditionalBuilder(
                condition: state is! AppGetLoadingDatabase,
                builder: (context) => cubit.screens[cubit.currentIndex],
                fallback: (context) => CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
