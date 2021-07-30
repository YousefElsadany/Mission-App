import 'package:flutter/material.dart';
import 'package:mission_app/shared/Cubit/cubit.dart';

Widget customButtom({
  //Color buttomCollor = Color(0xff40D876),
  double buttomWidth = double.infinity,
  required String text,
  required press,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Color(0xff40D876),
      ),
      width: buttomWidth,
      child: MaterialButton(
        onPressed: press,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget customTextFeild({
  required TextEditingController controller,
  required TextInputType inputType,
  required String title,
  required IconData pIcon,
  bool isPassword = false,
  IconData? sIcon,
  String? Function(String?)? validate,
  Function()? tap,
  //Function? tap,
  suffixPress,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      validator: validate,
      onTap: tap,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
        labelText: title,
        prefixIcon: Icon(pIcon),
        suffixIcon: IconButton(icon: Icon(sIcon), onPressed: suffixPress),
      ),
    );

Widget customTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Color(0xff40D876),
              child: Text('${model['time']}',style: TextStyle(color: Colors.white,)),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateDatabase(status: 'done', id: model['id']);
              },
              icon: Icon(
                Icons.check_box,
              ),
              color: Color(0xff40D876),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateDatabase(status: 'archive', id: model['id']);
              },
              icon: Icon(
                Icons.archive,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDatabase(
          id: model['id'],
        );
      },
    );
