/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_SearchUser : GLabel
    {
        public Controller m_grayed;
        public GImage m_n0;
        public GTextInput m_title;
        public const string URL = "ui://gfenp5kwo57lzg";

        public static UI_SearchUser CreateInstance()
        {
            return (UI_SearchUser)UIPackage.CreateObject("CaiXiaChat", "SearchUser");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_grayed = GetControllerAt(0);
            m_n0 = (GImage)GetChildAt(0);
            m_title = (GTextInput)GetChildAt(1);
        }
    }
}