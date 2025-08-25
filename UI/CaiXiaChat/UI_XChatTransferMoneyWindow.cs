/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatTransferMoneyWindow : GComponent
    {
        public GLabel m_frame;
        public GButton m_n2;
        public GButton m_n3;
        public GTextField m_n6;
        public GImage m_n7;
        public GTextField m_n8;
        public GImage m_n13;
        public GTextField m_n14;
        public GTextInput m_n15;
        public GTextField m_n21;
        public GTextField m_n22;
        public GTextField m_n27;
        public GTextField m_n28;
        public GTextField m_n29;
        public const string URL = "ui://gfenp5kwvui8l3";

        public static UI_CaiXiaChatTransferMoneyWindow CreateInstance()
        {
            return (UI_CaiXiaChatTransferMoneyWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatTransferMoneyWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n2 = (GButton)GetChildAt(1);
            m_n3 = (GButton)GetChildAt(2);
            m_n6 = (GTextField)GetChildAt(3);
            m_n7 = (GImage)GetChildAt(4);
            m_n8 = (GTextField)GetChildAt(5);
            m_n13 = (GImage)GetChildAt(6);
            m_n14 = (GTextField)GetChildAt(7);
            m_n15 = (GTextInput)GetChildAt(8);
            m_n21 = (GTextField)GetChildAt(9);
            m_n22 = (GTextField)GetChildAt(10);
            m_n27 = (GTextField)GetChildAt(11);
            m_n28 = (GTextField)GetChildAt(12);
            m_n29 = (GTextField)GetChildAt(13);
        }
    }
}