/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatProfileWindow : GComponent
    {
        public GLabel m_frame;
        public GImage m_n26;
        public UI_Avatar m_n12;
        public GTextField m_n1;
        public UI_TextArea m_n5;
        public GTextField m_n8;
        public UI_ComboBox m_n10;
        public GTextField m_n16;
        public UI_TextArea_WelcomeText m_n19;
        public GButton m_n20;
        public GButton m_n21;
        public GTextField m_n22;
        public GTextField m_n27;
        public UI_ComboBoxPopup m_n23;
        public GList m_n24;
        public GGroup m_n25;
        public GTextField m_n28;
        public GTextField m_UserID;
        public const string URL = "ui://gfenp5kwzr2bzi";

        public static UI_CaiXiaChatProfileWindow CreateInstance()
        {
            return (UI_CaiXiaChatProfileWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatProfileWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n26 = (GImage)GetChildAt(1);
            m_n12 = (UI_Avatar)GetChildAt(2);
            m_n1 = (GTextField)GetChildAt(3);
            m_n5 = (UI_TextArea)GetChildAt(4);
            m_n8 = (GTextField)GetChildAt(5);
            m_n10 = (UI_ComboBox)GetChildAt(6);
            m_n16 = (GTextField)GetChildAt(7);
            m_n19 = (UI_TextArea_WelcomeText)GetChildAt(8);
            m_n20 = (GButton)GetChildAt(9);
            m_n21 = (GButton)GetChildAt(10);
            m_n22 = (GTextField)GetChildAt(11);
            m_n27 = (GTextField)GetChildAt(12);
            m_n23 = (UI_ComboBoxPopup)GetChildAt(13);
            m_n24 = (GList)GetChildAt(14);
            m_n25 = (GGroup)GetChildAt(15);
            m_n28 = (GTextField)GetChildAt(16);
            m_UserID = (GTextField)GetChildAt(17);
        }
    }
}