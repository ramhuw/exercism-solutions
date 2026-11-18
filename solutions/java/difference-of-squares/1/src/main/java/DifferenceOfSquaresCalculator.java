class DifferenceOfSquaresCalculator {

    int computeSquareOfSumTo(int input) {
        return input * input * (input + 1) * (input + 1) / 4;
    }

    int computeSumOfSquaresTo(int input) {
        var ans = 0;
        for (int i = 1; i <= input; i++) {
            ans += i * i;
        }
        return ans;
    }

    int computeDifferenceOfSquares(int input) {
        return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
    }

}
