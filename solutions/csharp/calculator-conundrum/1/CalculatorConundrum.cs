using System;
public static class SimpleCalculator
{
    public static string Calculate(int operand1, int operand2, string? operation)
    {
        switch (operation)
        {
            case "+":
                return $"{operand1} + {operand2} = {(operand1 + operand2).ToString()}";
            case "*":
                return $"{operand1} * {operand2} = {(operand1 * operand2).ToString()}";
            case "/":
                if (operand2 != 0)
                {
                    return $"{operand1} / {operand2} = {(operand1 / operand2).ToString()}";
                } else
                {
                    return "Division by zero is not allowed.";
                }
                case null:
                throw new ArgumentNullException();
                case "":
                throw new ArgumentException();
                default:
                throw new ArgumentOutOfRangeException();
        }

    }
}
