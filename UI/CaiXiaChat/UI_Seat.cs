/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_Seat : GButton
    {
        public Controller m_button;
        public Controller m_c1;
        public GImage m_n2;
        public GImage m_n1;
        public GTextField m_title;
        public GImage m_n3;
        public GTextField m_n4;
        public Transition m_CallPrice;
        public const string URL = "ui://gfenp5kwem56ki";

        public static UI_Seat CreateInstance()
        {
            return (UI_Seat)UIPackage.CreateObject("CaiXiaChat", "Seat");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_c1 = GetControllerAt(1);
            m_n2 = (GImage)GetChildAt(0);
            m_n1 = (GImage)GetChildAt(1);
            m_title = (GTextField)GetChildAt(2);
            m_n3 = (GImage)GetChildAt(3);
            m_n4 = (GTextField)GetChildAt(4);
            m_CallPrice = GetTransitionAt(0);
        }
    }
}