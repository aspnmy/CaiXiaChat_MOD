/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatWindow : GComponent
    {
        public GLabel m_frame;
        public GImage m_n24;
        public GList m_ChatList;
        public UI_ChatArea m_n1;
        public GImage m_n26;
        public UI_TextArea2 m_n2;
        public GImage m_n25;
        public GButton m_n13;
        public GButton m_n3;
        public GList m_searchlist;
        public GList m_n8;
        public GTextField m_n9;
        public GTextField m_n11;
        public GTextField m_n12;
        public GButton m_n20;
        public GButton m_n4;
        public GButton m_n27;
        public GButton m_n28;
        public GRichTextField m_n30;
        public GTextField m_n31;
        public GImage m_n34;
        public GList m_n33;
        public UI_Checkbox m_n35;
        public GButton m_n36;
        public GButton m_n37;
        public UI_NewMessageTip m_n39;
        public GButton m_n40;
        public GButton m_n41;
        public UI_SearchUser m_n43;
        public GButton m_n46;
        public GButton m_n47;
        public Transition m_t0;
        public const string URL = "ui://gfenp5kwvhyx0";

        public static UI_CaiXiaChatWindow CreateInstance()
        {
            return (UI_CaiXiaChatWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n24 = (GImage)GetChildAt(1);
            m_ChatList = (GList)GetChildAt(2);
            m_n1 = (UI_ChatArea)GetChildAt(3);
            m_n26 = (GImage)GetChildAt(4);
            m_n2 = (UI_TextArea2)GetChildAt(5);
            m_n25 = (GImage)GetChildAt(6);
            m_n13 = (GButton)GetChildAt(7);
            m_n3 = (GButton)GetChildAt(8);
            m_searchlist = (GList)GetChildAt(9);
            m_n8 = (GList)GetChildAt(10);
            m_n9 = (GTextField)GetChildAt(11);
            m_n11 = (GTextField)GetChildAt(12);
            m_n12 = (GTextField)GetChildAt(13);
            m_n20 = (GButton)GetChildAt(14);
            m_n4 = (GButton)GetChildAt(15);
            m_n27 = (GButton)GetChildAt(16);
            m_n28 = (GButton)GetChildAt(17);
            m_n30 = (GRichTextField)GetChildAt(18);
            m_n31 = (GTextField)GetChildAt(19);
            m_n34 = (GImage)GetChildAt(20);
            m_n33 = (GList)GetChildAt(21);
            m_n35 = (UI_Checkbox)GetChildAt(22);
            m_n36 = (GButton)GetChildAt(23);
            m_n37 = (GButton)GetChildAt(24);
            m_n39 = (UI_NewMessageTip)GetChildAt(25);
            m_n40 = (GButton)GetChildAt(26);
            m_n41 = (GButton)GetChildAt(27);
            m_n43 = (UI_SearchUser)GetChildAt(28);
            m_n46 = (GButton)GetChildAt(29);
            m_n47 = (GButton)GetChildAt(30);
            m_t0 = GetTransitionAt(0);
        }
    }
}