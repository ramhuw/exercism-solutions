import jdk.javadoc.internal.html.ListBuilder

object Flattener {
    fun flatten(source: Collection<Any?>): List<Any> {
        val ans: MutableList<Any> = mutableListOf()
        for (c in source) {
            if (c is Collection<Any?>) {
                for (s in flatten(c)) {
                    ans.add(s)
                }
            } else if (c != null) {
                ans.add(c)
            }
        }
        return ans
    }
}
