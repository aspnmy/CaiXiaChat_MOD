/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_AuctionHead : GLabel
    {
        public Controller m_button;
        public GImage m_n5;
        public GTextField m_title;
        public GTextField m_rank;
        public GTextField m_state;
        public const string URL = "ui://gfenp5kwkhpnkr";

        public static UI_AuctionHead CreateInstance()
        {
            return (UI_AuctionHead)UIPackage.CreateObject("CaiXiaChat", "AuctionHead");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n5 = (GImage)GetChildAt(0);
            m_title = (GTextField)GetChildAt(1);
            m_rank = (GTextField)GetChildAt(2);
            m_state = (GTextField)GetChildAt(3);
        }
    }
}