pub fn LinkedList(comptime T: type) type {
    return struct {
        // Please implement the doubly linked `Node` (replacing each `void`).
        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T,
        };

        // Please implement the fields of the linked list (replacing each `void`).
        first: ?*Node = null,
        last: ?*Node = null,
        len: usize = 0,

        // Please implement the below methods.
        // You need to add the parameters to each method.

        pub fn push(self: *LinkedList(T), node: *Node) void {
            node.prev = self.last;
            node.next = null;
            if (self.len == 0) {
                self.first = node;
                self.last = node;
            } else {
                node.prev.?.next = node;
                self.last = node;
            }
            self.len += 1;
        }

        pub fn pop(
            self: *LinkedList(T),
        ) ?*Node {
            if (self.last != null) {
                var node = self.last.?;
                if (self.len == 1) {
                    self.last = null;
                    self.first = null;
                } else {
                    self.last = node.prev;
                    self.last.?.next = null;
                }
                self.len -= 1;
                node.prev = null;
                return node;
            } else {
                return null;
            }
        }

        pub fn shift(self: *LinkedList(T)) ?*Node {
            if (self.first != null) {
                var node = self.first.?;
                if (self.len == 1) {
                    self.last = null;
                    self.first = null;
                } else {
                    self.first = node.next;
                    self.first.?.prev = null;
                }
                self.len -= 1;
                node.next = null;
                return node;
            } else {
                return null;
            }
        }

        pub fn unshift(self: *LinkedList(T), node: *Node) void {
            node.next = self.first;
            node.prev = null;
            if (self.len == 0) {
                self.first = node;
                self.last = node;
            } else {
                node.next.?.prev = node;
                self.first = node;
            }
            self.len += 1;
        }

        pub fn delete(self: *LinkedList(T), node: *Node) void {
            var p = self.first;
            while (p != null) {
                if (p == node) {
                    if (p.?.prev != null) {
                        p.?.prev.?.next = p.?.next;
                    } else {
                        self.first = p.?.next;
                    }
                    if (p.?.next != null) {
                        p.?.next.?.prev = p.?.prev;
                    } else {
                        self.last = p.?.prev;
                    }
                    self.len -= 1;
                    node.next = null;
                    node.prev = null;
                    break;
                }
                p = p.?.next;
            }
        }
    };
}
