class Clock(h: Int, m: Int) {
    //TODO: implement proper constructor
    var min = m.mod(60)
    var hour = (h + (m - m.mod(60)).div(60)).mod(24)

    //TODO: find a convenient way to take over `toString()` and `equals()`
    override fun toString(): String {
        return "%02d:%02d".format(hour, min)
    }

    override fun equals(other: Any?): Boolean {
        return other is Clock && this.min == other.min && this.hour == other.hour
    }

    override fun hashCode(): Int {
        return min + 60 * hour
    }

    fun subtract(minutes: Int) {
        val m = min - minutes
        val h = hour
        min = m.mod(60)
        hour = (h + (m - m.mod(60)).div(60)).mod(24)
    }

    fun add(minutes: Int) {
        
        val m = min + minutes
        val h = hour
        min = m.mod(60)
        hour = (h + (m - m.mod(60)).div(60)).mod(24)
    }
}
