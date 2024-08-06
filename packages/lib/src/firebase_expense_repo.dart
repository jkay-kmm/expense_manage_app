// import 'dart:math';
//
// import 'expense_repo.dart';
// import 'models/expense.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// class FirebaseExpenseRepo implements ExpenseRepository{
//   final categoryCollection = FirebaseFirestore.instance.collection('category');
//   final expenseCollection = FirebaseFirestore.instance.collection('expense');
//   @override
//   Future<void> createCategory(Category category) async {
//      try{
//        await categoryCollection
//            .doc(category.categoryId)
//            .set(category.toEntity().toDocument());
//      }catch (e){
//        log(e.toString());
//        rethrow;
//      }
//   }
//   @override
//   Future<void> getCategory(Category category) async {
//     try{
//       return await categoryCollection
//           .get()
//           .then(value) => value.docs.map((e) =>
//       Category.fromEntity(Category.fromDocument(e.data()))
//       ).toList());
//     }catch (e){
//       log(e.toString());
//       rethrow;
//     }
//   }
//
// }