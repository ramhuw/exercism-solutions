#include "queen_attack.h"

attack_status_t can_attack(position_t queen_1, position_t queen_2) {
    if (on_board(queen_1) == 0 || on_board(queen_2) == 0 || (queen_1.row == queen_2.row && queen_1.column == queen_2.column)) {
        return INVALID_POSITION;
    }
    if (queen_1.column == queen_2.column || queen_1.row == queen_2.row) {
        return CAN_ATTACK;
    }
    position_t queen_right = queen_1.column > queen_2.column ? queen_1 : queen_2;
    position_t queen_left = queen_1.column < queen_2.column ? queen_1 : queen_2;
    if (queen_right.row > queen_left.row && queen_right.row - queen_left.row == queen_right.column - queen_left.column) {
        return CAN_ATTACK;
    }
    if (queen_right.row < queen_left.row && queen_left.row - queen_right.row == queen_right.column - queen_left.column) {
        return CAN_ATTACK;
    }
    return CAN_NOT_ATTACK;
}

int on_board(position_t queen) {
    return queen.column < 64 && queen.row < 64 ? 1 : 0;
}