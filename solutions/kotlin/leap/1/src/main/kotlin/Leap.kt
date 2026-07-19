data class Year(val year: Int) {

    // TODO: Implement proper constructor

    val isLeap: Boolean = (year % 100 != 0 && year % 4 == 0) || year % 400 == 0
}
