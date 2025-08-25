/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatDonateWindow : GComponent
    {
        public GLabel m_frame;
        public GButton m_n2;
        public GButton m_n4;
        public GImage m_n6;
        public GImage m_n5;
        public const string URL = "ui://gfenp5kwo57lzc";

        public static UI_CaiXiaChatDonateWindow CreateInstance()
        {
            return (UI_CaiXiaChatDonateWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatDonateWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n2 = (GButton)GetChildAt(1);
            m_n4 = (GButton)GetChildAt(2);
            m_n6 = (GImage)GetChildAt(3);
            m_n5 = (GImage)GetChildAt(4);
        }
    }
}