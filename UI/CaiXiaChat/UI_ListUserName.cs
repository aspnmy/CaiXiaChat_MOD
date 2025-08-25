/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ListUserName : GButton
    {
        public Controller m_button;
        public GImage m_n0;
        public GImage m_n1;
        public GTextField m_title;
        public GButton m_TradeBtn;
        public const string URL = "ui://gfenp5kwrnvl116";

        public static UI_ListUserName CreateInstance()
        {
            return (UI_ListUserName)UIPackage.CreateObject("CaiXiaChat", "ListUserName");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n0 = (GImage)GetChildAt(0);
            m_n1 = (GImage)GetChildAt(1);
            m_title = (GTextField)GetChildAt(2);
            m_TradeBtn = (GButton)GetChildAt(3);
        }
    }
}