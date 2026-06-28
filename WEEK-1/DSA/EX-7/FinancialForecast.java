public class FinancialForecast {

    // Recursive method to calculate future value
    public static double futureValue(double currentValue, double growthRate, int years) {

        // Base case
        if (years == 0) {
            return currentValue;
        }

        // Recursive call
        return futureValue(currentValue * (1 + growthRate), growthRate, years - 1);
    }
}
