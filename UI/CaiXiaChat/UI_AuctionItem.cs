/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_AuctionItem : GButton
    {
        public Controller m_button;
        public GImage m_n3;
        public GImage m_n4;
        public GTextField m_title;
        public GTextField m_rank;
        public GTextField m_state;
        public const string URL = "ui://gfenp5kwem56kj";

        public static UI_AuctionItem CreateInstance()
        {
            return (UI_AuctionItem)UIPackage.CreateObject("CaiXiaChat", "AuctionItem");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n3 = (GImage)GetChildAt(0);
            m_n4 = (GImage)GetChildAt(1);
            m_title = (GTextField)GetChildAt(2);
            m_rank = (GTextField)GetChildAt(3);
            m_state = (GTextField)GetChildAt(4);
        }
    }
}