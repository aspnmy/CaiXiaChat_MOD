/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_AuctionCall : GLabel
    {
        public GMovieClip m_n1;
        public GTextField m_title;
        public const string URL = "ui://gfenp5kwem56ko";

        public static UI_AuctionCall CreateInstance()
        {
            return (UI_AuctionCall)UIPackage.CreateObject("CaiXiaChat", "AuctionCall");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n1 = (GMovieClip)GetChildAt(0);
            m_title = (GTextField)GetChildAt(1);
        }
    }
}