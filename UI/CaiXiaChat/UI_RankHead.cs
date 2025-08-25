/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_RankHead : GLabel
    {
        public GImage m_n3;
        public GTextField m_title;
        public GTextField m_rank;
        public GTextField m_data;
        public const string URL = "ui://gfenp5kwxc8pkf";

        public static UI_RankHead CreateInstance()
        {
            return (UI_RankHead)UIPackage.CreateObject("CaiXiaChat", "RankHead");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n3 = (GImage)GetChildAt(0);
            m_title = (GTextField)GetChildAt(1);
            m_rank = (GTextField)GetChildAt(2);
            m_data = (GTextField)GetChildAt(3);
        }
    }
}