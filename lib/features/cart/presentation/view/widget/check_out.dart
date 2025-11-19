import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 240,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network("http://sonic-zdi0.onrender.com/storage/products/cheeseburger.jpg",
                            fit: BoxFit.fill,width: 150,height: 150,),
                          const SizedBox(height: 12.0,),
                          const SizedBox(
                            width: 150,
                            child: Text("Cheeseburger Wendys Burger",maxLines: 2,overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600
                              ),),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xff08431D),
                                  border: Border.all(
                                    color: const Color(0xff08431D),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: const Center(
                                    child: Icon(Icons.remove, color: Colors.white,size: 34,),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0,),
                              const Text("1",
                                style: TextStyle(
                                    color: Color(0xff08431D),
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 12.0,),
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xff08431D),
                                  border: Border.all(
                                    color: const Color(0xff08431D),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: InkWell(
                                  onTap: () {},
                                  child: const Center(
                                    child: Icon(Icons.add, color: Colors.white,size: 34,),
                                  ),
                                ),
                              )
                              ,
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 180,
                            decoration: BoxDecoration(
                                color: const Color(0xff08431D),
                                borderRadius: BorderRadius.circular(12.0)
                            ),
                            child: TextButton(onPressed: (){},
                              child: const Text("Remove",style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600,color: Colors.white
                              ),),),),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text("Total price", style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),),
                    Text("EGP {${ "0.0"}}", style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600,color: Color(0xff004182)),),
                  ],
                ),
                Container(
                  height: height*0.06,
                  width: width*0.5,
                  decoration: BoxDecoration(
                      color: const Color(0xff08431D),
                      borderRadius: BorderRadius.circular(22)
                  ),
                  child: Center(child: TextButton(onPressed: (){}, child: const Text("Check Out", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white
                  ),))
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
