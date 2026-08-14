static class SavingsAccount
{
    public static float InterestRate(decimal balance)
    {
        if (balance < 0)
        {
            return 3.213F;
        } else if (balance < 1000)
        {
            return 0.5F;
        } else if (balance < 5000)
        {
            return 1.621F;
        } else
        {
            return 2.475F;
        }
    }

    public static decimal Interest(decimal balance)
    {
        return balance * (decimal)SavingsAccount.InterestRate(balance) / 100;
    }

    public static decimal AnnualBalanceUpdate(decimal balance)
    {
        return balance + SavingsAccount.Interest(balance);
    }

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        bool flag = balance >= 0;
        int year = 0;
        decimal newBalance = balance;
        while (flag && newBalance < targetBalance || !flag && newBalance > targetBalance)
        {
            year += 1;
            newBalance = SavingsAccount.AnnualBalanceUpdate(newBalance);
        }
        return year;
    }
}
