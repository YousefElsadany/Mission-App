import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mission_app/shared/Cubit/cubit.dart';
import 'package:mission_app/shared/Cubit/states.dart';
import 'package:mission_app/shared/componants/componants.dart';
import 'package:mission_app/shared/componants/constants.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tasks = AppCubit.get(context).archiveTasks;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return /* (tasks.length == 0)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Results",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            : */
            ListView.separated(
                itemBuilder: (context, index) =>
                    customTaskItem(tasks[index], context),
                separatorBuilder: (context, index) => Container(
                      color: Colors.grey[300],
                      width: double.infinity,
                      height: 1,
                      padding: EdgeInsets.all(16.0),
                    ),
                itemCount: tasks.length);
      },
    );
  }
}
