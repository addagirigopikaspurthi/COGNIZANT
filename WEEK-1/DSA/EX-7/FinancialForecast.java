public class InvestmentCalculator {

    public static double calculateAmount(double amount, double rate, int years) {

        if (years == 0) {
            return amount;
        }

        return calculateAmount(amount * (1 + rate), rate, years - 1);
    }
}
