class Badge {
    public String print(Integer id, String name, String department) {
        var first = id == null ? "" : String.format("[%d] - ", id);
        var third = department == null ? " - OWNER" : " - " + department.toUpperCase();
        return first + name + third;
    }
}
