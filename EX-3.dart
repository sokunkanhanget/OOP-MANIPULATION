class MyDuration {
  final int _milliseconds;

  MyDuration(this._milliseconds);
  MyDuration.fromHours(int hours) : _milliseconds = hours * 3600;
  MyDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60;

  bool operator >(MyDuration other) {
    if (this._milliseconds > other._milliseconds || this._milliseconds < other._milliseconds) {
      return true;
    } else{
      return false;
    }
  }
  
  int operator +(MyDuration other) {
    return this._milliseconds + other._milliseconds;
  }

  int operator -(MyDuration other) {
    if (this._milliseconds < other._milliseconds) {
      throw Exception('Can not subtract because the first duration is smaller than the second one');
    } else {
      return this._milliseconds - other._milliseconds;
    }
   
  }


@override
  String toString() {
     int seconds = (_milliseconds / 1000).round();
     int minutes = (seconds / 60).floor();
     seconds = seconds % 60;
     int hours = (minutes / 60).floor();
     minutes = minutes % 60;
     return '$hours hours, $minutes minutes, $seconds seconds';
   }
 }

 void main() {
   MyDuration duration1 = MyDuration.fromHours(3);  
   MyDuration duration2 = MyDuration.fromMinutes(45);  
   print(duration1 + duration2);
   print(duration1>duration2); 

   try {
     print(duration2 - duration1);  
   } catch (e) {
     print(e); 
   }
}
