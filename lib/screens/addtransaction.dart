import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Add Transaction',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 218, 214, 214),
                    hintText: 'Statement',
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 25), // Space between the boxes
                GestureDetector(
                  onTap: () {
                    _selectDate(context); // Function to pick date
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 218, 214, 214),
                        hintText: 'Date',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 218, 214, 214),
                    hintText: 'Account',
                    border: InputBorder.none,
                  ),
                  items: <String>['Account 1', 'Account 2', 'Account 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // Handle dropdown value change
                  },
                ),
                SizedBox(height: 25),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 218, 214, 214),
                    hintText: 'Expense',
                    border: InputBorder.none,
                  ),
                  items: <String>['Expense 1', 'Expense 2', 'Expense 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // Handle dropdown value change
                  },
                ),
                SizedBox(height: 25),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 218, 214, 214),
                    hintText: 'Amount in Nu.',
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 218, 214, 214),
                    hintText: 'Add Image for the bill',
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(14.0),
            color: Colors.deepOrange,
            child: Text(
              'Confirm',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      // Handle picked date
    }
  }
}
