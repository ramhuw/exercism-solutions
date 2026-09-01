data class Item(val weight: Int, val value: Int)

fun knapsack(maximumWeight: Int, items: List<Item>): Int {
    var d: IntArray = IntArray(maximumWeight + 1) {
        if (it == 0) {
            0
        } else {
            -1
        }
    };
    for (item in items) {
        for (weight in 0..(maximumWeight - item.weight)) {
            if (d[maximumWeight - item.weight - weight] != -1) {
                d[maximumWeight - weight] =
                    if (d[maximumWeight - weight] >= d[maximumWeight - item.weight - weight] + item.value) {
                        d[maximumWeight - weight]
                    } else {
                        d[maximumWeight - item.weight - weight] + item.value
                    }
            }
        }
    }
    var ans = -1;
    for (i in d) {
        if (i > ans) {
            ans = i
        }
    }
    return ans
}
