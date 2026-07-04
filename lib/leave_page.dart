import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  final TextEditingController _reasonController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _submitLeaveRequest() async {
    if (_reasonController.text.isEmpty || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("please enter a reason and select a date!"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance.collection("leave_requests").add({
          'uid': user.uid,
          'emial': user.email,
          'reason': _reasonController.text,
          'date': _selectedDate,
          'status': 'pending',
          'createdAt': FieldValue.serverTimestamp(),
        });

        setState(() {
          _reasonController.clear();
          _selectedDate = null;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Leave Request Submitted Successfully!"),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error"), backgroundColor: Colors.redAccent),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply Leave"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Request a Leave",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _reasonController,
              decoration: const InputDecoration(
                labelText: "Reason for leave",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit_document),
              ),
            ),
            const SizedBox(height: 20),

            OutlinedButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.calendar_month),
              label: Text(
                _selectedDate == null
                    ? "Select Date"
                    : "Selected: ${_selectedDate!.toLocal()}".split(' ')[0],
                style: const TextStyle(fontSize: 16),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _submitLeaveRequest,
              style: ElevatedButton.styleFrom(
                // padding: const EdgeInsets.symmetric(vertical: 15),
                // backgroundColor: Colors.orangeAccent,
                // foregroundColor: Colors.white,
              ),
              child: const Text(
                "Submit Request",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
