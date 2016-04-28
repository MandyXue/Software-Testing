#include "stdio.h"

int year,month,day;
int leapYear[12] = {31,29,31,30,31,30,31,31,30,31,30,31};

int  CheckYear(int year)
{
    if (year % 4 == 0 && year % 100 != 0 )
    	return 1;
    else if (year % 400 == 0 )
    	      return 1;
   return 0;
}

int CheckLegal()
{
	if (month>12 || day>leapYear[month-1])
        return 0;
	else
		return 1;
}

int Check()
{
	 if (CheckYear(year))
    	return CheckLegal();
    else
    {
    	leapYear[1] -= 1;
    	return CheckLegal();
    }
}

void Calculate()
{
	 if (day+1>leapYear[month-1])
  	{
       if (month+1>12)
    	{
    		year = year+1;
   			month = 1;
   			day = 1;
   		}
 	   else
    	{
   			month = month+1;
   			day = 1;
   		}
   	}
    else
    	day = day+1;
   printf("下一天:%d年%d月%d日\n",year,month,day);
}

void Predict()
{
   if (CheckYear(year))
    	Calculate();
    else
    {
    	leapYear[1] -= 1;
    	Calculate();
    }
}

int main(int argc, char const *argv[])
{
	printf("请输入年份\n");
	scanf("%d",&year);
	printf("输入月份\n");
	scanf("%d",&month);
	printf("输入日期\n");
	scanf("%d",&day);

  if(Check())
    Predict();
  else
  	printf("Date illegal!\n");
	return 0;
}