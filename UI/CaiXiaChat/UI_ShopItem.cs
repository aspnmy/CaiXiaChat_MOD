/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ShopItem : GButton
    {
        public GGraph m_n12;
        public GImage m_n7;
        public GLoader m_icon;
        public GTextField m_title;
        public GTextField m_price;
        public GButton m_buy;
        public GGraph m_n16;
        public GTextField m_SpecialText;
        public GGroup m_Special;
        public const string URL = "ui://gfenp5kwyb9bzb";

        public static UI_ShopItem CreateInstance()
        {
            return (UI_ShopItem)UIPackage.CreateObject("CaiXiaChat", "ShopItem");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n12 = (GGraph)GetChildAt(0);
            m_n7 = (GImage)GetChildAt(1);
            m_icon = (GLoader)GetChildAt(2);
            m_title = (GTextField)GetChildAt(3);
            m_price = (GTextField)GetChildAt(4);
            m_buy = (GButton)GetChildAt(5);
            m_n16 = (GGraph)GetChildAt(6);
            m_SpecialText = (GTextField)GetChildAt(7);
            m_Special = (GGroup)GetChildAt(8);
        }
    }
}