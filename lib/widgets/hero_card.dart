
import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal.shade300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('₹1639',
                style: TextStyle(
                  fontSize: 50, 
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.2
                  ),
                ),
                Text('Balance',
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.2
                  ),
                ),
              ],
            ),
          ),
       
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), 
                topRight: Radius.circular(30)),
              color: Colors.white,
      
            ),
            child: const Row(
              children: [
                CardOne(color: Colors.green,),
                SizedBox(
                  width: 10,
                ),
                CardOne(color: Colors.red,)
              ],
            ),
          )         
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({
    super.key, required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)
        ),        
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Credit',
                    style: TextStyle(
                      fontSize: 18
                    ), 
                  ),
                  Text('₹455',
                    style: TextStyle(
                      color: color,
                      fontSize:30,
                      fontWeight: FontWeight.bold
                    ),
                  ),                  
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_upward, 
                  color: color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}