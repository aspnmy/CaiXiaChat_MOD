/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatAuctionWindow : GComponent
    {
        public Controller m_c1;
        public GLabel m_frame;
        public GImage m_n1;
        public GList m_n2;
        public GList m_n3;
        public GTextField m_n20;
        public GTextField m_n21;
        public GTextField m_n22;
        public GImage m_n23;
        public GList m_n25;
        public GTextField m_n26;
        public GTextField m_n27;
        public GTextField m_n28;
        public GTextField m_n29;
        public UI_AcutionInfo m_n31;
        public UI_AcutionInfo m_n32;
        public UI_AcutionInfo m_n33;
        public UI_AcutionInfo m_n34;
        public GButton m_n35;
        public GTextField m_n36;
        public UI_AcutionInfo m_n37;
        public GTextField m_n38;
        public UI_AcutionInfo m_n39;
        public UI_AuctionCall m_n41;
        public Transition m_CallPrice;
        public Transition m_wait;
        public const string URL = "ui://gfenp5kwem56kg";

        public static UI_CaiXiaChatAuctionWindow CreateInstance()
        {
            return (UI_CaiXiaChatAuctionWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatAuctionWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_c1 = GetControllerAt(0);
            m_frame = (GLabel)GetChildAt(0);
            m_n1 = (GImage)GetChildAt(1);
            m_n2 = (GList)GetChildAt(2);
            m_n3 = (GList)GetChildAt(3);
            m_n20 = (GTextField)GetChildAt(4);
            m_n21 = (GTextField)GetChildAt(5);
            m_n22 = (GTextField)GetChildAt(6);
            m_n23 = (GImage)GetChildAt(7);
            m_n25 = (GList)GetChildAt(8);
            m_n26 = (GTextField)GetChildAt(9);
            m_n27 = (GTextField)GetChildAt(10);
            m_n28 = (GTextField)GetChildAt(11);
            m_n29 = (GTextField)GetChildAt(12);
            m_n31 = (UI_AcutionInfo)GetChildAt(13);
            m_n32 = (UI_AcutionInfo)GetChildAt(14);
            m_n33 = (UI_AcutionInfo)GetChildAt(15);
            m_n34 = (UI_AcutionInfo)GetChildAt(16);
            m_n35 = (GButton)GetChildAt(17);
            m_n36 = (GTextField)GetChildAt(18);
            m_n37 = (UI_AcutionInfo)GetChildAt(19);
            m_n38 = (GTextField)GetChildAt(20);
            m_n39 = (UI_AcutionInfo)GetChildAt(21);
            m_n41 = (UI_AuctionCall)GetChildAt(22);
            m_CallPrice = GetTransitionAt(0);
            m_wait = GetTransitionAt(1);
        }
    }
}