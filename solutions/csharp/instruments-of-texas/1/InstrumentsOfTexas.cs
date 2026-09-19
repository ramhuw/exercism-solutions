public class CalculationException : Exception
{
    public string message;
    Exception inner;
    public CalculationException(int operand1, int operand2, string message, Exception inner)
    {
        Operand1 = operand1;
        Operand2 = operand2;
        this.message = message;
        this.inner = inner;
    }

    public int Operand1 { get; }
    public int Operand2 { get; }
}

public class CalculatorTestHarness
{
    private Calculator calculator;

    public CalculatorTestHarness(Calculator calculator)
    {
        this.calculator = calculator;
    }

    public string TestMultiplication(int x, int y)
    {
        try
        {
            this.Multiply(x, y);
            return "Multiply succeeded";
        }
        catch (CalculationException ex)
        {
            if (x < 0 && y < 0)
            {
                return "Multiply failed for negative operands. " + ex.message;
            }
            else
            {
                return "Multiply failed for mixed or positive operands. " + ex.message;
            }
        }
    }

    public void Multiply(int x, int y)
    {
        try
        {
            calculator.Multiply(x, y);
        } catch (System.OverflowException ex) 
        {
            throw new CalculationException(x, y, ex.Message, ex);
        }
    }
}


// Please do not modify the code below.
// If there is an overflow in the multiplication operation
// then a System.OverflowException is thrown.
public class Calculator
{
    public int Multiply(int x, int y)
    {
        checked
        {
            return x * y;
        }
    }
}
