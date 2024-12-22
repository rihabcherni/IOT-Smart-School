import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Image icon;
  final String label;
  final String valeur;

  InfoCard({required this.icon, required this.label, required this.valeur});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white, // Color personnalisé
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center, // Aligne le texte à gauche
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold), // Style du texte
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.02, // Ajustement de l'espace vertical
                  ),
                  Text(
                    valeur,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 7, 0, 135)),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
