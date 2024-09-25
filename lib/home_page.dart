import 'package:assigment3part2/widget/custom_button.dart';
import 'package:assigment3part2/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _contacts = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _addContact() {
    if (_formKey.currentState!.validate()) {
      if (_contacts.length < 3) {
        setState(() {
          _contacts.add({
            'name': _nameController.text,
            'phone': _phoneController.text,
          });
          _nameController.clear();
          _phoneController.clear();
        });
      }
    }
  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Contacts Screen',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                hint: 'Enter Your Name Here',
                text: 'Name must not be empty',
                icon: Icons.edit,
                controller: _nameController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: 'Enter Your Number Here',
                text: 'Number must not be empty',
                icon: Icons.call,
                controller: _phoneController,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CustomButton(
                    text: 'Add',
                    color: Colors.blue,
                    onPressed: _addContact,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_contacts[index]['name']!),
                        subtitle: Text(_contacts[index]['phone']!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteContact(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
