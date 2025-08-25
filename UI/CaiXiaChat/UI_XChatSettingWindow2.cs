/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatSettingWindow2 : GComponent
    {
        public GLabel m_frame;
        public GTextField m_n2;
        public UI_ComboBox m_n3;
        public GTextField m_n4;
        public GTextField m_n6;
        public GTextField m_n7;
        public UI_TextArea m_n8;
        public UI_TextArea_pw m_n9;
        public GButton m_n10;
        public GButton m_n11;
        public GButton m_n12;
        public GButton m_n13;
        public GButton m_n14;
        public UI_TextArea3 m_n16;
        public GButton m_n17;
        public const string URL = "ui://gfenp5kwes62k4";

        public static UI_CaiXiaChatSettingWindow2 CreateInstance()
        {
            return (UI_CaiXiaChatSettingWindow2)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatSettingWindow2");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n2 = (GTextField)GetChildAt(1);
            m_n3 = (UI_ComboBox)GetChildAt(2);
            m_n4 = (GTextField)GetChildAt(3);
            m_n6 = (GTextField)GetChildAt(4);
            m_n7 = (GTextField)GetChildAt(5);
            m_n8 = (UI_TextArea)GetChildAt(6);
            m_n9 = (UI_TextArea_pw)GetChildAt(7);
            m_n10 = (GButton)GetChildAt(8);
            m_n11 = (GButton)GetChildAt(9);
            m_n12 = (GButton)GetChildAt(10);
            m_n13 = (GButton)GetChildAt(11);
            m_n14 = (GButton)GetChildAt(12);
            m_n16 = (UI_TextArea3)GetChildAt(13);
            m_n17 = (GButton)GetChildAt(14);
        }
    }
}