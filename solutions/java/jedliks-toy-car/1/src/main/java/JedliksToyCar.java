public class JedliksToyCar {
    int distance = 0;
    int battery = 100;
    public static JedliksToyCar buy() {
        return new JedliksToyCar();
    }

    public String distanceDisplay() {
        return String.format("Driven %d meters", this.distance);
    }

    public String batteryDisplay() {
        return battery > 0 ? String.format("Battery at %d", this.battery) + '%' : "Battery empty";
    }

    public void drive() {
        if (battery > 0) {
            distance += 20;
            battery -= 1;
        }
    }
}
