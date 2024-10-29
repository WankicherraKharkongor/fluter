class AppValidator {
  
    String? validateEmail(value){
      if(value!.isEmpty){
        return "Please enter the email";
      }
      RegExp emailRegExp=RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
        if(!emailRegExp.hasMatch(value)){
          return 'Please enter a valid email';
        }
        return null;
    }

    String? validatePhoneNumber(value){
      if(value!.isEmpty){
        return 'Please enter a Phone number';      
      }
      if(value.length!=10){
        return "Please enter a valid Phone number";
      }
      return null;

    }
    String? validateUsername(value){
      if(value!.isEmpty){
        return "Please enter your name";
      }
      return null;
    }

    String? validatePassword(value){
      if(value!.isEmpty){
        return 'Please enter a password';
      }
      return null;

    }
}