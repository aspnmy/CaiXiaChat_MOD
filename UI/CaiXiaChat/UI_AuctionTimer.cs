/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_AuctionTimer : GProgressBar
    {
        public GImage m_n0;
        public GImage m_bar;
        public Transition m_t0;
        public const string URL = "ui://gfenp5kwem56kq";

        public static UI_AuctionTimer CreateInstance()
        {
            return (UI_AuctionTimer)UIPackage.CreateObject("CaiXiaChat", "AuctionTimer");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GImage)GetChildAt(0);
            m_bar = (GImage)GetChildAt(1);
            m_t0 = GetTransitionAt(0);
        }
    }
}