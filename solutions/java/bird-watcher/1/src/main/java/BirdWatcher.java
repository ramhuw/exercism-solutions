
class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay  = birdsPerDay;
    }

    public static int[] getLastWeek() {
        return new int[] {0, 2, 5, 3, 7, 8, 4};
    }

    public int getToday() {
        return this.birdsPerDay[this.birdsPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        this.birdsPerDay[this.birdsPerDay.length - 1] += 1;
    }

    public boolean hasDayWithoutBirds() {
        for (var d: this.birdsPerDay) {
            if (d == 0) {
                return true;
            }
        }
        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        var ans = 0;
        for (var i = 0; i < numberOfDays && i < this.birdsPerDay.length; i++) {
            ans += this.birdsPerDay[i];
        }
        return ans;
    }

    public int getBusyDays() {
        var ans = 0;
        for (var d: this.birdsPerDay) {
            if (d >= 5) {
                ans += 1;
            }
        }
        return ans;
    }
}
