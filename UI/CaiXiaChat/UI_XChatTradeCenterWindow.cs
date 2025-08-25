/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatTradeCenterWindow : GComponent
    {
        public GLabel m_frame;
        public GImage m_n1;
        public GList m_n2;
        public GButton m_n3;
        public GButton m_n4;
        public const string URL = "ui://gfenp5kwc7n1h";

        public static UI_CaiXiaChatTradeCenterWindow CreateInstance()
        {
            return (UI_CaiXiaChatTradeCenterWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatTradeCenterWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n1 = (GImage)GetChildAt(1);
            m_n2 = (GList)GetChildAt(2);
            m_n3 = (GButton)GetChildAt(3);
            m_n4 = (GButton)GetChildAt(4);
        }
    }
}