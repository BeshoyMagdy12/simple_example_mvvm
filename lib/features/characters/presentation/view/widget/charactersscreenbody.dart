import 'package:breaking_bad_mvvm/features/characters/presentation/model/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharactersScreenBody extends StatelessWidget {
  const CharactersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
   if(state is CharactersSuccess){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w),
      child: ListView.builder(
        physics:const BouncingScrollPhysics(),
        itemBuilder: (ctx,idx){
          return Card(
            
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.h),
              child: ListTile(
                    
                onTap: () {
                  
                },
                leading: CircleAvatar(backgroundImage: NetworkImage(state.characters[idx].image.toString(),),),
                title: Text(state.characters[idx].name.toString(),),
                subtitle: Text(state.characters[idx].species.toString(),),
                trailing: Icon(Icons.arrow_circle_right_sharp),
              ),
            ),
          );
    
      },itemCount: state.characters.length,),
    );
   }else if(state is CharactersFailure){
    return Center(child: Text(state.errMassge)); 
   }else{
    return const Center(child: CircularProgressIndicator());
   }
      },
    );
  }
}
