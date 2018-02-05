using System.Linq;

/// <summary>
/// Summary description for GlobalArrays
/// </summary>
public class GlobalArrays
{
    static string[] array;
    public GlobalArrays()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static void fillarray(string arraystring, char delimeter)
    {
        array = arraystring.Split(delimeter);
    }
    public static bool validvalue(string value)
    {
        if (array.Contains(value))
            return true;
        else
            return false;

    }
    public static string[] returnarray()
    {
        return array;
    }
}