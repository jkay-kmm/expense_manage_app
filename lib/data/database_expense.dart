
import 'package:cloud_firestore/cloud_firestore.dart';


//create
void addExpense(String userId, Map<String, dynamic> expenseData) async {
  try {
    await FirebaseFirestore.instance.collection('users').doc(userId).collection('expenses').add(expenseData);
    print("Expense added successfully!");
  } catch (e) {
    print("Failed to add expense: $e");
  }
}
//read
Future<void> getExpenses(String userId) async {
  try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .get();

    snapshot.docs.forEach((doc) {
      print(doc.data()); // Print each document's data
    });
  } catch (e) {
    print("Failed to get expenses: $e");
  }
}
//Update
void updateExpense(String userId, String expenseId, Map<String, dynamic> updateData) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .doc(expenseId)
        .update(updateData);

  } catch (e) {
    print("Failed to update expense: $e");
  }
}
//Delete

void deleteExpense(String userId, String expenseId) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .doc(expenseId)
        .delete();
    print("Expense deleted successfully!");
  } catch (e) {
    print("Failed to delete expense: $e");
  }
}
