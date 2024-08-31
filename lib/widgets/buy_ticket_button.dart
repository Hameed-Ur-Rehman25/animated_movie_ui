import 'package:flutter/material.dart';

class BuyTicketButton extends StatelessWidget {
  const BuyTicketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 0,
      color: const Color.fromARGB(255, 118, 118, 118),
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Text(
        'Buy Ticket',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
