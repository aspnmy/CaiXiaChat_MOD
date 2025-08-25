/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ListItem : GButton
    {
        public Controller m_button;
        public GImage m_n0;
        public GImage m_n1;
        public GTextField m_from;
        public GTextField m_itemname;
        public GTextField m_quantity;
        public GTextField m_price;
        public GButton m_TradeBtn;
        public GTextField m_n10;
        public GTextField m_n11;
        public const string URL = "ui://gfenp5kwc7n19a";

        public static UI_ListItem CreateInstance()
        {
            return (UI_ListItem)UIPackage.CreateObject("CaiXiaChat", "ListItem");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n0 = (GImage)GetChildAt(0);
            m_n1 = (GImage)GetChildAt(1);
            m_from = (GTextField)GetChildAt(2);
            m_itemname = (GTextField)GetChildAt(3);
            m_quantity = (GTextField)GetChildAt(4);
            m_price = (GTextField)GetChildAt(5);
            m_TradeBtn = (GButton)GetChildAt(6);
            m_n10 = (GTextField)GetChildAt(7);
            m_n11 = (GTextField)GetChildAt(8);
        }
    }
}