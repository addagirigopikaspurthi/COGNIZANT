public class InvestmentCalculatorTest {

    public static void main(String[] args) {

        double amount = 15000;
        double rate = 0.08;
        int years = 4;

        double finalAmount = InvestmentCalculator.calculateAmount(amount, rate, years);

        System.out.println("Initial Amount : ₹" + amount);
        System.out.println("Interest Rate  : " + (rate * 100) + "%");
        System.out.println("Duration       : " + years + " years");
        System.out.printf("Final Amount   : ₹%.2f%n", finalAmount);
    }
}
