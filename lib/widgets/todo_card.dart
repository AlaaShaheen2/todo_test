import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final bool doneOrnot;
  final String vartitle;
  final Function changeStatus;
  final int index;
  final Function delete;
  const TodoCard({
    super.key,
    required this.vartitle,
    required this.doneOrnot,
    required this.changeStatus,
    required this.delete,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  fontSize: 28,
                  color: doneOrnot
                      ? Color.fromARGB(255, 56, 59, 56)
                      : Color.fromARGB(255, 252, 249, 249),
                  decoration: doneOrnot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    doneOrnot ? Icons.check : Icons.close,
                    size: 27,
                    color: doneOrnot ? Colors.green[400] : Colors.red,
                  ),
                  SizedBox(width: 14),
                  IconButton(
                      onPressed: () {
                        delete(index);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 236, 117, 108),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
