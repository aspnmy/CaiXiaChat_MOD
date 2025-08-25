/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatNewTradeWindow : GComponent
    {
        public GLabel m_frame;
        public GButton m_n2;
        public GButton m_n3;
        public GImage m_n4;
        public GTextField m_n6;
        public GRichTextField m_n9;
        public GImage m_n10;
        public GTextField m_n11;
        public GTextInput m_n12;
        public GImage m_n13;
        public GTextField m_n14;
        public GTextInput m_n15;
        public GTextField m_n17;
        public GTextField m_n19;
        public GTextField m_n20;
        public GTextField m_n21;
        public const string URL = "ui://gfenp5kwic5b9b";

        public static UI_CaiXiaChatNewTradeWindow CreateInstance()
        {
            return (UI_CaiXiaChatNewTradeWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatNewTradeWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n2 = (GButton)GetChildAt(1);
            m_n3 = (GButton)GetChildAt(2);
            m_n4 = (GImage)GetChildAt(3);
            m_n6 = (GTextField)GetChildAt(4);
            m_n9 = (GRichTextField)GetChildAt(5);
            m_n10 = (GImage)GetChildAt(6);
            m_n11 = (GTextField)GetChildAt(7);
            m_n12 = (GTextInput)GetChildAt(8);
            m_n13 = (GImage)GetChildAt(9);
            m_n14 = (GTextField)GetChildAt(10);
            m_n15 = (GTextInput)GetChildAt(11);
            m_n17 = (GTextField)GetChildAt(12);
            m_n19 = (GTextField)GetChildAt(13);
            m_n20 = (GTextField)GetChildAt(14);
            m_n21 = (GTextField)GetChildAt(15);
        }
    }
}