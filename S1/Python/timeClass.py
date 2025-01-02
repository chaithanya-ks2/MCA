class Time:
    def __init__(self, hour=0, minute=0, second=0):
        self.__hr = hour
        self.__min = minute
        self.__sec = second

    def __add__(self, other):
        secs = (self.__sec + other.__sec)%60
        sec_balance = (self.__sec + other.__sec)//60
        
        mins = (sec_balance+ (self.__min + other.__min))%60
        min_balance = (self.__min + other.__min)//60

        hours = (min_balance + (self.__hr + other.__hr))
        time2 = Time(hours, mins, secs)
        
        return time2
    
    def get_time(self):
        timeFormat = lambda x: str(x) if x>9 else "0"+str(x) if x>0 else "00"
        print(f"{timeFormat(self.__hr)}:{timeFormat(self.__min)}:{timeFormat(self.__sec)}")


t1 = Time(23, 10, 30)
t2 = Time(13, 45, 30)
t3 = t1+t2
t3.get_time()