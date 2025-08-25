/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatSettingWindow : GComponent
    {
        public GLabel m_frame;
        public UI_IPInput m_n1;
        public UI_TextArea m_n2;
        public GTextField m_n3;
        public GTextField m_n4;
        public GButton m_n5;
        public GButton m_n6;
        public GTextField m_n8;
        public GTextField m_n9;
        public UI_TextArea_pw m_n10;
        public GTextField m_n11;
        public UI_PortInput m_n12;
        public GComboBox m_n13;
        public GButton m_n16;
        public GButton m_n17;
        public const string URL = "ui://gfenp5kwgj3ic";

        public static UI_CaiXiaChatSettingWindow CreateInstance()
        {
            return (UI_CaiXiaChatSettingWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatSettingWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n1 = (UI_IPInput)GetChildAt(1);
            m_n2 = (UI_TextArea)GetChildAt(2);
            m_n3 = (GTextField)GetChildAt(3);
            m_n4 = (GTextField)GetChildAt(4);
            m_n5 = (GButton)GetChildAt(5);
            m_n6 = (GButton)GetChildAt(6);
            m_n8 = (GTextField)GetChildAt(7);
            m_n9 = (GTextField)GetChildAt(8);
            m_n10 = (UI_TextArea_pw)GetChildAt(9);
            m_n11 = (GTextField)GetChildAt(10);
            m_n12 = (UI_PortInput)GetChildAt(11);
            m_n13 = (GComboBox)GetChildAt(12);
            m_n16 = (GButton)GetChildAt(13);
            m_n17 = (GButton)GetChildAt(14);
        }
    }
}