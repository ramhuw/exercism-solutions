// TODO: define the 'AccountType' enum
enum AccountType
{
    Guest,
    User,
    Moderator
}

// TODO: define the 'Permission' enum
[Flags]
enum Permission
{
    Read = 1,
    Write = 2,
    Delete = 4,
    All = 7,
    None = 0
}

static class Permissions
{
    public static Permission Default(AccountType accountType)
    {
        switch (accountType)
        {
            case AccountType.Guest:
                return Permission.Read;
            case AccountType.User:
                return Permission.Write | Permission.Read;
            case AccountType.Moderator:
                return Permission.All;
            default:
                return Permission.None;
        }
    }

    public static Permission Grant(Permission current, Permission grant)
    {
        return current | grant;
    }

    public static Permission Revoke(Permission current, Permission revoke)
    {
        return current & ~revoke;
    }

    public static bool Check(Permission current, Permission check)
    {
        return (current & check) == check;
    }
}
