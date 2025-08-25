/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_AuctionText : GLabel
    {
        public GRichTextField m_title;
        public const string URL = "ui://gfenp5kwem56kk";

        public static UI_AuctionText CreateInstance()
        {
            return (UI_AuctionText)UIPackage.CreateObject("CaiXiaChat", "AuctionText");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_title = (GRichTextField)GetChildAt(0);
        }
    }
}