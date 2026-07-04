import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          content: Text("Please enter a reason and select a date!"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await FirebaseFirestore.instance.collection('leave_requests').add({
          'uid': user.uid,
          'email': user.email,
          'reason': _reasonController.text,
          'date': _selectedDate,
          'status': 'Pending',
          'createdAt': FieldValue.serverTimestamp(),
        });

        setState(() {
          _reasonController.clear();
          _selectedDate = null;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Leave Request Submitted! "),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply Leave"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.calendar_month),
              label: Text(
                _selectedDate == null
                    ? "Select Date"
                    : "Selected: ${_selectedDate!.toLocal()}".split(' ')[0],
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitLeaveRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text("Submit Request"),
            ),

            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 10),

            const Text(
              "My Leave Requests",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('leave_requests')
                    .where('uid', isEqualTo: user?.uid)
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No leave requests found."),
                    );
                  }

                  final requests = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: requests.length,
                    itemBuilder: (context, index) {
                      var data = requests[index].data() as Map<String, dynamic>;

                      DateTime? leaveDate;
                      if (data['date'] != null) {
                        leaveDate = (data['date'] as Timestamp).toDate();
                      }

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        elevation: 2,
                        child: ListTile(
                          leading: const Icon(
                            Icons.pending_actions,
                            // color: Colors.orange,
                          ),
                          title: Text(data['reason'] ?? "No Reason"),
                          subtitle: Text(
                            leaveDate != null
                                ? "Date: ${leaveDate.toLocal().toString().split(' ')[0]}" // "Date: " කෑල්ල split එකෙන් එලියට ගත්තා
                                : "Unknown Date",
                          ),
                          trailing: Chip(
                            label: Text(data['status'] ?? "Pending"),
                            backgroundColor: Colors.orange.shade100,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
