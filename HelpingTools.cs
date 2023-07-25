using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KristiLakeTrailPOI_api
{
    public static class HelpingTools
    {
        public static string Base64Encode(string givenString)
        {
            return Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(givenString));
        }

        public static string faultTolerantBase64Decode(string givenString)
        {
            return faultTolerantBase64Decode(givenString, false); //the default is to return empty string if decode fails...
        }

        public static string faultTolerantBase64Decode(string givenString, bool IfFailReturnGivenString)
        {
            string rezult = "";
            // all this shit because base64 is encoded sloppily but .NET is kinda rigid about the final padding...
            //briefly considered doing this with recursion - would  be simple enough - and no - this works OK...
            try
            {
                rezult = System.Text.Encoding.ASCII.GetString(Convert.FromBase64String(givenString));
            }
            catch
            {
                try
                {
                    rezult = System.Text.Encoding.ASCII.GetString(Convert.FromBase64String(givenString + "="));
                }
                catch
                {
                    try
                    {
                        rezult = System.Text.Encoding.ASCII.GetString(Convert.FromBase64String(givenString + "=="));
                    }
                    catch
                    {
                        try
                        {
                            rezult = System.Text.Encoding.ASCII.GetString(Convert.FromBase64String(givenString + "==="));
                        }
                        catch
                        {
                            rezult = ""; //default to return empty string
                            if (IfFailReturnGivenString) { rezult = givenString; }
                        }
                    }
                }
            }
            return rezult;
        }
    }
}