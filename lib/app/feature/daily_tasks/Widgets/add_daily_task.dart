// import 'package:flutter/material.dart';
//
// class AddDailyTask extends StatefulWidget {
//   const AddDailyTask({Key? key}) : super(key: key);
//
//   @override
//   _AddDailyTaskState createState() => _AddDailyTaskState();
// }
//
// class _AddDailyTaskState extends State<AddDailyTask> {
//   @override
//   Widget build(BuildContext context) {
//
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     TextEditingController categoryNameController = TextEditingController();
//     GlobalCategoryService globalCategoryService = GlobalCategoryService();
//
//     if (categoryToUpdate != null) {
//       categoryNameController.text = categoryToUpdate!.categoryName;
//     }
//
//     return AlertDialog(
//       title:
//       Text(categoryToUpdate != null ? "Update category" : "Add a category"),
//       content: Form(
//         key: formKey,
//         child: TextFormField(
//           controller: categoryNameController,
//           decoration: const InputDecoration(
//             hintText: 'Enter category name',
//           ),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter category name';
//             }
//             return null;
//           },
//         ),
//       ),
//       actions: [
//         ElevatedButton(
//           onPressed: () async {
//             if (formKey.currentState!.validate()) {
//               if (categoryToUpdate != null) {
//                 categoryToUpdate!.categoryName = categoryNameController.text;
//                 await globalCategoryService.updateCategory(categoryToUpdate!);
//                 Provider.of<TaskCategoryProvider>(context, listen: false)
//                     .updateCategory(categoryToUpdate!);
//               } else {
//                 TaskCategory cat = await globalCategoryService
//                     .addCategory(categoryNameController.value.text);
//                 Provider.of<TaskCategoryProvider>(context, listen: false)
//                     .add(cat);
//               }
//
//               Navigator.of(context).pop();
//             }
//           },
//           child: Text(categoryToUpdate != null ? 'Update' : 'Submit'),
//         ),
//       ],
//     );
//   }
//   }
// }
