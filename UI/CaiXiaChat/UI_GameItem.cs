/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_GameItem : GLabel
    {
        public GGraph m_n0;
        public GTextField m_title;
        public GTextField m_prizepool;
        public GTextField m_topinfo;
        public GButton m_n4;
        public GButton m_n6;
        public const string URL = "ui://gfenp5kwtrnyzp";

        public static UI_GameItem CreateInstance()
        {
            return (UI_GameItem)UIPackage.CreateObject("CaiXiaChat", "GameItem");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GGraph)GetChildAt(0);
            m_title = (GTextField)GetChildAt(1);
            m_prizepool = (GTextField)GetChildAt(2);
            m_topinfo = (GTextField)GetChildAt(3);
            m_n4 = (GButton)GetChildAt(4);
            m_n6 = (GButton)GetChildAt(5);
        }
    }
}