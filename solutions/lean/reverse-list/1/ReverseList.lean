import Extra
#print List.reverseAux
namespace ReverseList

@[csimp]
theorem custom_reverse_eq_spec_reverse: @Extra.custom_reverse = @List.reverse := by
  funext a l
  induction l with
    | nil => simp [Extra.custom_reverse]
    | cons head tail h =>
    simp [Extra.custom_reverse]
    exact h
