/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatShopWindow : GComponent
    {
        public GLabel m_frame;
        public GImage m_n4;
        public GList m_n2;
        public GButton m_n1;
        public GTextField m_n5;
        public GTextField m_n6;
        public GButton m_n8;
        public GTextField m_n10;
        public GTextField m_n11;
        public GTextField m_n12;
        public GTextField m_n13;
        public GTextField m_n14;
        public GTextField m_n15;
        public GTextField m_n16;
        public const string URL = "ui://gfenp5kwyb9bz9";

        public static UI_CaiXiaChatShopWindow CreateInstance()
        {
            return (UI_CaiXiaChatShopWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatShopWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n4 = (GImage)GetChildAt(1);
            m_n2 = (GList)GetChildAt(2);
            m_n1 = (GButton)GetChildAt(3);
            m_n5 = (GTextField)GetChildAt(4);
            m_n6 = (GTextField)GetChildAt(5);
            m_n8 = (GButton)GetChildAt(6);
            m_n10 = (GTextField)GetChildAt(7);
            m_n11 = (GTextField)GetChildAt(8);
            m_n12 = (GTextField)GetChildAt(9);
            m_n13 = (GTextField)GetChildAt(10);
            m_n14 = (GTextField)GetChildAt(11);
            m_n15 = (GTextField)GetChildAt(12);
            m_n16 = (GTextField)GetChildAt(13);
        }
    }
}