public class Main {

    public static void main(String[] args) {
        Date date = new Date(2000,2,29);
        Date nextDate = date.getNextDate();
        System.out.println(nextDate.year + "/" + nextDate.month+ "/" + nextDate.day);
    }
}
