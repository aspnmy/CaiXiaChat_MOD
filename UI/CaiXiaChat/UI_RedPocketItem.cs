/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_RedPocketItem : GButton
    {
        public Controller m_button;
        public GImage m_n4;
        public GImage m_n5;
        public GTextField m_title;
        public GTextField m_data;
        public const string URL = "ui://gfenp5kwvui8l0";

        public static UI_RedPocketItem CreateInstance()
        {
            return (UI_RedPocketItem)UIPackage.CreateObject("CaiXiaChat", "RedPocketItem");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n4 = (GImage)GetChildAt(0);
            m_n5 = (GImage)GetChildAt(1);
            m_title = (GTextField)GetChildAt(2);
            m_data = (GTextField)GetChildAt(3);
        }
    }
}