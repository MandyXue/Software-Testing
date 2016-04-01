/**
 * Created by mandyxue on 16/4/1.
 */
public class Date {
    // 赋初始值,代表错误
    int year = -1;
    int month = -1;
    int day = -1;

    static int[] dayOfMonth = {31,28,31,30,31,30,31,31,30,31,30,31};

    public Date() {}

    public Date(int year, int month, int day) {
        //年的范围规定为1800-3000, 超出则不构造实例
        if (year < 1800 || year > 3000) {
            return;
        }
        //闰年的情况,修改dayOfMonth,其他情况则不变
        if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
            if (month == 2) {
                dayOfMonth[month-1] = 29;
            }
        }

        //检查month是否符合要求
        if (month < 1 || month > 12) {
            return;
        } else {
            //检查day是否符合要求
            if (day < 1 || day > dayOfMonth[month-1]) {
                return;
            } else {
                this.year = year;
                this.month = month;
                this.day = day;
            }
        }
    }

    public Date getNextDate(){
        //输入合法
        if (year != -1 && month != -1 && day != -1) {
            Date nextDate = new Date();
            //如果是月末
            if (day == dayOfMonth[month-1]) {
                //如果是年末
                if (month == 12) {
                    nextDate.year = this.year + 1;
                    nextDate.month = 1;
                    nextDate.day = 1;
                } else {
                    //只是月末而不是年末
                    nextDate.year = this.year;
                    nextDate.month = this.month + 1;
                    nextDate.day = 1;
                }
            } else {
                //不是月末,则日期加一即可
                nextDate.year = this.year;
                nextDate.month = this.month;
                nextDate.day = this.day + 1;
            }
            return nextDate;
        }
        //输入不合法
        return new Date();
    }

    @Override
    public boolean equals(Object obj)
    {
        if (!(obj instanceof Date)) {
            return false;
        }
        Date date = (Date)obj;
        return date.year == year && date.month == month && date.day == day;
    }
}
