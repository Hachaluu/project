String breakfastTime;
String lunchTime;
String dinnerTime;

void everything (Student student) {
  //int row = table.findRowIndex (code, 0); 

  println ("Got code: " + student.code);
  //updateTime ();
  updateDateStamp ();

  table = loadTable(tablePath, "header");

  boolean foundColumn = false;
  String whatTime = null;

  if (isBreakFastTime()) whatTime = getMealStamp ();
  else if (isLunchTime()) whatTime = getMealStamp ();
  else if (isDinnerTime()) whatTime = getMealStamp ();



  if (whatTime != null) {
    try {
      println (whatTime);
      table.getColumnIndex (whatTime);

      foundColumn = true;
    } 
    catch (Exception e) {
      println (table.getColumnCount());
      println("bf", breakfastTime);
      println("ln", lunchTime);
      println("dn", dinnerTime);

      table.addColumn(breakfastTime);

      table.addColumn(lunchTime );

      table.addColumn(dinnerTime);
      saveTable (table, tablePath);
      println (table.getColumnCount());
    }
  }


  if (student.isCafe()== false) {
    println ("Non cafe"); 
    return;
  }
  if (student.isCafe()) {
    if (student.isInternship() ) {
      println ( "Cafe User (N)");
    } else if (student.isSpecialIntern()) {
      println ("Cafe User (S)");
    } else if (!student.isInternship()) {
      println ("Cafe user");
    }
    food(student);
  }
}
void food (Student student) {

  int row = table.findRowIndex(student.code, 0);
  print("row", row);  
  if (isBreakFastTime()) {  
    boolean hadBREAKFAST = student.hadBreakfast(); 
    if (hadBREAKFAST == false) {
      println ("Can eat break fast");
      table.setString (row, getMealStamp (), "1");
      saveTable (table, tablePath);
      return;
    } else if (hadBREAKFAST == true) {
      println ("You have eaten breakfast");
    }
  } else if (isLunchTime()) {
    boolean LUNCH = student.hadLunch(); 
    if ( LUNCH == false) {
      println ("Can eat LUNCH"); 
      table.setString (row, getMealStamp (), "1");
      saveTable (table, tablePath);
      return;
    } else if (LUNCH == true)
      println ("You have eaten lunch");
  } else if (isDinnerTime()) {
    boolean DINNER = student.hadDinner(); 
    if ( DINNER == false) {
      println ("Can eat DINNER"); 
      table.setString (row, getMealStamp (), "1");
      saveTable (table, tablePath);
      return;
    } else if (DINNER == true)
      println ("You have eaten Dinner");
  }else println ("The time has passed");
}


String getDateStamp () {
  String monthsOfTheYear [] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

  return day () + "-" + monthsOfTheYear [month () - 1] + "-" + year ();
}
String getMealStamp () {
  String mealStamp = "";
  if (isBreakFastTime()) {
    mealStamp = "-BF";
  } else 
  if (isLunchTime()) {
    mealStamp = "-LN";
  } else if (isDinnerTime()) {
    mealStamp = "-DN";
  }
  return getDateStamp () + mealStamp;
}
void updateDateStamp () {
  breakfastTime = getDateStamp()+"-"+"BF";
  lunchTime = getDateStamp()+"-"+"LN";
  dinnerTime = getDateStamp()+"-"+"DN";
}
