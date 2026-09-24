public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        var succ = 1.0;
        switch (speed) {
            case 5:
            case 6:
            case 7:
            case 8:
                succ = 0.9;
                break;
            case 9:
                succ = 0.8;
                break;
            case 10:
                succ = 0.77;
                break;
        }
        return 221.0 * ((double) speed) * succ;
    }

    public int workingItemsPerMinute(int speed) {
        return (int)( productionRatePerHour(speed) / 60);
    }
}
