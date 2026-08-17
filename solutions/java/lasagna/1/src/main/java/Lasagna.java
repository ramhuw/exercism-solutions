public class Lasagna {
    // TODO: define the 'expectedMinutesInOven()' method
    public int expectedMinutesInOven() {
        return 40;
    }

    // TODO: define the 'remainingMinutesInOven()' method
    public int remainingMinutesInOven(int m) {
        return this.expectedMinutesInOven() - m;
    }

    // TODO: define the 'preparationTimeInMinutes()' method
    public int preparationTimeInMinutes(int layer) {
        return layer * 2;
    }


    // TODO: define the 'totalTimeInMinutes()' method
    public int totalTimeInMinutes(int layer, int m) {
        return m + this.preparationTimeInMinutes(layer);
    }
}
