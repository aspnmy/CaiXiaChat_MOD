/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatGameRankWindow : GComponent
    {
        public GLabel m_frame;
        public GImage m_n3;
        public GList m_n2;
        public GButton m_n4;
        public GList m_n5;
        public const string URL = "ui://gfenp5kwtrnyzn";

        public static UI_CaiXiaChatGameRankWindow CreateInstance()
        {
            return (UI_CaiXiaChatGameRankWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatGameRankWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n3 = (GImage)GetChildAt(1);
            m_n2 = (GList)GetChildAt(2);
            m_n4 = (GButton)GetChildAt(3);
            m_n5 = (GList)GetChildAt(4);
        }
    }
}