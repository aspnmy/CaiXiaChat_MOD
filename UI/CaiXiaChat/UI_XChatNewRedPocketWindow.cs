/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatNewRedPocketWindow : GComponent
    {
        public GLabel m_frame;
        public GButton m_n2;
        public GButton m_n3;
        public GTextField m_n6;
        public GImage m_n10;
        public GTextField m_n11;
        public GTextInput m_n12;
        public GImage m_n13;
        public GTextField m_n14;
        public GTextInput m_n15;
        public GTextField m_n21;
        public GTextField m_n22;
        public UI_ComboBox m_n24;
        public const string URL = "ui://gfenp5kwvui8ky";

        public static UI_CaiXiaChatNewRedPocketWindow CreateInstance()
        {
            return (UI_CaiXiaChatNewRedPocketWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatNewRedPocketWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n2 = (GButton)GetChildAt(1);
            m_n3 = (GButton)GetChildAt(2);
            m_n6 = (GTextField)GetChildAt(3);
            m_n10 = (GImage)GetChildAt(4);
            m_n11 = (GTextField)GetChildAt(5);
            m_n12 = (GTextInput)GetChildAt(6);
            m_n13 = (GImage)GetChildAt(7);
            m_n14 = (GTextField)GetChildAt(8);
            m_n15 = (GTextInput)GetChildAt(9);
            m_n21 = (GTextField)GetChildAt(10);
            m_n22 = (GTextField)GetChildAt(11);
            m_n24 = (UI_ComboBox)GetChildAt(12);
        }
    }
}