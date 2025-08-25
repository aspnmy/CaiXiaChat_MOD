/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_Tab : GButton
    {
        public Controller m_button;
        public GImage m_n2;
        public GTextField m_title;
        public const string URL = "ui://gfenp5kwo57lzh";

        public static UI_Tab CreateInstance()
        {
            return (UI_Tab)UIPackage.CreateObject("CaiXiaChat", "Tab");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n2 = (GImage)GetChildAt(0);
            m_title = (GTextField)GetChildAt(1);
        }
    }
}