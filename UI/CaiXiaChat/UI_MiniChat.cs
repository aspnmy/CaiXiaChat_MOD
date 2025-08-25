/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_MiniChat : GLabel
    {
        public GGraph m_n5;
        public GGraph m_dragArea;
        public GButton m_n2;
        public UI_Slider m_n10;
        public GTextField m_n11;
        public GGraph m_n4;
        public GList m_ChatList;
        public UI_ChatArea m_n1;
        public GButton m_n12;
        public GButton m_n17;
        public UI_TextArea2 m_n14;
        public GGraph m_n16;
        public GButton m_n15;
        public GButton m_n19;
        public const string URL = "ui://gfenp5kwtrnyzq";

        public static UI_MiniChat CreateInstance()
        {
            return (UI_MiniChat)UIPackage.CreateObject("CaiXiaChat", "MiniChat");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n5 = (GGraph)GetChildAt(0);
            m_dragArea = (GGraph)GetChildAt(1);
            m_n2 = (GButton)GetChildAt(2);
            m_n10 = (UI_Slider)GetChildAt(3);
            m_n11 = (GTextField)GetChildAt(4);
            m_n4 = (GGraph)GetChildAt(5);
            m_ChatList = (GList)GetChildAt(6);
            m_n1 = (UI_ChatArea)GetChildAt(7);
            m_n12 = (GButton)GetChildAt(8);
            m_n17 = (GButton)GetChildAt(9);
            m_n14 = (UI_TextArea2)GetChildAt(10);
            m_n16 = (GGraph)GetChildAt(11);
            m_n15 = (GButton)GetChildAt(12);
            m_n19 = (GButton)GetChildAt(13);
        }
    }
}